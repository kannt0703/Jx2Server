--[[
    Module: Debug Logging Module
    Description: Cung c?p ch?c nang ghi log l?i và thông tin g? l?i (debug) vào các t?p tin.
    Cách s? d?ng:
        1. Kích ho?t ch? d? g? l?i b?ng cách d?t DEBUG_MODE = 1.
        2. G?i hàm DebugWriteLog("Chu?i format", giá_tr?_1, giá_tr?_2, ...)
            d? ghi log v?i d?nh d?ng tuong t? nhu hàm string.format().
]]

-- B?t/t?t ch? d? g? l?i (1: b?t, 0: t?t).
DEBUG_MODE = 1

-- Hàm ghi log g? l?i vào t?p.
function DebugWriteLog(strFormat, ...)
    -- Ki?m tra xem ch? d? g? l?i có du?c b?t hay không.
    if DEBUG_MODE then
        -- Ðu?ng d?n d?n thu m?c ch?a các t?p log.
        local strLogPath = "logs/debug_log/"
        
        -- Ð?nh d?ng chu?i log s? d?ng `string.format` và các tham s? truy?n vào.
        local strLog = string.format(strFormat, ...)
        
        -- L?y ngày hi?n t?i theo d?nh d?ng yyyy_mm_dd.
        local strDate = os.date("%Y_%m_%d")

        -- T?o tên t?p log d?a trên ngày.
        local strLogFile = string.format("debug_log_%s.log", strDate)

        -- Ðu?ng d?n d?y d? d?n t?p log.
        local strLogFilePath = strLogPath .. strLogFile

        -- M? t?p log ? ch? d? append (thêm vào cu?i).
        local hFile = io.open(strLogFilePath, "a+")

        -- N?u thu m?c log không t?n t?i, t?o thu m?c.
        if hFile == nil then
            os.execute(string.format("mkdir \"%s\"", strLogPath))
            hFile = io.open(strLogFilePath, "a+")
        end

        -- N?u t?p log dã m? thành công, ghi log và dóng t?p.
        if hFile ~= nil then
            hFile:write(strLog .. "\n") -- Ghi log và xu?ng dòng
            hFile:close()
        end
    end
end
