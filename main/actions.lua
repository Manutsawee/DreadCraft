GLOBAL.setfenv(1, GLOBAL)

local function TriggerAbility(sanity_precent)
    if sanity_precent == 1 then
        return math.random() <= 0.35
    elseif sanity_precent == 0 then
        return math.random() <= 0.65
    elseif sanity_precent < 1 and sanity_precent ~= 0 then
        return math.random() <= 0.45
    else
        return false
    end
end

local _DoToolWork = Util.GetUpvalue(ACTIONS.MINE.fn, "DoToolWork")
local function DoToolWork(act, workaction, ...)
    local equip = act.invobject
    local worker = act.doer
    local target = act.target
    local sanity_precent = worker.components.sanity ~= nil and worker.components.sanity:GetPercent()

    if not (equip and worker and target and sanity_precent) then --如果不是人就别搞事了
        return _DoToolWork(act, workaction, ...)
    end

    if worker.sg ~= nil and equip:HasTag("dread_pickaxe") and worker.sg.statemem.recoilstate ~= nil then
        worker.sg:GoToState(worker.sg.statemem.recoilstate, { target = target })
    end

    if target ~= nil and target.components.workable ~= nil and equip:HasTag("dread_pickaxe") and TriggerAbility(sanity_precent) then
        -- Compatible with corals in island adventure
        -- 兼容岛屿冒险(联机海难)中的珊瑚
        if target:HasTag("coral") and target.components.growable.stage ~= 2 and target.components.growable.stage ~= 1 and workaction ~= ACTIONS.HAMMER then
            local pt = Point(target.Transform:GetWorldPosition())
            target.components.growable:SetStage(2)
            target.components.lootdropper:DropLoot(pt)
        else
            target.components.workable.workleft = 1
        end
    end

    return _DoToolWork(act, workaction, ...)
end

Util.SetUpvalue(ACTIONS.MINE.fn, DoToolWork, "DoToolWork")
