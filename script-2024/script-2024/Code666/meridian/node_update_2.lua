--[[
    Module: Huy�t v� y�u c�u c�p �� huy�t v� kh�c
    M� t�: Module n�y ch�a c�c h�m ki�m tra xem ng��i ch�i �� ��p �ng �i�u ki�n
           �� k�ch ho�t m�t huy�t v� c� th� (trong tr��ng h�p n�y l� huy�t v� c� ID l� 2) hay ch�a.
           �i�u ki�n d�a tr�n vi�c ��t ��n m�t c�p �� y�u c�u � m�t s� huy�t v� kh�c.
]]

-- H�m l�y ch� s� c�a m�t huy�t v� trong danh s�ch
function _get_this_node_index(nNodeId)
    local nThisIndex = 0
    for i = 1, #t_node_id_list do -- Duy�t qua danh s�ch t_node_id_list
        if t_node_id_list[i] == nNodeId then -- Ki�m tra xem c� tr�ng v�i nNodeId kh�ng
            nThisIndex = i
            break
        end
    end
    return nThisIndex
end

-- H�m t�nh to�n c�p �� y�u c�u c�a huy�t v� �i�u ki�n
function _get_require_level(nLevel)
    return nLevel - 1 -- C�p �� y�u c�u th�p h�n 1 c�p so v�i c�p �� hi�n t�i c�a huy�t v� c�n ki�m tra
end

-- Danh s�ch ID c�c huy�t v� c�n ki�m tra �i�u ki�n
t_node_id_list = {2} -- Huy�t v� v�i ID 2 l� ��i t��ng c�n ki�m tra trong v� d� n�y

-- Danh s�ch c�c huy�t v� �i�u ki�n v� c�p �� y�u c�u t��ng �ng
t_require_node_list = {
    {36, "Tinh Minh", _get_require_level}, -- Huy�t v� "Tinh Minh" (ID 36) l� �i�u ki�n, c�p �� y�u c�u t�nh b�ng h�m _get_require_level
}

--[[
    H�m: CheckCondition
    Tham s�:
        - nNodeId: ID c�a huy�t v� c�n ki�m tra.
        - nLevel: C�p �� hi�n t�i c�a huy�t v� c�n ki�m tra.
        - bNotify: C� th�ng b�o (1: hi�n th� th�ng b�o l�i, 0: kh�ng hi�n th�).
    M� t�:
        Ki�m tra xem c�c huy�t v� �i�u ki�n �� ��t c�p �� y�u c�u hay ch�a.
    Tr� v�: 1 n�u t�t c� c�c huy�t v� �i�u ki�n ��u ��t y�u c�u, 0 n�u kh�ng.
]]
function CheckCondition(nNodeId, nLevel, bNotify)
    -- N�u nNodeId c� trong t_node_id_list th� m�i c�n ki�m tra �i�u ki�n
    local nThisIndex = _get_this_node_index(nNodeId)
    if nThisIndex > 0 then
        for i = 1, #t_require_node_list do  -- Duy�t qua danh s�ch c�c huy�t v� �i�u ki�n
            local nRequireLevel = t_require_node_list[i][3](nLevel)  -- T�nh c�p �� y�u c�u c�a huy�t v� hi�n t�i
            local nCheckNodeId = t_require_node_list[i][1]  -- L�y ID c�a huy�t v� �i�u ki�n
            local nCheckNodeLevel = MeridianGetNodeLevel(nCheckNodeId) or 0  -- L�y c�p �� hi�n t�i c�a huy�t v� �i�u ki�n, m�c ��nh 0 n�u ch�a ���c k�ch ho�t
            if nCheckNodeLevel < nRequireLevel then  -- N�u ch�a ��t y�u c�u
                if bNotify == 1 then
                    Msg2Player(string.format("%s huy�t v� ch�a ��t ��n t�ng %d, �i�m huy�t th�t b�i", t_require_node_list[i][2], nRequireLevel)) -- Hi�n th� th�ng b�o l�i
                end
                return 0  -- Tr� v� th�t b�i
            end
        end
    end

    return 1  -- Th�nh c�ng
end

--[[
    H�m: GetConditionDesc
    Tham s�:
        - nNodeId: ID c�a huy�t v�.
        - nLevel: C�p �� c�a huy�t v�.
    M� t�:
        L�y m� t� c�c �i�u ki�n c�n thi�t �� k�ch ho�t huy�t v� (n�u c�).
    Tr� v�: Chu�i m� t� �i�u ki�n.
]]
function GetConditionDesc(nNodeId, nLevel)
    local str = ""
    -- N�u nNodeId c� trong t_node_id_list th� m�i c�n l�y m� t� �i�u ki�n
    if _get_this_node_index(nNodeId) > 0 then
        for i = 1, #t_require_node_list do
            local nRequireLevel = t_require_node_list[i][3](nLevel)
            -- Ch� l�y m� t� n�u c�p �� y�u c�u >= 1 (c� ngh�a l� huy�t v� n�y l� m�t �i�u ki�n)
            if nRequireLevel >= 1 then
                local strTemp = string.format("%s huy�t v� �� ��t t�ng %d", t_require_node_list[i][2], nRequireLevel)
                if i == 1 then
                    str = strTemp
                else
                    str = str .. "\n" .. strTemp
                end
            end
        end
    end
    return str
end

--[[
    H�m: DoLevelUpdateCallBack
    Tham s�:
        - nNodeId: ID c�a huy�t v� ���c c�p nh�t.
        - nNewLevel: C�p �� m�i c�a huy�t v�.
    M� t�:
        H�m g�i l�i sau khi c�p �� huy�t v� ���c c�p nh�t.
        Hi�n t�i kh�ng c� h�nh ��ng c� th� n�o ���c th�c hi�n.
    Tr� v�: 1 (lu�n th�nh c�ng).
]]
function DoLevelUpdateCallBack(nNodeId, nNewLevel)
    return 1
end
