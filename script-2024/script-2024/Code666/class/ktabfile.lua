-- ====================== TH?NG TIN T?P ======================
-- Ki?m Hi?p T¨¬nh Duy¨ºn Online II - ??c t?p b?ng
-- Phi¨ºn b?n ch?nh s?a t? KTabFile c?a Ki?m V?ng
-- Ch?nh s?a b?i: peres
-- Ng¨¤y: 2005/04/12 16:38

-- ... (?o?n l?i b¨¤i h¨¢t)
-- L?i b¨¤i h¨¢t: ±Ë°¶»¨
-- Th¨ºm ch?c n?ng b?i Th?n Tr??ng: 2011-02-17
-- ======================================================

-- G?i th? vi?n mem.lua ?? qu?n ly b? nh?
Include("\\script\\class\\mem.lua")

-- ??nh ngh?a l?p KTabFile ?? l¨¤m vi?c v?i t?p b?ng
KTabFile = {
    __encodeType = 0, -- Ki?u m? h¨®a m?c ??nh l¨¤ 0

    -- H¨¤m kh?i t?o (constructor)
    __new = function(self, arg)
        if not arg then return end -- N?u kh?ng c¨® ??i s?, tho¨¢t
        self:load(arg[1]) -- G?i h¨¤m load ?? t?i t?p
    end,

    -- H¨¤m load: T?i t?p b?ng
    load = function(self, filename)
        self.__filename = filename -- L?u t¨ºn t?p
        if TabFile_Load(filename) == 0 then -- S? d?ng h¨¤m TabFile_Load (h¨¤m ngo¨¤i) ?? t?i t?p
            return nil -- Tr? v? nil n?u t?i th?t b?i
        end
        self.__bOpen = 1 -- ?¨¢nh d?u t?p ?? ???c m?
        return 1 -- Tr? v? 1 n?u t?i th¨¤nh c?ng
    end,

    -- H¨¤m getCell: L?y gi¨¢ tr? c?a m?t ? trong b?ng
    getCell = function(self, row, col)
        return TabFile_GetData(self.__filename, row, col, "", self.__encodeType)
        -- S? d?ng h¨¤m TabFile_GetData (h¨¤m ngo¨¤i) ?? l?y d? li?u
    end,

    -- H¨¤m getRow: L?y s? h¨¤ng c?a b?ng
    getRow = function(self)
        return TabFile_GetRowCount(self.__filename) -- S? d?ng h¨¤m TabFile_GetRowCount (h¨¤m ngo¨¤i)
    end,

    -- H¨¤m getCol: L?y s? c?t c?a b?ng
    getCol = function(self)
        return TabFile_GetColCount(self.__filename) -- S? d?ng h¨¤m TabFile_GetColCount (h¨¤m ngo¨¤i)
    end,

    -- H¨¤m createArray: T?o m?t m?ng t? m?t c?t trong b?ng
    createArray = function(self, col)
        local nRow = self:getRow()
        local ary = {}
        for i = 3, nRow do -- Duy?t t? h¨¤ng th? 3 (b? qua 2 h¨¤ng ti¨ºu ??)
            -- S? d?ng rawset ?? th¨ºm ph?n t? v¨¤o m?ng hi?u qu? h?n table.insert
            rawset(ary, #ary + 1, self:getCell(i, col)) 
        end
        return ary
    end,

    -- H¨¤m selectRowNum: T¨¬m s? h¨¤ng ch?a gi¨¢ tr? s? cho tr??c trong m?t c?t
    selectRowNum = function(self, col, value)
        local nRow = self:getRow()
        for i = 3, nRow do
            if tonumber(self:getCell(i, col)) == value then
                return i
            end
        end
        return 0 -- Tr? v? 0 n?u kh?ng t¨¬m th?y
    end,

    -- H¨¤m selectRowString: T¨¬m s? h¨¤ng ch?a gi¨¢ tr? chu?i cho tr??c trong m?t c?t
    selectRowString = function(self, col, value)
        local nRow = self:getRow()
        for i = 3, nRow do
            if self:getCell(i, col) == value then
                return i
            end
        end
        return 0 -- Tr? v? 0 n?u kh?ng t¨¬m th?y
    end,

    -- H¨¤m close: ?¨®ng t?p b?ng
    close = function(self)
        if self.__bOpen ~= 0 then -- Ki?m tra xem t?p ?? m? hay ch?a
            local bCloseFailed = 0
            local nCnt = 10 -- Th? ?¨®ng t?i ?a 10 l?n
            repeat
                bCloseFailed = TabFile_Unload(self.__filename) -- S? d?ng h¨¤m TabFile_Unload (h¨¤m ngo¨¤i)
                nCnt = nCnt - 1
            until bCloseFailed == 0 or nCnt <= 0 
            -- L?p l?i cho ??n khi ?¨®ng th¨¤nh c?ng ho?c ?? th? qu¨¢ s? l?n
        end
        self.__filename = nil -- X¨®a t¨ºn t?p
        self.__bOpen = 0 -- ?¨¢nh d?u t?p ?? ?¨®ng
    end,
}

-- H¨¤m ??c d? li?u t? t?p b?ng v¨¤ tr? v? m?t b?ng Lua v?i ch? s? l¨¤ s? c?t.
function ff_GetTabFileTable(szFilePath, nDataStartLine, handles, lineHandler)
    handles = handles or {} -- N?u kh?ng c¨® handles (h¨¤m x? ly d? li?u), g¨¢n gi¨¢ tr? m?c ??nh l¨¤ m?t b?ng r?ng
    nDataStartLine = nDataStartLine or 2 -- N?u kh?ng c¨® nDataStartLine, m?c ??nh l¨¤ 2 (d? li?u b?t ??u t? d¨°ng 2)

    local tbFile = new(KTabFile, szFilePath) -- T?o m?t ??i t??ng KTabFile ?? ??c t?p
    if not tbFile then -- N?u kh?ng m? ???c t?p, tr? v? b?ng r?ng
        TabFile_Unload(szFilePath) -- Gi?i ph¨®ng t?p
        return {}
    end

    local nRow = tbFile:getRow() -- L?y s? h¨¤ng
    local nCol = tbFile:getCol() -- L?y s? c?t
    local tbRet = {} -- T?o b?ng k?t qu?
    tbRet[0] = {} -- D¨°ng ??u ti¨ºn ch?a t¨ºn c?t

    -- ??c t¨ºn c?t
    for i = 1, nCol do
        tbRet[0][i] = tbFile:getCell(1, i) 
    end

    -- ??c d? li?u t? c¨¢c d¨°ng c¨°n l?i
    for i = 1, nRow - nDataStartLine + 1 do
        tbRet[i] = {} -- T?o m?t h¨¤ng m?i trong b?ng k?t qu?
        for j = 1, nCol do
            local szKey = tbRet[0][j] -- L?y t¨ºn c?t
            local data = tbFile:getCell(i + nDataStartLine - 1, j) -- L?y d? li?u

            -- X? ly d? li?u n?u c¨® h¨¤m x? ly
            local err
            if handles[szKey] then -- ?u ti¨ºn x? ly theo t¨ºn c?t
                data, err = handles[szKey](data)
            elseif handles[j] then -- N?u kh?ng c¨®, x? ly theo s? c?t
                data, err = handles[j](data)
            end
            if err then -- N?u c¨® l?i, b¨¢o l?i
                error(err)
            end

            tbRet[i][j] = data -- L?u d? li?u v¨¤o b?ng k?t qu?
        end

        -- G?i h¨¤m x? ly d¨°ng n?u c¨®
        if lineHandler then
            lineHandler(tbRet[i])
        end
    end

    tbFile:close() -- ?¨®ng t?p
    return tbRet -- Tr? v? b?ng k?t qu?
end

-- H¨¤m ??c d? li?u t? t?p b?ng v¨¤ tr? v? m?t b?ng Lua v?i ch? s? l¨¤ t¨ºn c?t.
function ff_GetTabFileTableEx(szFilePath, nDataStartLine, handles, lineHandler, keyline)
    keyline = keyline or 1 -- N?u kh?ng c¨® keyline, m?c ??nh l¨¤ 1 (d¨°ng ch?a t¨ºn c?t)
    handles = handles or {} -- N?u kh?ng c¨® handles, g¨¢n gi¨¢ tr? m?c ??nh l¨¤ m?t b?ng r?ng
    nDataStartLine = nDataStartLine or 2 -- N?u kh?ng c¨® nDataStartLine, m?c ??nh l¨¤ 2

    if szFilePath == "" or szFilePath == nil then return nil end -- N?u kh?ng c¨® ???ng d?n t?p, tr? v? nil

    local tbFile = new(KTabFile, szFilePath) -- T?o m?t ??i t??ng KTabFile ?? ??c t?p
    if not tbFile then -- N?u kh?ng m? ???c t?p, tr? v? b?ng r?ng
        TabFile_Unload(szFilePath) -- Gi?i ph¨®ng t?p
        return {}
    end

    local nRow = tbFile:getRow() -- L?y s? h¨¤ng
    local nCol = tbFile:getCol() -- L?y s? c?t
    local tbRet = {} -- T?o b?ng k?t qu?
    tbRet[0] = {} -- D¨°ng ??u ti¨ºn ch?a t¨ºn c?t

    -- ??c t¨ºn c?t v¨¤ lo?i b? kho?ng tr?ng
    for j = 1, nCol do
        tbRet[0][j] = string.gsub(tbFile:getCell(keyline, j), " ", "") 
    end

    -- ??c d? li?u t? c¨¢c d¨°ng c¨°n l?i
    for i = 1, nRow - nDataStartLine + 1 do
        tbRet[i] = {} -- T?o m?t h¨¤ng m?i trong b?ng k?t qu?
        for j = 1, nCol do
            local szKey = tbRet[0][j] -- L?y t¨ºn c?t
            local data = tbFile:getCell(i + nDataStartLine - 1, j) -- L?y d? li?u

            -- X? ly d? li?u n?u c¨® h¨¤m x? ly
            local err
            if handles[szKey] then -- ?u ti¨ºn x? ly theo t¨ºn c?t
                data, err = handles[szKey](data)
            elseif handles[j] then -- N?u kh?ng c¨®, x? ly theo s? c?t
                data, err = handles[j](data)
            end
            if err then -- N?u c¨® l?i, b¨¢o l?i
                error(err)
            end

            tbRet[i][szKey] = data -- L?u d? li?u v¨¤o b?ng k?t qu?
        end

        -- G?i h¨¤m x? ly d¨°ng n?u c¨®
        if lineHandler then
            lineHandler(tbRet[i])
        end
    end

    tbFile:close() -- ?¨®ng t?p
    return tbRet -- Tr? v? b?ng k?t qu?
end


-- H¨¤m ??c d? li?u t? t?p b?ng v¨¤ tr? v? m?t b?ng Lua v?i ch? s? l¨¤ gi¨¢ tr? c?a c?t ??u ti¨ºn (th??ng l¨¤ ID).
function ff_GetTabFileTableByStr(szFilePath, nDataStartLine, nKeyColumn, handles)
    handles = handles or {} -- N?u kh?ng c¨® handles, g¨¢n gi¨¢ tr? m?c ??nh l¨¤ m?t b?ng r?ng
    nDataStartLine = nDataStartLine or 2 -- N?u kh?ng c¨® nDataStartLine, m?c ??nh l¨¤ 2
    nKeyColumn = nKeyColumn or 1 -- N?u kh?ng c¨® nKeyColumn, m?c ??nh l¨¤ 1 (c?t ch?a ID)

    local tbFile = new(KTabFile, szFilePath) -- T?o m?t ??i t??ng KTabFile ?? ??c t?p
    if not tbFile then -- N?u kh?ng m? ???c t?p, tr? v? b?ng r?ng
        TabFile_Unload(szFilePath) -- Gi?i ph¨®ng t?p
        return {}
    end

    local nRow = tbFile:getRow() -- L?y s? h¨¤ng
    local nCol = tbFile:getCol() -- L?y s? c?t
    local tbKey = {} -- T?o b?ng ch?a t¨ºn c?t
    local tbRet = {} -- T?o b?ng k?t qu?

    -- ??c t¨ºn c?t
    for i = 1, nCol do
        if tbKey[i] ~= "" then
            tbKey[i] = tostring(tbFile:getCell(nDataStartLine - 1, i))
        end
    end

    -- ??c d? li?u t? c¨¢c d¨°ng c¨°n l?i
    for i = nDataStartLine, nRow do
        local curKey = tonumber(tbFile:getCell(i, nKeyColumn)) -- L?y gi¨¢ tr? ID (chuy?n v? s?)
        if curKey ~= nil then
            tbRet[curKey] = {} -- T?o m?t h¨¤ng m?i trong b?ng k?t qu? v?i ch? s? l¨¤ ID
            for j = 2, nCol do -- B?t ??u t? c?t th? 2 (b? qua c?t ID)
                local data = tbFile:getCell(i, j) -- L?y d? li?u

                -- X? ly d? li?u n?u c¨® h¨¤m x? ly
                if string.sub(tbKey[j], 1, 1) == 'n' then -- N?u t¨ºn c?t b?t ??u b?ng 'n', chuy?n d? li?u th¨¤nh s?
                    tbRet[curKey][tbKey[j]] = tonumber(data)
                else
                    if handles[j] then
                        data, err = handles[j](data)
                    end
                    tbRet[curKey][tbKey[j]] = data
                end
            end
        end
    end

    tbFile:close() -- ?¨®ng t?p
    return tbRet -- Tr? v? b?ng k?t qu?
end

-- H¨¤m chuy?n m?t chu?i c¨¢c s? th¨¤nh m?t b?ng c¨¢c s?.
function tonumbertable(strNumbers, spe)
    if not strNumbers then return {} end -- N?u kh?ng c¨® chu?i, tr? v? b?ng r?ng
    spe = spe or ',;' -- N?u kh?ng c¨® ky t? phan t¨¢ch, m?c ??nh l¨¤ ',' ho?c ';'

    local tRet = {}
    string.gsub(strNumbers, "([^"..spe.."]+)", function (x) table.insert(tRet, tonumber(x)) end)
    -- T¨¬m c¨¢c chu?i s? kh?ng ch?a ky t? phan t¨¢ch v¨¤ chuy?n ch¨²ng th¨¤nh s?, sau ?¨® th¨ºm v¨¤o b?ng tRet
    tRet.n = nil -- Lo?i b? ph?n t? cu?i c¨´ng (c¨® th? l¨¤ nil)
    return tRet
end

function tonumberex(strNumber)
	return tonumber(strNumber) or 0;
end
