-- ******************************************* Ch� th�ch b�i Vilh *****************************************************
-- T�n h�m		: 	gf_GetPlayerSexName
-- N�i dung			:	L�y t�n danh x�ng theo gi�i t�nh c�a ng��i ch�i.
-- Gi� tr� tr� v�	:	string (chu�i)
-- Tham s�		:	Kh�ng
-- V� d�		:
-- 			gf_GetPlayerSexName()
-- **********************************************************************************************************************
function gf_GetPlayerSexName()
    local strSex = "" -- Bi�n c�c b� l�u tr� danh x�ng
    if GetSex() == 1 then -- Ki�m tra n�u l� nam
        strSex = "Thi�u hi�p"
    elseif GetSex() == 2 then -- Ki�m tra n�u l� n�
        strSex = "N� hi�p"
    else -- Tr��ng h�p kh�ng x�c ��nh
        strSex = "Thi�u hi�p/N� hi�p"
    end
    return strSex -- Tr� v� danh x�ng t��ng �ng
end

-- ******************************************* Ch� th�ch b�i Vilh *****************************************************
-- T�n h�m			: 	gf_GetDistance
-- N�i dung			:	T�nh kho�ng c�ch gi�a hai �i�m tr�n b�n ��.
-- Gi� tr� tr� v�	:	number (s�)
-- Tham s�	(number)	:
--		* nX 			: T�a �� X c�a �i�m ��u.
--		* nY 			: T�a �� Y c�a �i�m ��u.
--		* nPosX 	: T�a �� X c�a �i�m th� hai (n�u kh�ng truy�n v�o, s� l�y t�a �� nh�n v�t).
--		* nPosY	: T�a �� Y c�a �i�m th� hai (n�u kh�ng truy�n v�o, s� l�y t�a �� nh�n v�t).
-- V� d�		:
-- 			local _,nMapX,nMapY = GetNpcWorldPos(nNpcIdx)
--			if gf_GetDistance(nMapX,nMapY) > 10 then
--				Msg2Player("B�n �ang � qu� xa m�c ti�u!")
--				return 0
--			end
-- **********************************************************************************************************************
function gf_GetDistance(nX, nY, nPosX, nPosY)
    if nPosX == nil or nPosY == nil then
        _, nPosX, nPosY = GetWorldPos() -- L�y t�a �� nh�n v�t n�u kh�ng ���c truy�n v�o
    end
    local nDis = math.floor(math.sqrt((nPosX - nX) ^ 2 + (nPosY - nY) ^ 2)) -- C�ng th�c t�nh kho�ng c�ch
    return nDis
end

function gf_GetRouteTable()
    return {2, 3, 4, 6, 8, 9, 11, 12, 14, 15, 17, 18, 20, 21, 23, 25, 26, 27, 29, 30, 31, 32}
end


function gf_MergeTable(...)
    local tbTable = {} -- B�ng k�t qu�
    local nIdx = 1 -- Ch� s� �� th�m ph�n t� v�o b�ng k�t qu�

    for i = 1, arg.n do -- Duy�t qua c�c b�ng ���c truy�n v�o
        for j = 1, #arg[i] do -- Duy�t qua c�c ph�n t� c�a m�i b�ng
            tbTable[nIdx] = arg[i][j] -- Th�m ph�n t� v�o b�ng k�t qu�
            nIdx = nIdx + 1 -- T�ng ch� s�
        end
    end

    return tbTable
end


function gf_GetNextRandomIndex(nCurIdx, nTableSize)
    local nRand = math.random(2, nTableSize) -- Sinh s� ng�u nhi�n t� 2 ��n nTableSize
    return (nCurIdx + nRand - 2) % nTableSize + 1 -- T�nh ch� s� ti�p theo, ��m b�o kh�ng tr�ng v�i nCurIdx
end

tRouteName =
{
	[0] = "V� m�n ph�i",
	[1] = "Thi�u L�m",
	[2] = "Thi�u L�m �ao",
	[3] = "Thi�u L�m Tr��ng",
	[4] = "Thi�u L�m Quy�n",
	[5] = "���ng M�n",
	[6] = "���ng M�n",
	[7] = "Nga My",
	[8] = "Nga Mi Ki�m",
	[9] = "Nga Mi ��n",
	[10] = "C�i Bang",
	[11] = "C�i Bang Quy�n",
	[12] = "C�i Bang B�ng",
	[13] = "V� �ang",
	[14] = "V� �ang Ki�m",
	[15] = "V� �ang B�t",
	[16] = "D��ng M�n",
	[17] = "D��ng Gia Th��ng",
	[18] = "D��ng Gia Cung",
	[19] = "Ng� ��c",
	[20] = "Hi�p ��c",
	[21] = "C� S�",
	[22] = "C�n L�n",
	[23] = "C�n L�n",
	[24] = "Minh gi�o",
	[25] = "Th�nh Chi�n",
	[26] = "Tr�n Binh",
	[27] = "Huy�t Nh�n",
	[28] = "Th�y Y�n",
	[29] = "V� Ti�n",
	[30] = "Linh N�",
	[31] = "���ng M�n Nh�m Hi�p",
	[32] = "C�n L�n Ki�m T�n",
};

-- ******************************************* Ch� th�ch b�i Vilh *****************************************************
-- T�n h�m			: 	gf_GetRouteName
-- N�i dung			:	L�y t�n tuy�n ���ng d�a tr�n ID tuy�n ���ng.
-- Gi� tr� tr� v�	:	string (chu�i)
-- Tham s�		:	nRoute (ID tuy�n ���ng, n�u kh�ng cung c�p s� l�y tuy�n ���ng hi�n t�i c�a ng��i ch�i)
-- **********************************************************************************************************************
function gf_GetRouteName(nRoute)
    nRoute = nRoute or GetPlayerRoute() or 9999 -- L�y nRoute n�u c�, n�u kh�ng l�y tuy�n ���ng c�a ng��i ch�i, m�c ��nh l� 9999
    local tRoute = { -- B�ng ch�a t�n c�c tuy�n ���ng
        [0] = "V� m�n ph�i",
        [1] = "Thi�u L�m",
        [2] = "Thi�u L�m �ao",
        [3] = "Thi�u L�m Tr��ng",
        [4] = "Thi�u L�m Quy�n",
        [5] = "���ng M�n",
        [6] = "���ng M�n", -- L�u �: ���ng M�n c� 2 ID l� 5 v� 6
        [7] = "Nga My",
        [8] = "Nga Mi Ki�m",
        [9] = "Nga Mi ��n",
        [10] = "C�i Bang",
        [11] = "C�i Bang Quy�n",
        [12] = "C�i Bang B�ng",
        [13] = "V� �ang",
        [14] = "V� �ang Ki�m",
        [15] = "V� �ang B�t",
        [16] = "D��ng M�n",
        [17] = "D��ng Gia Th��ng",
        [18] = "D��ng Gia Cung",
        [19] = "Ng� ��c",
        [20] = "Hi�p ��c",
        [21] = "C� S�",
        [22] = "C�n L�n",
        [23] = "C�n L�n", -- L�u �: C�n L�n c� 2 ID l� 22 v� 23
        [24] = "Minh gi�o",
        [25] = "Th�nh Chi�n",
        [26] = "Tr�n Binh",
        [27] = "Huy�t Nh�n",
        [28] = "Th�y Y�n",
        [29] = "Th�y Y�n V� N�",
        [30] = "Linh N�",
        [31] = "���ng M�n Nh�m Hi�p",
        [32] = "C�n L�n Ki�m T�n",
    }
    if nRoute < 0 or nRoute > #tRoute then -- Ki�m tra nRoute c� h�p l� kh�ng
        return "Kh�ng r� h��ng" -- N�u kh�ng h�p l�, tr� v� "Kh�ng r� h��ng"
    end
    return tRoute[nRoute] or "" -- Tr� v� t�n tuy�n ���ng t��ng �ng, n�u kh�ng c� th� tr� v� chu�i r�ng
end

-- ******************************************* Ch� th�ch b�i Vilh *****************************************************
-- T�n h�m			: 	gf_GetFactionName
-- N�i dung			:	L�y t�n m�n ph�i d�a tr�n ID m�n ph�i.
-- Gi� tr� tr� v�	:	string (chu�i)
-- Tham s�		:	nFac (ID m�n ph�i, n�u kh�ng cung c�p s� l�y m�n ph�i hi�n t�i c�a ng��i ch�i)
-- **********************************************************************************************************************
function gf_GetFactionName(nFac)
    nFac = nFac or GetPlayerFaction() or 9999 -- L�y nFac n�u c�, n�u kh�ng l�y m�n ph�i c�a ng��i ch�i, m�c ��nh l� 9999
    local tFaction = { -- B�ng ch�a t�n c�c m�n ph�i
        [0] = "V� m�n ph�i",
        [1] = "Thi�u L�m",
        [2] = "V� �ang",
        [3] = "Nga My",
        [4] = "C�i Bang",
        [5] = "���ng M�n",
        [6] = "D��ng M�n",
        [7] = "Ng� ��c",
        [8] = "C�n L�n",
        [9] = "Minh gi�o",
        [10] = "Th�y Y�n",
    }
    if nFac < 0 or nFac > #tFaction then -- Ki�m tra nFac c� h�p l� kh�ng
        return "Kh�ng r� m�n ph�i" -- N�u kh�ng h�p l�, tr� v� "Kh�ng r� m�n ph�i"
    end
    return tFaction[nFac] or "" -- Tr� v� t�n m�n ph�i t��ng �ng, n�u kh�ng c� th� tr� v� chu�i r�ng
end

-- ******************************************* Ch� th�ch b�i Vilh *****************************************************
-- T�n h�m			: 	gf_MinMax
-- N�i dung			:	Gi�i h�n m�t gi� tr� trong kho�ng min v� max.
-- Gi� tr� tr� v�	:	number (s�)
-- Tham s�		:
--  * nNum: Gi� tr� c�n gi�i h�n
--  * nMin: Gi� tr� nh� nh�t
--  * nMax: Gi� tr� l�n nh�t
-- **********************************************************************************************************************
function gf_MinMax(nNum, nMin, nMax)
    nNum = math.max(nNum, nMin) -- ��m b�o nNum kh�ng nh� h�n nMin
    nNum = math.min(nNum, nMax) -- ��m b�o nNum kh�ng l�n h�n nMax
    return nNum
end

-- ******************************************* Ch� th�ch b�i Vilh *****************************************************
-- T�n h�m        : gf_UnPack
-- M� t�         : Gi�i n�n (unpack) c�c gi� tr� t� m�t b�ng (table).
-- Tham s�       :
--    * tbTable   : B�ng c�n gi�i n�n.
--    * nStartIdx : Ch� s� b�t ��u gi�i n�n (m�c ��nh l� 1).
--    * nEndIdx   : Ch� s� k�t th�c gi�i n�n (m�c ��nh l� k�ch th��c b�ng).
-- Gi� tr� tr� v� : C�c gi� tr� ���c gi�i n�n t� b�ng.
-- **********************************************************************************************************************
function gf_UnPack(tbTable, nStartIdx, nEndIdx)
    local nSize = #tbTable -- L�y k�ch th��c c�a b�ng
    nStartIdx = nStartIdx or 1 -- N�u nStartIdx kh�ng ���c cung c�p, g�n gi� tr� m�c ��nh l� 1
    nEndIdx = nEndIdx or nSize -- N�u nEndIdx kh�ng ���c cung c�p, g�n gi� tr� m�c ��nh l� k�ch th��c b�ng
    if tbTable[nStartIdx] and nStartIdx <= nEndIdx then -- Ki�m tra ch� s� b�t ��u c� h�p l� kh�ng
        return tbTable[nStartIdx], gf_UnPack(tbTable, nStartIdx + 1, nEndIdx) -- Tr� v� gi� tr� t�i ch� s� b�t ��u v� ti�p t�c gi�i n�n
    end
end

-- ******************************************* Ch� th�ch b�i Vilh *****************************************************
-- T�n h�m        : gf_ColorReplace
-- M� t�         : Thay th� c�c th� m�u trong chu�i.
-- Tham s�       :
--    * szMsg      : Chu�i c�n thay th�.
-- Gi� tr� tr� v� : Chu�i sau khi �� thay th� th� m�u.
-- **********************************************************************************************************************
function gf_ColorReplace(szMsg)
    szMsg = string.gsub(szMsg, "<>", "<color>") -- Thay th� <> th�nh <color>
    szMsg = string.gsub(szMsg, "<r>", "<color=red>") -- Thay th� <r> th�nh <color=red>
    szMsg = string.gsub(szMsg, "<y>", "<color=yellow>") -- Thay th� <y> th�nh <color=yellow>
    szMsg = string.gsub(szMsg, "<g>", "<color=green>") -- Thay th� <g> th�nh <color=green>
    szMsg = string.gsub(szMsg, "<p>", "<color=purple>") -- Thay th� <p> th�nh <color=purple>
    return szMsg
end

-- ******************************************* Ch� th�ch b�i Vilh *****************************************************
-- T�n h�m        : gf_InRange
-- M� t�         : Ki�m tra m�t gi� tr� c� n�m trong m�t kho�ng n�o �� kh�ng.
-- Tham s�       :
--    * tbRange    : B�ng ch�a c�c kho�ng gi� tr� (vd: {{1, 10}, {20, 30}}).
--    * nValue     : Gi� tr� c�n ki�m tra.
-- Gi� tr� tr� v� : 1 n�u nValue n�m trong m�t trong c�c kho�ng, 0 n�u kh�ng.
-- **********************************************************************************************************************
function gf_InRange(tbRange, nValue)
    for i, v in ipairs(tbRange) do -- Duy�t qua c�c kho�ng trong tbRange
        if nValue >= v[1] and nValue <= v[2] then -- Ki�m tra nValue c� n�m trong kho�ng [v[1], v[2]] kh�ng
            return 1
        end
    end
    return 0
end

-- ******************************************* Ch� th�ch b�i Vilh *****************************************************
-- T�n h�m        : gf_GetDataTable
-- M� t�         : T�o m�t b�ng (table) t� c�c gi� tr� ��u v�o.
-- Tham s�       : ... (nhi�u gi� tr� s�)
-- Gi� tr� tr� v� : B�ng ch�a c�c gi� tr� ��u v�o.
-- **********************************************************************************************************************
function gf_GetDataTable(...)
    local t = {}
    for i = 1, arg.n do -- Duy�t qua c�c gi� tr� ��u v�o
        t[i] = arg[i] -- Th�m gi� tr� v�o b�ng
    end
    return t
end

-- ******************************************* Ch� th�ch b�i Vilh *****************************************************
-- T�n h�m        : gf_ProbabilityJudge
-- M� t�         : Ki�m tra x�c su�t x�y ra c�a m�t s� ki�n.
-- Tham s�       :
--    * nProbability : X�c su�t x�y ra (0-100).
-- Gi� tr� tr� v� : 1 n�u s� ki�n x�y ra, 0 n�u kh�ng.
-- **********************************************************************************************************************
function gf_ProbabilityJudge(nProbability)
    local StringFind = function(sString, nTag) -- H�m t�m v� tr� c�a k� t� trong chu�i
        for i = 1, string.len(sString) do
            if string.sub(sString, i, i) == nTag then
                return i
            end
        end
        return 0
    end

    if nProbability > 100 or nProbability < 0 then -- Ki�m tra x�c su�t c� h�p l� kh�ng
        return 0
    end

    local nDotPos = StringFind(tostring(nProbability), ".") -- T�m v� tr� d�u ch�m
    local nStrLen = string.len(tostring(nProbability)) -- T�nh �� d�i chu�i x�c su�t
    local nRandomNum = math.random(1, 100 * (10 ^ (nStrLen - nDotPos))) -- Sinh s� ng�u nhi�n

    if nRandomNum <= nProbability * (10 ^ (nStrLen - nDotPos)) then -- So s�nh s� ng�u nhi�n v�i x�c su�t
        return 1
    else
        return 0
    end
end

--����һ��table
--orgΪԴtable��desΪ���Ƴ�������table
function gf_CopyTable(org,des)
	des = des or {};
	local i,j
	for i,j in org do
		if(type(j)=="table") then
			if(not des[i]) then
				des[i]={}
				gf_CopyTable(j,des[i])
			end
		else
			if(not des[i]) then
				des[i]=j
			end
		end
	end
	return des;
end

-- ******************************************* Ch� th�ch b�i Vilh *****************************************************
-- T�n h�m        : gf_CopyTable
-- M� t�         : Sao ch�p m�t b�ng (table).
-- Tham s�       :
--    * org (table) : B�ng g�c c�n sao ch�p.
--    * des (table) : B�ng ��ch (n�u kh�ng cung c�p s� t� ��ng t�o m�i).
-- Gi� tr� tr� v� : B�ng ��ch (des) sau khi �� sao ch�p.
-- **********************************************************************************************************************
function gf_CopyTable(org, des)
    des = des or {} -- N�u des ch�a t�n t�i, t�o m�t b�ng m�i
    for i, j in pairs(org) do -- Duy�t qua t�ng ph�n t� trong b�ng g�c (org)
        if type(j) == "table" then -- N�u ph�n t� l� m�t b�ng
            if not des[i] then -- N�u ph�n t� t��ng �ng trong b�ng ��ch ch�a t�n t�i
                des[i] = {} -- T�o m�t b�ng m�i �� ch�a ph�n t� ��
                gf_CopyTable(j, des[i]) -- �� quy sao ch�p b�ng con
            end
        else -- N�u ph�n t� kh�ng ph�i l� b�ng
            if not des[i] then -- N�u ph�n t� t��ng �ng trong b�ng ��ch ch�a t�n t�i
                des[i] = j -- Sao ch�p gi� tr� c�a ph�n t�
            end
        end
    end
    return des
end

-- ******************************************* Ch� th�ch b�i Vilh *****************************************************
-- T�n h�m        : gf_FixColor
-- M� t�         : Th�m m� m�u cho �o�n text.
-- Tham s�       :
--    * szString (string)  : �o�n text c�n th�m m�u.
--    * nColor (number)    : M� m�u (1: ��, 2: xanh l�, 3: xanh d��ng, 4: v�ng).
--    * nIsNpcSay (boolean) : C� ph�i l� l�i n�i c�a NPC kh�ng (m�c ��nh l� kh�ng).
-- Gi� tr� tr� v� : �o�n text �� ���c th�m m� m�u.
-- **********************************************************************************************************************
function gf_FixColor(szString, nColor, nIsNpcSay)
    local tbColor = { -- B�ng m�u
        [1] = "red",
        [2] = "green",
        [3] = "blue",
        [4] = "yellow",
    }
    if nIsNpcSay == nil or nIsNpcSay == 0 then -- N�u kh�ng ph�i l�i n�i c�a NPC
        szString = string.format("<color=%s>%s<color>", tbColor[nColor], szString)
    else -- N�u l� l�i n�i c�a NPC
        szString = string.format("<color=%s>%s:<color>", tbColor[nColor], szString)
    end
    return szString
end

-- ******************************************* Ch� th�ch b�i Vilh *****************************************************
-- T�n h�m        : gf_DoNothing
-- M� t�         : H�m r�ng (kh�ng l�m g� c�).
-- **********************************************************************************************************************
function gf_DoNothing()
end

-- ******************************************* Ch� th�ch b�i Vilh *****************************************************
-- T�n h�m        : gf_Inherit
-- M� t�         : T�o m�t b�ng (table) m�i k� th�a t� m�t b�ng kh�c.
-- Tham s�       :
--    * base (table) : B�ng cha.
-- Gi� tr� tr� v� : B�ng con �� k� th�a t� b�ng cha.
-- **********************************************************************************************************************
function gf_Inherit(base)
    local derive = {} -- B�ng con
    local foo = function(t, i) return base[i] end -- H�m trung gian �� truy xu�t ph�n t� t� b�ng cha
    settag(derive, newtag()) -- Thi�t l�p tag cho b�ng con
    settagmethod(tag(derive), "index", foo) -- Thi�t l�p ph��ng th�c index �� truy xu�t t� b�ng cha
    for i, v in pairs(base) do -- Duy�t qua t�ng ph�n t� trong b�ng cha
        if type(v) == "table" then -- N�u ph�n t� l� m�t b�ng
            derive[i] = gf_Inherit(v) -- �� quy k� th�a b�ng con
        end
    end
    return derive
end

-- (C�c h�m c�n l�i �� ���c gi� nguy�n do �� c� ch� th�ch r� r�ng trong ph�n tr��c)
-- Sao ch�p m�t ��i t��ng (b�ng), k� th�a to�n b� thu�c t�nh t� ��i t��ng g�c (b�ng g�c).
function gf_CopyInherit(...)
    -- T�o m�t b�ng m�i b�ng c�ch h�p nh�t c�c b�ng ��u v�o.
    local base = gf_Merge2(gf_UnPack(arg));

    -- T�o m�t ��i t��ng m�i k� th�a t� b�ng 'base'.
    local derive = new(base);
    return derive -- Tr� v� ��i t��ng m�i.
end

-- H�p nh�t nhi�u b�ng th�nh m�t b�ng duy nh�t.
function gf_Merge2(...)
    local base = {} -- B�ng k�t qu�.
    for i = 1, arg.n do -- Duy�t qua t�ng b�ng ��u v�o.
        for k, v in arg[i] do -- Duy�t qua t�ng c�p key-value trong b�ng.
            base[k] = arg[i][k]; -- Sao ch�p key-value v�o b�ng k�t qu�.
        end
    end
    return base -- Tr� v� b�ng k�t qu�.
end

-- (H�m n�y kh�ng l�m g� c�, c� th� ���c s� d�ng nh� placeholder).
function nothing()
end;

-- Ch�n ng�u nhi�n m�t m�c t� m�t b�ng t� l�, c� th� ch� ��nh d�ng c� th�.
function gf_RandRate(tRate, nMax, nLine)
    nLine = nLine or 1; -- N�u kh�ng ch� ��nh d�ng, m�c ��nh l� d�ng 1.

    -- N�u kh�ng cung c�p nMax, t�nh t�ng gi� tr� trong d�ng nLine.
    if not nMax then
        nMax = 0;
        for i = 1, getn(tRate) do
            nMax = nMax + tRate[i][nLine];
        end
    end

    local nRand = random(nMax) -- Ch�n ng�u nhi�n m�t s� trong kho�ng [1, nMax].

    -- Duy�t qua c�c m�c trong b�ng t� l� �� t�m m�c t��ng �ng v�i s� ng�u nhi�n.
    for i = 1, getn(tRate) do
        if nRand <= tRate[i][nLine] then -- N�u s� ng�u nhi�n nh� h�n ho�c b�ng gi� tr� trong d�ng, tr� v� m�c �� v� ch� s�.
            return tRate[i], i;
        else -- N�u kh�ng, tr� gi� tr� �� �i v� ti�p t�c ki�m tra m�c ti�p theo.
            nRand = nRand - tRate[i][nLine];
        end
    end
end

-- Ch�n ng�u nhi�n m�t m�c t� m�t b�ng d� li�u d�a tr�n ch� s� ng�u nhi�n.
function gf_RandomSelected(tData, nRndIdx)
    if not tData or 0 == getn(tData) then -- Ki�m tra n�u b�ng d� li�u r�ng.
        return 0;
    end

    local nMax = 0;
    for idx, tInfo in tData do -- T�nh t�ng gi� tr� t�i ch� s� ng�u nhi�n c�a c�c m�c trong b�ng.
        if type(tInfo) == "table" then
            nMax = nMax + tInfo[nRndIdx];
        end
    end

    local nRand = random(1, nMax); -- Ch�n ng�u nhi�n m�t s� trong kho�ng [1, nMax].

    -- T�m m�c t��ng �ng v�i s� ng�u nhi�n.
    for idx, tInfo in tData do
        if type(tInfo) == "table" then
            nRand = nRand - tInfo[nRndIdx];
            if nRand <= 0 then
                return idx;
            end
        end
    end

    return 0;
end

-- L�y s� l�n t�i sinh c�a ng��i ch�i.
function gf_GetPlayerRebornCount()
    local nAddvanceTrans = GetPlayerRebornParam(0)
    if nAddvanceTrans > 0 then
        -- N�u �� chuy�n sinh cao c�p, tr� v� s� l�n chuy�n sinh c�ng th�m 5.
        return nAddvanceTrans + 5
    end

    -- N�u ch�a chuy�n sinh cao c�p, tr� v� s� l�n t�i sinh t� nhi�m v� 1538.
    return GetByte(GetTask(1538), 1)
end

-- T�nh c�p �� chuy�n sinh (t�ng s� l�n t�i sinh * 100 + c�p �� hi�n t�i).
function gf_GetTransLevel()
    return gf_GetPlayerRebornCount()*100+GetLevel()
end

-- L�y ng�y hi�n t�i � ��nh d�ng YYYYMMDD.
function gf_TodayDate()
    return tonumber(date("%Y%m%d"));
end

-- ��ng g�i ba s� nguy�n nG, nD, nP th�nh m�t s� nguy�n duy nh�t nGDP.
-- Gi� ��nh nG, nD n�m trong kho�ng [0, 255] v� nP n�m trong kho�ng [0, 65535].
function gf_PackItemGDP(nG, nD, nP)
    -- ��nh ngh�a c�c h�ng s� �� bi�u di�n c�c bit d�ch chuy�n.
    local _BIT_16 = 65536; -- 2^16
    local _BIT_24 = 16777216; -- 2^24

    -- Ki�m tra t�nh h�p l� c�a c�c gi� tr� ��u v�o.
    if not nG or 0 > nG or nG > 255 then return 0; end
    if not nD or 0 > nD or nD > 255 then return 0; end
    if not nP or 0 > nP or nP > 65535 then return 0; end

    -- ��ng g�i c�c gi� tr� v�o m�t s� nguy�n duy nh�t b�ng c�ch d�ch bit.
    -- nG ���c d�ch tr�i 24 bit, nD ���c d�ch tr�i 16 bit, v� nP gi� nguy�n.
    return nG * _BIT_24 + nD * _BIT_16 + nP;
end

-- Gi�i n�n s� nguy�n nGDP th�nh ba s� nguy�n nG, nD, nP.
function gf_UnpackItemGDP(nGDP)
    local _BIT_16 = 65536;
    local _BIT_24 = 16777216;
    local nG, nD = 0, 0;

    -- Ki�m tra xem nGDP c� l�n h�n 2^24 kh�ng, n�u c� th� l�y ph�n nguy�n c�a nGDP chia cho 2^24 �� c� nG.
    if nGDP > _BIT_24 then
        nG = math.floor(nGDP / _BIT_24); -- L�y ph�n nguy�n c�a ph�p chia
        nGDP = nGDP - _BIT_24 * nG; -- C�p nh�t nGDP b�ng ph�n d� c�a ph�p chia
    end

    -- Ki�m tra xem nGDP c� l�n h�n 2^16 kh�ng, n�u c� th� l�y ph�n nguy�n c�a nGDP chia cho 2^16 �� c� nD.
    if nGDP > _BIT_16 then
        nD = math.floor(nGDP / _BIT_16);
        nGDP = nGDP - _BIT_16 * nD;
    end

    -- Tr� v� ba gi� tr� nG, nD, nP.
    return nG, nD, nGDP;
end

-- H�m t�ch m�t chu�i th�nh m�t m�ng c�c chu�i con d�a tr�n d�u ph�n c�ch (separator).
function split(str, splitor)
    if (splitor == nil) then -- N�u kh�ng cung c�p d�u ph�n c�ch, s� d�ng d�u ph�y l�m m�c ��nh.
        splitor = ","
    end

    local strArray = {} -- T�o m�t m�ng tr�ng �� l�u c�c chu�i con.
    local strStart = 1 -- V� tr� b�t ��u t�m ki�m d�u ph�n c�ch.
    local splitorLen = string.len(splitor) -- �� d�i c�a d�u ph�n c�ch.

    -- T�m ki�m v� tr� ��u ti�n c�a d�u ph�n c�ch trong chu�i.
    local index = string.find(str, splitor, strStart)
    if (index == nil) then -- N�u kh�ng t�m th�y d�u ph�n c�ch, tr� v� m�ng ch�a to�n b� chu�i ban ��u.
        strArray[1] = str
        return strArray
    end

    local i = 1 -- Ch� s� c�a ph�n t� trong m�ng.

    -- L�p l�i vi�c t�m ki�m d�u ph�n c�ch v� t�ch chu�i.
    while index do
        strArray[i] = string.sub(str, strStart, index - 1) -- L�y chu�i con t� v� tr� b�t ��u ��n tr��c d�u ph�n c�ch.
        i = i + 1 -- T�ng ch� s� ph�n t�.
        strStart = index + splitorLen -- C�p nh�t v� tr� b�t ��u t�m ki�m.
        index = string.find(str, splitor, strStart) -- T�m ki�m d�u ph�n c�ch ti�p theo.
    end

    -- Th�m ph�n t� cu�i c�ng v�o m�ng.
    strArray[i] = string.sub(str, strStart, string.len(str))

    return strArray -- Tr� v� m�ng ch�a c�c chu�i con.
end

-- Sao ch�p s�u m�t b�ng (table) v� c�c b�ng con c�a n�, ��ng th�i duy tr� li�n k�t ��n class (n�u c�).
function __clone(org, des)
    -- Duy�t qua t�ng c�p key-value trong b�ng g�c (org).
    for i, j in pairs(org) do
        if type(j) == "table" then
            -- N�u gi� tr� l� m�t b�ng, t�o m�t b�ng m�i t��ng �ng trong b�ng ��ch (des) v� g�i �� quy __clone.
            des[i] = {}
            __clone(j, des[i])
        elseif type(j) == "userdata" and getmetatable(j).__type == "class" then
            -- N�u gi� tr� l� m�t ��i t��ng class, sao ch�p n� b�ng c�ch t�o m�t instance m�i c�ng class v� g�n v�o b�ng ��ch.
            des[i] = j:clone()
        else
            -- N�u kh�ng, ��n gi�n sao ch�p gi� tr� v�o b�ng ��ch.
            des[i] = j
        end
    end
end

-- T�ch m�t chu�i th�nh m�t m�ng c�c s�, lo�i b� c�c ph�n t� kh�ng ph�i s�.
function gf_SplitStr2NumArray(str, splitor)
    -- T�o m�t m�ng tr�ng �� l�u tr� c�c s�.
    local tNumArray = {};

    -- T�ch chu�i th�nh m�ng c�c chu�i con d�a tr�n d�u ph�n c�ch.
    local tStrArray = split(str, splitor);

    -- Duy�t qua m�ng c�c chu�i con.
    for i = 1, #tStrArray do
        local nNum = tonumber(tStrArray[i]); -- Chuy�n chu�i con th�nh s�.

        -- N�u chuy�n ��i th�nh c�ng (nNum kh�c nil), th�m s� v�o m�ng k�t qu�.
        if nNum then
            table.insert(tNumArray, nNum);
        end
    end

    -- Lo�i b� thu�c t�nh 'n' c�a m�ng (n�u c�), th��ng ���c th�m b�i h�m split.
    tNumArray.n = nil;

    return tNumArray; -- Tr� v� m�ng c�c s�.
end


-- In n�i dung c�a m�t b�ng (table) ra console, c� th�t l� �� hi�n th� c�u tr�c.
function gf_PrintTable(t, n)
    -- Ki�m tra xem ��u v�o c� ph�i l� m�t b�ng hay kh�ng.
    if type(t) ~= "table" then
        return 0; -- N�u kh�ng ph�i b�ng, kh�ng l�m g� c�.
    end

    -- Thi�t l�p �� th�t l� ban ��u, m�c ��nh l� 0 n�u kh�ng cung c�p.
    n = n or 0;

    -- T�o m�t chu�i kho�ng tr�ng �� th�t l�.
    local str_space = "";
    for i = 0, n do
        str_space = str_space .. " "; -- Th�m kho�ng tr�ng v�o chu�i.
    end

    -- In d�u ngo�c nh�n m� ��u b�ng.
    print(str_space .. "{");

    -- Duy�t qua t�ng c�p kh�a-gi� tr� trong b�ng.
    for k, v in pairs(t) do
        -- T�o chu�i hi�n th� kh�a v� gi� tr�.
        local str_k_v = str_space .. " [" .. tostring(k) .. "] = ";

        -- Ki�m tra xem gi� tr� c� ph�i l� m�t b�ng kh�c hay kh�ng.
        if type(v) == "table" then
            -- N�u l� b�ng, in chu�i kh�a v� d�u xu�ng d�ng.
            print(str_k_v);

            -- G�i �� quy h�m gf_PrintTable �� in b�ng con v�i �� th�t l� t�ng th�m 1.
            gf_PrintTable(v, n + 1);
        else
            -- N�u kh�ng ph�i b�ng, in chu�i kh�a v� gi� tr� tr�n c�ng m�t d�ng.
            str_k_v = str_k_v .. tostring(v);
            print(str_k_v);
        end
    end

    -- In d�u ngo�c nh�n k�t th�c b�ng.
    print(str_space .. "}");
end
