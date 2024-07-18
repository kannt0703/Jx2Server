-- Bao g?m c¨¢c t?p ??nh ngh?a ID chu?i ti?ng Vi?t
Include("\\script\\ks2vng\\lib\\managed_viet_string_id_def.lua")
Include("\\script\\lib\\managed_viet_string_id_def_ks.lua")

-- ???ng d?n ??n c¨¢c t?p INI ch?a chu?i ti?ng Vi?t
SZ_MANAGEED_VIET_STRING_FILE = "\\script\\ks2vng\\lib\\managed_viet_string.ini"
SZ_MANAGEED_VIET_STRING_FILE_KS = "\\script\\lib\\no_trans\\managed_viet_string_ks.ini"

-- B?ng (table) ?? l?u tr? c¨¢c chu?i ?? ??c t? t?p INI, gi¨²p tr¨¢nh vi?c ??c l?i nhi?u l?n
t_stringres = {}

-- H¨¤m l?y chu?i ti?ng Vi?t t? t?p INI
function getManagedVietString(nStringIndex)
    if nStringIndex and nStringIndex > 0 then -- Ki?m tra xem ID chu?i c¨® h?p l? kh?ng
        -- N?u chu?i ch?a ???c ??c t? t?p
        if not t_stringres[nStringIndex] then 
            -- X¨¢c ??nh t?p INI c?n ??c d?a tr¨ºn kho?ng ID chu?i
            local szIniFile = ""
            if nStringIndex >= VIET_STR_ID_KINGSOFT_BEGIN and nStringIndex <= VIET_STR_ID_KINGSOFT_END then
                szIniFile = SZ_MANAGEED_VIET_STRING_FILE_KS -- T?p INI d¨¤nh cho Kingsoft
            else
                szIniFile = SZ_MANAGEED_VIET_STRING_FILE -- T?p INI chung
            end

            -- ??c chu?i t? t?p INI
            IniFile_Load(szIniFile) -- N?p t?p INI
            local key = tostring(nStringIndex) -- Chuy?n ID chu?i th¨¤nh ki?u chu?i ?? l¨¤m key
            t_stringres[nStringIndex] = IniFile_GetData(szIniFile, "string_res", key) -- L?y chu?i t? INI
            IniFile_Unload(szIniFile) -- Gi?i ph¨®ng t?p INI

            -- N?u kh?ng t¨¬m th?y chu?i trong t?p INI, g¨¢n gi¨¢ tr? r?ng ?? tr¨¢nh l?i
            if t_stringres[nStringIndex] == nil then
                t_stringres[nStringIndex] = "" 
            end
        end

        return t_stringres[nStringIndex] -- Tr? v? chu?i ?? ??c
    end

    return "" -- Tr? v? chu?i r?ng n?u kh?ng t¨¬m th?y ho?c ID kh?ng h?p l?
end
