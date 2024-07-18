--[[
    Module: Debug Logging Module
    Description: Cung c?p ch?c nang ghi log l?i v� th�ng tin g? l?i (debug) v�o c�c t?p tin.
    C�ch s? d?ng:
        1. K�ch ho?t ch? d? g? l?i b?ng c�ch d?t DEBUG_MODE = 1.
        2. G?i h�m DebugWriteLog("Chu?i format", gi�_tr?_1, gi�_tr?_2, ...)
            d? ghi log v?i d?nh d?ng tuong t? nhu h�m string.format().
]]

-- B?t/t?t ch? d? g? l?i (1: b?t, 0: t?t).
DEBUG_MODE = 1

-- H�m ghi log g? l?i v�o t?p.
function DebugWriteLog(strFormat, ...)
    -- Ki?m tra xem ch? d? g? l?i c� du?c b?t hay kh�ng.
    if DEBUG_MODE then
        -- �u?ng d?n d?n thu m?c ch?a c�c t?p log.
        local strLogPath = "logs/debug_log/"
        
        -- �?nh d?ng chu?i log s? d?ng `string.format` v� c�c tham s? truy?n v�o.
        local strLog = string.format(strFormat, ...)
        
        -- L?y ng�y hi?n t?i theo d?nh d?ng yyyy_mm_dd.
        local strDate = os.date("%Y_%m_%d")

        -- T?o t�n t?p log d?a tr�n ng�y.
        local strLogFile = string.format("debug_log_%s.log", strDate)

        -- �u?ng d?n d?y d? d?n t?p log.
        local strLogFilePath = strLogPath .. strLogFile

        -- M? t?p log ? ch? d? append (th�m v�o cu?i).
        local hFile = io.open(strLogFilePath, "a+")

        -- N?u thu m?c log kh�ng t?n t?i, t?o thu m?c.
        if hFile == nil then
            os.execute(string.format("mkdir \"%s\"", strLogPath))
            hFile = io.open(strLogFilePath, "a+")
        end

        -- N?u t?p log d� m? th�nh c�ng, ghi log v� d�ng t?p.
        if hFile ~= nil then
            hFile:write(strLog .. "\n") -- Ghi log v� xu?ng d�ng
            hFile:close()
        end
    end
end
