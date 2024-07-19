--[[
    Module: Huy�t v� y�u c�u c�p �� huy�t v� kh�c
    M� t�: Module n�y ch�a c�c h�m ki�m tra xem ng��i ch�i �� ��p �ng �i�u ki�n
           �� k�ch ho�t m�t huy�t v� c� th� hay ch�a. �i�u ki�n d�a tr�n vi�c
           ��t ��n m�t c�p �� y�u c�u � m�t s� huy�t v� kh�c.
]]

-- H�m l�y ch� s� c�a m�t huy�t v� trong danh s�ch
function _get_this_node_index(nNodeId)
    local nThisIndex = 0
    for i = 1, #t_node_id_list do
        if t_node_id_list[i] == nNodeId then
            nThisIndex = i
            break
        end
    end
    return nThisIndex
end

-- H�m t�nh to�n c�p �� y�u c�u c�a huy�t v� �i�u ki�n
function _get_require_level(nLevel)
    return nLevel - 1
end

-- Danh s�ch ID c�c huy�t v� c�n ki�m tra �i�u ki�n
t_node_id_list = {4}  -- Trong v� d� n�y, ch� c� huy�t v� c� ID l� 4 c�n ki�m tra �i�u ki�n

-- Danh s�ch c�c huy�t v� �i�u ki�n v� c�p �� y�u c�u t��ng �ng
t_require_node_list = {
    {65, "Kh� Xung", _get_require_level}, -- Huy�t v� Kh� Xung, c�p �� y�u c�u = c�p �� hi�n t�i c�a huy�t v� c�n ki�m tra - 1
    -- C� th� th�m nhi�u huy�t v� �i�u ki�n kh�c v�o ��y
}

--[[
    H�m: CheckCondition
    Tham s�:
        - nNodeId: ID c�a huy�t v� c�n ki�m tra.
        - nLevel: C�p �� hi�n t�i c�a huy�t v� c�n ki�m tra.
        - bNotify: C� th�ng b�o (1: hi�n th� th�ng b�o l�i, 0: kh�ng hi�n th�).
    M� t�:
        Ki�m tra xem c�c huy�t v� �i�u ki�n �� ��t c�p �� y�u c�u hay ch�a.
        - Duy�t qua danh s�ch t_require_node_list �� ki�m tra t�ng huy�t v� �i�u ki�n.
        - N�u b�t k� huy�t v� �i�u ki�n n�o kh�ng ��t c�p �� y�u c�u, tr� v� 0 (th�t b�i)
          v� hi�n th� th�ng b�o l�i n�u bNotify = 1.
    Tr� v�: 1 n�u t�t c� c�c huy�t v� �i�u ki�n ��u ��t y�u c�u, 0 n�u kh�ng.
]]
function CheckCondition(nNodeId, nLevel, bNotify)
    -- N�u nNodeId c� trong t_node_id_list th� m�i c�n ki�m tra �i�u ki�n
    local nThisIndex = _get_this_node_index(nNodeId)
    if nThisIndex > 0 then
        for i = 1, #t_require_node_list do
            -- T�nh to�n c�p �� y�u c�u c�a huy�t v� �i�u ki�n
            local nRequireLevel = t_require_node_list[i][3](nLevel)
            local nCheckNodeId = t_require_node_list[i][1]
            -- L�y c�p �� hi�n t�i c�a huy�t v� �i�u ki�n, m�c ��nh l� 0 n�u ch�a ���c k�ch ho�t
            local nCheckNodeLevel = MeridianGetNodeLevel(nCheckNodeId) or 0
            -- N�u c�p �� hi�n t�i ch�a ��, tr� v� 0 (th�t b�i)
            if nCheckNodeLevel < nRequireLevel then
                if bNotify == 1 then
                    Msg2Player(string.format("%s huy�t v� ch�a ��t ��n t�ng %d, �i�m huy�t th�t b�i", t_require_node_list[i][2], nRequireLevel))
                end
                return 0
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
            if nRequireLevel >= 1 then
                local strTemp = string.format("%s huy�t v� �� ��t t�ng %d", t_require_node_list[i][2], nRequireLevel)
                if i == 1 then -- �i�u ki�n ��u ti�n
                    str = strTemp
                else
                    str = str .. "\n" .. strTemp -- N�i c�c �i�u ki�n b�ng xu�ng d�ng
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
