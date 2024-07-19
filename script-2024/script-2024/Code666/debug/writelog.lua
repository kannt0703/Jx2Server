--[[
    Module: Debug Logging Module (M�-�un Ghi Log G� L�i)
    Description: Cung c�p ch�c n�ng ghi log l�i v� th�ng tin g� l�i (debug) v�o c�c t�p tin.
    C�ch s� d�ng:
        1. K�ch ho�t ch� �� g� l�i b�ng c�ch ��t DEBUG_MODE = 1.
        2. G�i h�m DebugWriteLog("Chu�i format", gi�_tr�_1, gi�_tr�_2, ...)
            �� ghi log v�i ��nh d�ng t��ng t� nh� h�m string.format().
]]

-- B�t/t�t ch� �� g� l�i (1: b�t, 0: t�t).
DEBUG_MODE = 1

-- H�m ghi log g� l�i v�o t�p.
function DebugWriteLog(strFormat, ...)
    -- Ki�m tra xem ch� �� g� l�i c� ���c b�t hay kh�ng.
    if DEBUG_MODE then
        -- ���ng d�n ��n th� m�c ch�a c�c t�p log.
        local strLogPath = "logs/debug_log/"

        -- ��nh d�ng chu�i log s� d�ng `string.format` v� c�c tham s� truy�n v�o.
        local strLog = string.format(strFormat, ...)

        -- L�y ng�y hi�n t�i theo ��nh d�ng yyyy_mm_dd.
        local strDate = os.date("%Y_%m_%d")

        -- T�o t�n t�p log d�a tr�n ng�y.
        local strLogFile = string.format("debug_log_%s.log", strDate)

        -- ���ng d�n ��y �� ��n t�p log.
        local strLogFilePath = strLogPath .. strLogFile

        -- M� t�p log � ch� �� append (th�m v�o cu�i).
        local hFile = io.open(strLogFilePath, "a+")

        -- N�u th� m�c log kh�ng t�n t�i, t�o th� m�c.
        if hFile == nil then
            os.execute(string.format("mkdir \"%s\"", strLogPath)) -- T�o th� m�c b�ng l�nh h� th�ng
            hFile = io.open(strLogFilePath, "a+") -- Th� m� l�i t�p
        end

        -- N�u t�p log �� m� th�nh c�ng, ghi log v� ��ng t�p.
        if hFile ~= nil then
            hFile:write(strLog .. "\n") -- Ghi log v� xu�ng d�ng
            hFile:close() -- ��ng t�p �� ��m b�o d� li�u ���c ghi
        end
    end
end
