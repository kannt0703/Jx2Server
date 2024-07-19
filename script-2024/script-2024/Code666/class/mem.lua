-- Creator: yfeng
-- Date: 2004-8-27

-- Th? vi?n h¨¤m c? b?n

-- Ki?m tra xem bi?n MEM_HEAD ?? ???c kh?i t?o ch?a. N?u ch?a, g¨¢n gi¨¢ tr? ban ??u l¨¤ 1.
if not MEM_HEAD then
    MEM_HEAD = 1
end

-- H¨¤m __clone: Sao ch¨¦p sau (deep copy) m?t b?ng (table)
function __clone(org, des) 
    for i, j in pairs(org) do -- Duy?t qua t?ng c?p key-value trong b?ng ngu?n (org)
        if type(j) == "table" then -- N?u gi¨¢ tr? l¨¤ m?t b?ng, ti?p t?c sao ch¨¦p ?? quy
            des[i] = {} -- T?o m?t b?ng m?i ?? ch?a b?n sao
            __clone(j, des[i]) -- G?i ?? quy ?? sao ch¨¦p b?ng con
        else
            des[i] = j -- N?u kh?ng ph?i b?ng, sao ch¨¦p gi¨¢ tr? tr?c ti?p
        end
    end
end

-- H¨¤m __cclone: Sao ch¨¦p c¨® ?i?u ki?n (conditional copy) m?t b?ng
function __cclone(org, des)
    for i, j in pairs(org) do
        if type(j) == "table" then -- N?u gi¨¢ tr? l¨¤ m?t b?ng
            if not des[i] then -- Ch? sao ch¨¦p n?u b?ng ?¨ªch ch?a c¨® key t??ng ?ng
                des[i] = {}
                __cclone(j, des[i])
            end
        else
            if not des[i] then -- Ch? sao ch¨¦p n?u b?ng ?¨ªch ch?a c¨® key t??ng ?ng
                des[i] = j
            end
        end
    end
end

-- H¨¤m new: M? ph?ng to¨¢n t? new trong l?p tr¨¬nh h??ng ??i t??ng
function new(class, ...) -- class l¨¤ b?ng ??i di?n cho l?p, ... l¨¤ c¨¢c ??i s? truy?n v¨¤o h¨¤m t?o
    local obj = {} -- T?o m?t b?ng m?i ?? ??i di?n cho ??i t??ng
    __clone(class, obj) -- Sao ch¨¦p c¨¢c th¨¤nh vi¨ºn c?a l?p v¨¤o ??i t??ng

    -- Ki?m tra xem l?p c¨® h¨¤m t?o __new kh?ng
    if type(obj.__new) == "function" then
        -- N?u c¨®, g?i h¨¤m t?o v?i c¨¢c ??i s? ?? truy?n v¨¤o
        obj:__new(...) -- ':' t??ng ???ng v?i obj.__new(obj, ...)
    end

    return obj -- Tr? v? ??i t??ng m?i
end

-- H¨¤m inherit: M? ph?ng t¨ªnh k? th?a trong l?p tr¨¬nh h??ng ??i t??ng
function inherit(base, class) -- base l¨¤ b?ng l?p cha, class l¨¤ b?ng l?p con
    __cclone(base, class) -- Sao ch¨¦p c¨¢c th¨¤nh vi¨ºn c?a l?p cha v¨¤o l?p con (n?u ch?a c¨®)
    return class -- Tr? v? l?p con
end
