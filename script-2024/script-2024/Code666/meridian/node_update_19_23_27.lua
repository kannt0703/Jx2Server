--[[
    Module: Kinh m�ch nhi�m v� h�ng ng�y
    M� t�: Module n�y ch�a c�c h�m li�n quan ��n vi�c ki�m tra �i�u ki�n v� c�p nh�t nhi�m v� h�ng ng�y
    li�n quan ��n h� th�ng kinh m�ch trong tr� ch�i.

    C�c h�m ch�nh:
        - CheckCondition(nNodeId, nLevel, bNotify): Ki�m tra xem �i�u ki�n �� ho�n th�nh nhi�m v� h�ng ng�y c� ��t hay kh�ng.
        - GetConditionDesc(nNodeId, nLevel): L�y m� t� v� �i�u ki�n c�n �� ho�n th�nh nhi�m v�.
        - DoLevelUpdateCallBack(nNodeId, nNewLevel): Th�c hi�n c�c h�nh ��ng c�n thi�t sau khi c�p �� kinh m�ch ���c c�p nh�t.
]]

-- Danh s�ch c�c ID n�t kinh m�ch li�n quan ��n nhi�m v�.
t_node_id_list = {19, 23, 27}

--[[
    H�m: CheckCondition
    Tham s�:
        - nNodeId: ID c�a n�t kinh m�ch hi�n t�i.
        - nLevel: C�p �� kinh m�ch hi�n t�i.
        - bNotify: C� x�c ��nh c� hi�n th� th�ng b�o cho ng��i ch�i hay kh�ng (1: hi�n th�, 0: kh�ng hi�n th�).
    M� t�:
        Ki�m tra xem ng��i ch�i c� th� th�c hi�n nhi�m v� h�ng ng�y hay kh�ng d�a tr�n c�c �i�u ki�n sau:
        1. T�m n�t hi�n t�i trong danh s�ch c�c n�t li�n quan ��n nhi�m v�.
        2. Duy�t qua danh s�ch, ki�m tra xem c� n�t n�o kh�c �� ���c k�ch ho�t v� c� c�p �� l�n h�n 0 hay kh�ng.
        3. N�u c�, hi�n th� th�ng b�o (n�u bNotify = 1) v� tr� v� 0 (th�t b�i).
        4. N�u kh�ng c� n�t n�o kh�c ���c k�ch ho�t, tr� v� 1 (th�nh c�ng).
    Tr� v�: 1 n�u �i�u ki�n th�a m�n, 0 n�u kh�ng.
]]
function CheckCondition(nNodeId, nLevel, bNotify)
    -- T�m ch� s� c�a n�t hi�n t�i trong danh s�ch
    local nThisIndex = 0
    for i = 1, #t_node_id_list do
        if t_node_id_list[i] == nNodeId then
            nThisIndex = i
            break
        end
    end

    -- N�u t�m th�y n�t hi�n t�i, ki�m tra c�c n�t kh�c
    if nThisIndex > 0 then
        for i = 1, #t_node_id_list do
            local nCheckNodeId = t_node_id_list[i]
            local nCheckNodeLevel = MeridianGetNodeLevel(nCheckNodeId) or 0  -- L�y c�p �� c�a n�t ki�m tra
            if nCheckNodeLevel > 0 and nCheckNodeId ~= nNodeId then  -- Ki�m tra n�t kh�c c� ���c k�ch ho�t hay kh�ng
                if bNotify == 1 then
                    -- Hi�n th� th�ng b�o l�i n�u c� n�t kh�c ���c k�ch ho�t
                    Talk(1, "", "Huy�n Khu, Ch� D��ng, Th�n Tr� 3 huy�t v� t��ng xung, �i�m huy�t th�t b�i")
                end
                return 0 -- Th�t b�i
            end
        end
    end

    return 1 -- Th�nh c�ng
end

--[[
    H�m: GetConditionDesc
    Tham s�:
        - nNodeId: ID c�a n�t kinh m�ch.
        - nLevel: C�p �� kinh m�ch.
    M� t�:
        L�y m� t� �i�u ki�n c�n �� ho�n th�nh nhi�m v�.
    Tr� v�: Chu�i m� t� �i�u ki�n.
]]
function GetConditionDesc(nNodeId, nLevel)
    return "Huy�n Khu, Ch� D��ng, Th�n Tr� 3 huy�t t��ng xung"
end

--[[
    H�m: DoLevelUpdateCallBack
    Tham s�:
        - nNodeId: ID c�a n�t kinh m�ch ���c c�p nh�t.
        - nNewLevel: C�p �� m�i c�a n�t kinh m�ch.
    M� t�:
        Th�c hi�n c�c h�nh ��ng c�n thi�t sau khi c�p �� kinh m�ch ���c c�p nh�t.
    Tr� v�: 1 n�u th�nh c�ng, 0 n�u th�t b�i.
]]
function DoLevelUpdateCallBack(nNodeId, nNewLevel)
    -- Ch�a c� h�nh ��ng c� th� n�o ���c th�c hi�n � ��y.
    return 1  -- Tr� v� th�nh c�ng m�c ��nh
end
