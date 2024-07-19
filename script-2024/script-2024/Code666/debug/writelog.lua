--[[
    Module: Debug Logging Module (M«-®un Ghi Log Gì Lçi)
    Description: Cung cÊp chøc n¨ng ghi log lçi vµ th«ng tin gì lçi (debug) vµo c¸c tÖp tin.
    C¸ch sö dông:
        1. KÝch ho¹t chÕ ®é gì lçi b»ng c¸ch ®Æt DEBUG_MODE = 1.
        2. Gäi hµm DebugWriteLog("Chuçi format", gi¸_trÞ_1, gi¸_trÞ_2, ...)
            ®Ó ghi log víi ®Þnh d¹ng t­¬ng tù nh­ hµm string.format().
]]

-- BËt/t¾t chÕ ®é gì lçi (1: bËt, 0: t¾t).
DEBUG_MODE = 1

-- Hµm ghi log gì lçi vµo tÖp.
function DebugWriteLog(strFormat, ...)
    -- KiÓm tra xem chÕ ®é gì lçi cã ®­îc bËt hay kh«ng.
    if DEBUG_MODE then
        -- §­êng dÉn ®Õn th­ môc chøa c¸c tÖp log.
        local strLogPath = "logs/debug_log/"

        -- §Þnh d¹ng chuçi log sö dông `string.format` vµ c¸c tham sè truyÒn vµo.
        local strLog = string.format(strFormat, ...)

        -- LÊy ngµy hiÖn t¹i theo ®Þnh d¹ng yyyy_mm_dd.
        local strDate = os.date("%Y_%m_%d")

        -- T¹o tªn tÖp log dùa trªn ngµy.
        local strLogFile = string.format("debug_log_%s.log", strDate)

        -- §­êng dÉn ®Çy ®ñ ®Õn tÖp log.
        local strLogFilePath = strLogPath .. strLogFile

        -- Më tÖp log ë chÕ ®é append (thªm vµo cuèi).
        local hFile = io.open(strLogFilePath, "a+")

        -- NÕu th­ môc log kh«ng tån t¹i, t¹o th­ môc.
        if hFile == nil then
            os.execute(string.format("mkdir \"%s\"", strLogPath)) -- T¹o th­ môc b»ng lÖnh hÖ thèng
            hFile = io.open(strLogFilePath, "a+") -- Thö më l¹i tÖp
        end

        -- NÕu tÖp log ®· më thµnh c«ng, ghi log vµ ®ãng tÖp.
        if hFile ~= nil then
            hFile:write(strLog .. "\n") -- Ghi log vµ xuèng dßng
            hFile:close() -- §ãng tÖp ®Ó ®¶m b¶o d÷ liÖu ®­îc ghi
        end
    end
end
