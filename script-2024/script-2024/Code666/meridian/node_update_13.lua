--[[
    Module: Huy?t V? Ho?t Ð?ng Ði?u Ki?n K? Nang
    Mô t?: Module này ch?a các hàm ki?m tra xem ngu?i choi dã dáp ?ng di?u ki?n d? kích ho?t m?t huy?t v? c? th? hay chua.
           Ði?u ki?n kích ho?t d?a trên vi?c d?t d?n m?t c?p d? nh?t d?nh c?a m?t k? nang c? th?.
]]

-- Tên k? nang yêu c?u d? kích ho?t.
SZ_NEED_SKILL_NAME = "Lang Ba Vi B?"

-- C?p d? k? nang yêu c?u.
N_NEED_SKILL_LEVEL = 8

-- ID c?a k? nang yêu c?u.
N_NEED_SKILL_ID = 477

-- ID nhi?m v? luu tr? thông tin tr?ng thái kích ho?t k? nang.
N_SAVE_TSK_ID = 2951

-- V? trí bit (bit offset) trong nhi?m v? luu tr? d? ki?m tra tr?ng thái kích ho?t.
N_SAVE_TSK_ID_BIT = 1

--[[
    Hàm: CheckCondition
    Tham s?:
        - nNodeId: ID c?a huy?t v? hi?n t?i.
        - nLevel: C?p d? huy?t v? hi?n t?i.
        - bNotify: C? xác d?nh có hi?n th? thông báo cho ngu?i choi hay không (1: hi?n th?, 0: không hi?n th?).
    Mô t?:
        Ki?m tra xem ngu?i choi có th? kích ho?t huy?t v? hay không.
        - N?u c?p d? huy?t v? là 1:
            - Ki?m tra tr?ng thái kích ho?t k? nang (_CheckSkillBit).
            - N?u k? nang chua du?c kích ho?t, ki?m tra c?p d? c?a k? nang yêu c?u (N_NEED_SKILL_ID).
            - N?u c?p d? k? nang chua d?, hi?n th? thông báo (n?u bNotify = 1) và tr? v? 0 (th?t b?i).
        - N?u không, tr? v? 1 (thành công).
]]
function CheckCondition(nNodeId, nLevel, bNotify)
    if nLevel == 1 then
        if _CheckSkillBit() == 0 then -- K? nang chua du?c kích ho?t
            if GetSkillLevel(N_NEED_SKILL_ID) < N_NEED_SKILL_LEVEL then
                if bNotify == 1 then
                    Msg2Player(string.format("B?n chua kích ho?t c?p %d k? nang %s", N_NEED_SKILL_LEVEL, SZ_NEED_SKILL_NAME))
                end
                return 0 -- Th?t b?i
            end
        end
    end

    return 1 -- Thành công
end

--[[
    Hàm: GetConditionDesc
    Tham s?:
        - nNodeId: ID c?a huy?t v?.
        - nLevel: C?p d? huy?t v?.
    Mô t?:
        L?y mô t? di?u ki?n d? kích ho?t huy?t v?.
    Tr? v?: Chu?i mô t? di?u ki?n.
]]
function GetConditionDesc(nNodeId, nLevel)
    local str = ""
    if nLevel == 1 then
        str = string.format("C?n ph?i kích ho?t c?p %d k? nang %s", N_NEED_SKILL_LEVEL, SZ_NEED_SKILL_NAME)
    end
    return str
end

--[[
    Hàm: DoLevelUpdateCallBack
    Tham s?:
        - nNodeId: ID c?a huy?t v? du?c c?p nh?t.
        - nNewLevel: C?p d? m?i c?a huy?t v?.
    Mô t?:
        Hàm g?i l?i sau khi c?p d? huy?t v? du?c c?p nh?t.
        - N?u huy?t v? có ID là 13 và d?t c?p 1, thì d?t tr?ng thái kích ho?t k? nang thành 1.
    Tr? v?: 1 (luôn thành công).
]]
function DoLevelUpdateCallBack(nNodeId, nNewLevel)
    if nNodeId == 13 and nNewLevel == 1 then
        return _SetSkillBit(1) 
    end
    return 1 
end

--[[
    Hàm: _CheckSkillBit
    Mô t?:
        Ki?m tra tr?ng thái kích ho?t c?a k? nang d?a trên bit luu tr? trong nhi?m v?.
    Tr? v?: Giá tr? c?a bit tuong ?ng v?i tr?ng thái kích ho?t (0 ho?c 1).
]]
function _CheckSkillBit()
    local nTaskVal = GetTask(N_SAVE_TSK_ID)
    local nRet = GetBit(nTaskVal, N_SAVE_TSK_ID_BIT) 
    return nRet
end

--[[
    Hàm: _SetSkillBit
    Tham s?:
        - nBitValue: Giá tr? m?i c?a bit tr?ng thái kích ho?t (0 ho?c 1).
    Mô t?:
        C?p nh?t tr?ng thái kích ho?t c?a k? nang trong nhi?m v? luu tr?.
    Tr? v?: 1 (luôn thành công).
]]
function _SetSkillBit(nBitValue)
    local nTaskVal = GetTask(N_SAVE_TSK_ID)
    local nRet = SetBit(nTaskVal, N_SAVE_TSK_ID_BIT, nBitValue) 
    SetTask(N_SAVE_TSK_ID, nRet) 
    return 1 
end
