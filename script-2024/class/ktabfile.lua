
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ����ļ���ȡ����ͷ�ļ�
-- ���ݽ����� KTabFile ����Щ���޸�
-- Edited by peres
-- 2005/04/12 PM 16:38

-- ������  Ϩ����
-- ��ʧ��  ��ס��
-- ��վ��  ��������
-- ����    ������ѿ
-- �ȴ�    꼻��ٿ�
-- �ѷҷ�  �����껪
-- �˰�    û�е���
-- ����Ȼ  ������
-- ���    ˢ����ͷ��
-- ������  �һ��
-- ����    �Ҷ��Լ�˵
-- �Ҳ�����
-- �Һܰ���

-- lyrics : �˰���
-- �峤2011-2-17���ӹ���
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

	-- ��������ȡ��������Ϊһ����ά����
	createArray = function(self, col)
		local nRow = self:getRow();
		local ary = {};
		local i=0;
		
		for i=3, nRow do
			rawset(ary, getn(ary)+1, self:getCell(i, col));
		end;
		
		return ary;
		
	end,
	
	-- ��������ȷ������ֵ����Ϊ�ڼ��У����֣�
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
	
	-- ��������ȷ������ֵ����Ϊ�ڼ��У��ַ���
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
	
	--�ر�
	close = function(self)
		if self.__bOpen ~= 0 then
			local bCloseFailed = 0;
			local nCnt = 10;--��ೢ��ɾ��10��
			repeat
				bCloseFailed = TabFile_Unload(self.__filename);
				nCnt = nCnt - 1;
			until bCloseFailed == 0 or nCnt <= 0;
		end
		self.__filename = nil;
		self.__bOpen = 0;
	end,
}

--�������ļ��ж�ȡ���ݣ�����һ����ʽ��Ӧ��table
--�����ļ���һ��Ϊ��ͷ���ڶ��п�ʼ�Ǿ�������
--��������Ϊ����
function ff_GetTabFileTable(szFilePath,nDataStartLine,handles, lineHandler)
	handles = handles or {}
	nDataStartLine = nDataStartLine or 2;	--����������Ĭ�ϴӵ�2�п�ʼ
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
		tbRet[0][i] = tbFile:getCell(1,i);	--����0Ϊ��ͷ����
	end;	
	for i = 1, nRow-nDataStartLine+1 do
		tbRet[i] = {};
		for j = 1, nCol do
			local szKey = tbRet[0][j];
			local data = tbFile:getCell(i+nDataStartLine-1,j);	--������
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

--�Ա�ͷ�ַ���Ϊ����
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
		tbRet[0][j] = gsub(tbFile:getCell(keyline, j), " ", ""); --����0Ϊ��ͷ����
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

--���ַ�Ϊkey,���ݿ�ʼ��������һ��Ϊkey����һ��Ϊһ�����ݵ�key��һ��Ϊid
function ff_GetTabFileTableByStr(szFilePath,nDataStartLine, nKeyColume,handles)
	handles = handles or {}
	nDataStartLine = nDataStartLine or 2;	--����������Ĭ�ϴӵ�2�п�ʼ
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
			tbKey[i] = tostring(tbFile:getCell(nDataStartLine-1,i));	--����0Ϊ��ͷ����
		end
	end;	
	for i = nDataStartLine, nRow do
		local curKey = tonumber(tbFile:getCell(i,nKeyColume))
		if curKey ~= nil then
			tbRet[curKey] = {};
			for j = 2, nCol do
				local data = tbFile:getCell(i,j);	--������
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
