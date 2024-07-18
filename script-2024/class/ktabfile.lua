
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 表格文件读取函数头文件
-- 根据剑网的 KTabFile 做了些许修改
-- Edited by peres
-- 2005/04/12 PM 16:38

-- 看见的  熄灭了
-- 消失的  记住了
-- 我站在  海脚天涯
-- 听见    土壤萌芽
-- 等待    昙花再开
-- 把芬芳  留给年华
-- 彼岸    没有灯塔
-- 我依然  张望着
-- 天黑    刷白了头发
-- 紧握着  我火把
-- 他来    我对自己说
-- 我不害怕
-- 我很爱他

-- lyrics : 彼岸花
-- 村长2011-2-17增加功能
-- ======================================================

Include("\\script\\class\\mem.lua");

KTabFile = {
	__encodeType = 0,
	__new = function(self,arg)
		if (not arg) then return end
		self:load(arg[1])
	end,

	load = function(self,filename)
		self.__filename = filename
		if(TabFile_Load(filename) ==0) then
			return nil
		end
		self.__bOpen = 1;
		return 1
	end,

	getCell = function(self,row,col)
		return TabFile_GetData(self.__filename,row,col, "", self.__encodeType)
	end,

	getRow = function(self)
		return TabFile_GetRowCount(self.__filename)
	end,
	
	getCol = function(self)
		return TabFile_GetColCount(self.__filename)
	end,

	-- 根据列名取出单列作为一个单维数组
	createArray = function(self, col)
		local nRow = self:getRow();
		local ary = {};
		local i=0;
		
		for i=3, nRow do
			rawset(ary, getn(ary)+1, self:getCell(i, col));
		end;
		
		return ary;
		
	end,
	
	-- 根据列来确定该数值的行为第几行（数字）
	selectRowNum = function(self, col, value)
		local nRow = self:getRow();
		local i=0;
		
		for i=3, nRow do
			if tonumber(self:getCell(i, col))==value then
				return i;
			end;
		end;
		
		return 0;
	end,
	
	-- 根据列来确定该数值的行为第几行（字符）
	selectRowString = function(self, col, value)
		local nRow = self:getRow();
		local i=0;
		
		for i=3, nRow do
			if self:getCell(i, col)==value then
				return i;
			end;
		end;
		
		return 0;	
	end,
	
	--关闭
	close = function(self)
		if self.__bOpen ~= 0 then
			local bCloseFailed = 0;
			local nCnt = 10;--最多尝试删除10次
			repeat
				bCloseFailed = TabFile_Unload(self.__filename);
				nCnt = nCnt - 1;
			until bCloseFailed == 0 or nCnt <= 0;
		end
		self.__filename = nil;
		self.__bOpen = 0;
	end,
}

--从配置文件中读取数据，返回一个格式对应的table
--配置文件第一行为表头，第二行开始是具体数据
--以列数作为索引
function ff_GetTabFileTable(szFilePath,nDataStartLine,handles, lineHandler)
	handles = handles or {}
	nDataStartLine = nDataStartLine or 2;	--真正的数据默认从第2行开始
	local tbFile = new(KTabFile, szFilePath);
	if not tbFile then
		TabFile_Unload(szFilePath);
		return {};
	end;
	local nRow = tbFile:getRow();
	local nCol = tbFile:getCol();
	local tbRet = {};
	tbRet[0] = {};
	for i = 1, nCol do
		tbRet[0][i] = tbFile:getCell(1,i);	--索引0为表头内容
	end;	
	for i = 1, nRow-nDataStartLine+1 do
		tbRet[i] = {};
		for j = 1, nCol do
			local szKey = tbRet[0][j];
			local data = tbFile:getCell(i+nDataStartLine-1,j);	--读数据
			local err
			if handles[szKey] then
				data, err = handles[szKey](data);
			elseif handles[j] then
				data, err = handles[j](data);
			end
			if err then
				error(err)
			end
			tbRet[i][j] = data;
		end;
		if lineHandler then
			lineHandler(tbRet[i]);
		end
	end;
	tbFile:close();
	return tbRet;
end;

--以表头字符作为索引
function ff_GetTabFileTableEx(szFilePath,nDataStartLine,handles, lineHandler, keyline)
	if not keyline then keyline = 1 end
	handles = handles or {}
	nDataStartLine = nDataStartLine or 2;
	--szFilePath = sf_RemoveEndSpace(szFilePath)
	if szFilePath == "" or szFilePath == nil then return nil end
	local tbFile = new(KTabFile,szFilePath);
	if not tbFile then
		TabFile_Unload(szFilePath);
		return {};
	end;
	local nRow = tbFile:getRow();
	local nCol = tbFile:getCol();
	local tbRet = {};
	tbRet[0] = {};
	for j = 1, nCol do
		tbRet[0][j] = gsub(tbFile:getCell(keyline, j), " ", ""); --索引0为表头内容
	end;	
	for i = 1, nRow-nDataStartLine+1 do
		tbRet[i] = {};
		for j = 1, nCol do
			local szKey = tbRet[0][j];
			local data = tbFile:getCell(i+nDataStartLine-1, j);
			local err
			if handles[szKey] then
				data, err = handles[szKey](data);
			elseif handles[j] then
				data, err = handles[j](data);
			end
			if err then
				error(err)
			end
			tbRet[i][szKey] = data;
		end;
		if lineHandler then
			lineHandler(tbRet[i]);
		end
	end;
	tbFile:close();
	return tbRet;
end;

--以字符为key,数据开始行数的上一行为key，第一列为一行数据的key，一般为id
function ff_GetTabFileTableByStr(szFilePath,nDataStartLine, nKeyColume,handles)
	handles = handles or {}
	nDataStartLine = nDataStartLine or 2;	--真正的数据默认从第2行开始
	if not nKeyColume then nKeyColume = 1 end
	local tbFile = new(KTabFile, szFilePath);
	if not tbFile then
		TabFile_Unload(szFilePath);
		return {};
	end;
	local nRow = tbFile:getRow();
	local nCol = tbFile:getCol();
	local tbKey = {}
	local tbRet = {};
	for i = 1, nCol do
		if tbKey[i] ~= "" then
			tbKey[i] = tostring(tbFile:getCell(nDataStartLine-1,i));	--索引0为表头内容
		end
	end;	
	for i = nDataStartLine, nRow do
		local curKey = tonumber(tbFile:getCell(i,nKeyColume))
		if curKey ~= nil then
			tbRet[curKey] = {};
			for j = 2, nCol do
				local data = tbFile:getCell(i,j);	--读数据
				if strsub(tbKey[j],1,1) == 'n' then
					tbRet[curKey][tbKey[j]] = tonumber(data)
				else
					if handles[j] then
						data, err = handles[j](data);
					end
					tbRet[curKey][tbKey[j]] = data
				end
			end;
		end
	end;
	tbFile:close();
	return tbRet;
end;

function tonumbertable(strNumbers, spe)
	if not strNumbers then return {} end
	spe = spe or ',;';
	local tRet = {}
	gsub(strNumbers, "([^"..spe.."]+)", function (x) tinsert(%tRet, tonumber(x)) end )
	tRet.n = nil;
	return tRet;
end
function tonumberex(strNumber)
	return tonumber(strNumber) or 0;
end
