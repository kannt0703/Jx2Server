--[[
    Module: Huy?t V? Ho?t �?ng �i?u Ki?n K? Nang
    M� t?: Module n�y ch?a c�c h�m ki?m tra xem ngu?i choi d� d�p ?ng di?u ki?n d? k�ch ho?t m?t huy?t v? c? th? hay chua.
           �i?u ki?n k�ch ho?t d?a tr�n vi?c d?t d?n m?t c?p d? nh?t d?nh c?a m?t k? nang c? th?.
]]

-- T�n k? nang y�u c?u d? k�ch ho?t.
SZ_NEED_SKILL_NAME = "Lang Ba Vi B?"

-- C?p d? k? nang y�u c?u.
N_NEED_SKILL_LEVEL = 8

-- ID c?a k? nang y�u c?u.
N_NEED_SKILL_ID = 477

-- ID nhi?m v? luu tr? th�ng tin tr?ng th�i k�ch ho?t k? nang.
N_SAVE_TSK_ID = 2951

-- V? tr� bit (bit offset) trong nhi?m v? luu tr? d? ki?m tra tr?ng th�i k�ch ho?t.
N_SAVE_TSK_ID_BIT = 1

--[[
    H�m: CheckCondition
    Tham s?:
        - nNodeId: ID c?a huy?t v? hi?n t?i.
        - nLevel: C?p d? huy?t v? hi?n t?i.
        - bNotify: C? x�c d?nh c� hi?n th? th�ng b�o cho ngu?i choi hay kh�ng (1: hi?n th?, 0: kh�ng hi?n th?).
    M� t?:
        Ki?m tra xem ngu?i choi c� th? k�ch ho?t huy?t v? hay kh�ng.
        - N?u c?p d? huy?t v? l� 1:
            - Ki?m tra tr?ng th�i k�ch ho?t k? nang (_CheckSkillBit).
            - N?u k? nang chua du?c k�ch ho?t, ki?m tra c?p d? c?a k? nang y�u c?u (N_NEED_SKILL_ID).
            - N?u c?p d? k? nang chua d?, hi?n th? th�ng b�o (n?u bNotify = 1) v� tr? v? 0 (th?t b?i).
        - N?u kh�ng, tr? v? 1 (th�nh c�ng).
]]
function CheckCondition(nNodeId, nLevel, bNotify)
    if nLevel == 1 then
        if _CheckSkillBit() == 0 then -- K? nang chua du?c k�ch ho?t
            if GetSkillLevel(N_NEED_SKILL_ID) < N_NEED_SKILL_LEVEL then
                if bNotify == 1 then
                    Msg2Player(string.format("B?n chua k�ch ho?t c?p %d k? nang %s", N_NEED_SKILL_LEVEL, SZ_NEED_SKILL_NAME))
                end
                return 0 -- Th?t b?i
            end
        end
    end

    return 1 -- Th�nh c�ng
end

--[[
    H�m: GetConditionDesc
    Tham s?:
        - nNodeId: ID c?a huy?t v?.
        - nLevel: C?p d? huy?t v?.
    M� t?:
        L?y m� t? di?u ki?n d? k�ch ho?t huy?t v?.
    Tr? v?: Chu?i m� t? di?u ki?n.
]]
function GetConditionDesc(nNodeId, nLevel)
    local str = ""
    if nLevel == 1 then
        str = string.format("C?n ph?i k�ch ho?t c?p %d k? nang %s", N_NEED_SKILL_LEVEL, SZ_NEED_SKILL_NAME)
    end
    return str
end

--[[
    H�m: DoLevelUpdateCallBack
    Tham s?:
        - nNodeId: ID c?a huy?t v? du?c c?p nh?t.
        - nNewLevel: C?p d? m?i c?a huy?t v?.
    M� t?:
        H�m g?i l?i sau khi c?p d? huy?t v? du?c c?p nh?t.
        - N?u huy?t v? c� ID l� 13 v� d?t c?p 1, th� d?t tr?ng th�i k�ch ho?t k? nang th�nh 1.
    Tr? v?: 1 (lu�n th�nh c�ng).
]]
function DoLevelUpdateCallBack(nNodeId, nNewLevel)
    if nNodeId == 13 and nNewLevel == 1 then
        return _SetSkillBit(1) 
    end
    return 1 
end

--[[
    H�m: _CheckSkillBit
    M� t?:
        Ki?m tra tr?ng th�i k�ch ho?t c?a k? nang d?a tr�n bit luu tr? trong nhi?m v?.
    Tr? v?: Gi� tr? c?a bit tuong ?ng v?i tr?ng th�i k�ch ho?t (0 ho?c 1).
]]
function _CheckSkillBit()
    local nTaskVal = GetTask(N_SAVE_TSK_ID)
    local nRet = GetBit(nTaskVal, N_SAVE_TSK_ID_BIT) 
    return nRet
end

--[[
    H�m: _SetSkillBit
    Tham s?:
        - nBitValue: Gi� tr? m?i c?a bit tr?ng th�i k�ch ho?t (0 ho?c 1).
    M� t?:
        C?p nh?t tr?ng th�i k�ch ho?t c?a k? nang trong nhi?m v? luu tr?.
    Tr? v?: 1 (lu�n th�nh c�ng).
]]
function _SetSkillBit(nBitValue)
    local nTaskVal = GetTask(N_SAVE_TSK_ID)
    local nRet = SetBit(nTaskVal, N_SAVE_TSK_ID_BIT, nBitValue) 
    SetTask(N_SAVE_TSK_ID, nRet) 
    return 1 
end
