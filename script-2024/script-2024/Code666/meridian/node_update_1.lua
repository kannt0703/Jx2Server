--[[
    Module: Huy�t v� y�u c�u c�p �� huy�t v� kh�c
    M� t�: Module n�y ch�a c�c h�m ki�m tra �i�u ki�n k�ch ho�t c�a m�t huy�t v� c� th�
           trong tr� ch�i. Trong tr��ng h�p n�y, �� k�ch ho�t huy�t v� c� ID l� 1,
           ng��i ch�i c�n ��t ��n m�t c�p �� nh�t ��nh � m�t huy�t v� kh�c (huy�t v� B�ch H�i v�i ID 13).
]]

-- H�m l�y ch� s� c�a huy�t v� trong danh s�ch c�c huy�t v� c�n ki�m tra �i�u ki�n
function _get_this_node_index(nNodeId)
    local nThisIndex = 0
    for i = 1, #t_node_id_list do        -- Duy�t qua danh s�ch t_node_id_list
        if t_node_id_list[i] == nNodeId then    -- Ki�m tra xem ID c� kh�p v�i ID c�n t�m kh�ng
            nThisIndex = i
            break       -- Tho�t kh�i v�ng l�p khi t�m th�y
        end
    end
    return nThisIndex
end

-- H�m t�nh to�n c�p �� y�u c�u c�a huy�t v� �i�u ki�n
function _get_require_level(nLevel)
    return nLevel - 1  -- C�p �� y�u c�u lu�n nh� h�n 1 so v�i c�p �� c�a huy�t v� �ang ki�m tra
end

-- Danh s�ch ID c�c huy�t v� c�n ki�m tra �i�u ki�n
t_node_id_list = {1}    -- Ch� c� huy�t v� ID 1 c�n ki�m tra �i�u ki�n trong v� d� n�y

-- Danh s�ch c�c huy�t v� �i�u ki�n v� h�m t�nh to�n c�p �� y�u c�u t��ng �ng
t_require_node_list = {
    {13, "B�ch H�i", _get_require_level}  -- Huy�t v� �i�u ki�n "B�ch H�i" (ID 13), h�m t�nh c�p �� y�u c�u l� _get_require_level
}

--[[
    H�m: CheckCondition
    Tham s�:
        - nNodeId: ID c�a huy�t v� c�n ki�m tra.
        - nLevel: C�p �� hi�n t�i c�a huy�t v� c�n ki�m tra.
        - bNotify: C� th�ng b�o (1: hi�n th� th�ng b�o l�i, 0: kh�ng hi�n th�).
    M� t�:
        Ki�m tra xem huy�t v� �i�u ki�n �� ��t c�p �� y�u c�u hay ch�a.
    Tr� v�:
        - 1: N�u t�t c� c�c huy�t v� �i�u ki�n ��u ��t y�u c�u.
        - 0: N�u c� �t nh�t m�t huy�t v� �i�u ki�n ch�a ��t y�u c�u.
]]
function CheckCondition(nNodeId, nLevel, bNotify)
    -- Ki�m tra xem huy�t v� c�n ki�m tra c� trong danh s�ch `t_node_id_list` hay kh�ng
    local nThisIndex = _get_this_node_index(nNodeId)

    if nThisIndex > 0 then
        for i = 1, #t_require_node_list do  -- Duy�t qua danh s�ch c�c huy�t v� �i�u ki�n
            local nRequireLevel = t_require_node_list[i][3](nLevel)  -- T�nh to�n c�p �� y�u c�u
            local nCheckNodeId = t_require_node_list[i][1]           -- ID c�a huy�t v� �i�u ki�n
            local nCheckNodeLevel = MeridianGetNodeLevel(nCheckNodeId) or 0  -- C�p �� hi�n t�i c�a huy�t v� �i�u ki�n (m�c ��nh l� 0)

            -- N�u huy�t v� �i�u ki�n ch�a ��t c�p �� y�u c�u
            if nCheckNodeLevel < nRequireLevel then
                if bNotify == 1 then
                    -- Hi�n th� th�ng b�o l�i cho ng��i ch�i n�u c�n
                    Msg2Player(string.format("%s huy�t v� ch�a ��t ��n t�ng %d, �i�m huy�t th�t b�i", t_require_node_list[i][2], nRequireLevel))
                end
                return 0 -- Tr� v� th�t b�i
            end
        end
    end

    return 1 -- Th�nh c�ng
end

--[[
    H�m: GetConditionDesc
    Tham s�:
        - nNodeId: ID c�a huy�t v�.
        - nLevel: C�p �� c�a huy�t v�.
    M� t�:
        L�y m� t� chi ti�t v� �i�u ki�n k�ch ho�t c�a huy�t v�.
    Tr� v�: Chu�i m� t� �i�u ki�n.
]]
function GetConditionDesc(nNodeId, nLevel)
    local str = ""
    -- Ki�m tra xem huy�t v� c� trong danh s�ch `t_node_id_list` hay kh�ng
    if _get_this_node_index(nNodeId) > 0 then
        for i = 1, #t_require_node_list do
            local nRequireLevel = t_require_node_list[i][3](nLevel)
            -- N�u c�p �� y�u c�u >= 1, th� huy�t v� n�y l� m�t �i�u ki�n
            if nRequireLevel >= 1 then
                local strTemp = string.format("%s huy�t v� �� ��t t�ng %d", t_require_node_list[i][2], nRequireLevel)
                if i == 1 then  -- �i�u ki�n ��u ti�n
                    str = strTemp
                else
                    str = str .. "\n" .. strTemp  -- N�i c�c �i�u ki�n b�ng xu�ng d�ng
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
