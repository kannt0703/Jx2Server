-- ******************************************* Chó thÝch bëi Vilh *****************************************************
-- Tªn hµm		: 	gf_GetPlayerSexName
-- Néi dung			:	LÊy tªn danh x­ng theo giíi tÝnh cña ng­êi ch¬i.
-- Gi¸ trÞ tr¶ vÒ	:	string (chuçi)
-- Tham sè		:	Kh«ng
-- VÝ dô		:
-- 			gf_GetPlayerSexName()
-- **********************************************************************************************************************
function gf_GetPlayerSexName()
    local strSex = "" -- BiÕn côc bé l­u tr÷ danh x­ng
    if GetSex() == 1 then -- KiÓm tra nÕu lµ nam
        strSex = "ThiÕu hiÖp"
    elseif GetSex() == 2 then -- KiÓm tra nÕu lµ n÷
        strSex = "N÷ hiÖp"
    else -- Tr­êng hîp kh«ng x¸c ®Þnh
        strSex = "ThiÕu hiÖp/N÷ hiÖp"
    end
    return strSex -- Tr¶ vÒ danh x­ng t­¬ng øng
end

-- ******************************************* Chó thÝch bëi Vilh *****************************************************
-- Tªn hµm			: 	gf_GetDistance
-- Néi dung			:	TÝnh kho¶ng c¸ch gi÷a hai ®iÓm trªn b¶n ®å.
-- Gi¸ trÞ tr¶ vÒ	:	number (sè)
-- Tham sè	(number)	:
--		* nX 			: Täa ®é X cña ®iÓm ®Çu.
--		* nY 			: Täa ®é Y cña ®iÓm ®Çu.
--		* nPosX 	: Täa ®é X cña ®iÓm thø hai (nÕu kh«ng truyÒn vµo, sÏ lÊy täa ®é nh©n vËt).
--		* nPosY	: Täa ®é Y cña ®iÓm thø hai (nÕu kh«ng truyÒn vµo, sÏ lÊy täa ®é nh©n vËt).
-- VÝ dô		:
-- 			local _,nMapX,nMapY = GetNpcWorldPos(nNpcIdx)
--			if gf_GetDistance(nMapX,nMapY) > 10 then
--				Msg2Player("B¹n ®ang ë qu¸ xa môc tiªu!")
--				return 0
--			end
-- **********************************************************************************************************************
function gf_GetDistance(nX, nY, nPosX, nPosY)
    if nPosX == nil or nPosY == nil then
        _, nPosX, nPosY = GetWorldPos() -- LÊy täa ®é nh©n vËt nÕu kh«ng ®­îc truyÒn vµo
    end
    local nDis = math.floor(math.sqrt((nPosX - nX) ^ 2 + (nPosY - nY) ^ 2)) -- C«ng thøc tÝnh kho¶ng c¸ch
    return nDis
end

function gf_GetRouteTable()
    return {2, 3, 4, 6, 8, 9, 11, 12, 14, 15, 17, 18, 20, 21, 23, 25, 26, 27, 29, 30, 31, 32}
end


function gf_MergeTable(...)
    local tbTable = {} -- B¶ng kÕt qu¶
    local nIdx = 1 -- ChØ sè ®Ó thªm phÇn tö vµo b¶ng kÕt qu¶

    for i = 1, arg.n do -- DuyÖt qua c¸c b¶ng ®­îc truyÒn vµo
        for j = 1, #arg[i] do -- DuyÖt qua c¸c phÇn tö cña mçi b¶ng
            tbTable[nIdx] = arg[i][j] -- Thªm phÇn tö vµo b¶ng kÕt qu¶
            nIdx = nIdx + 1 -- T¨ng chØ sè
        end
    end

    return tbTable
end


function gf_GetNextRandomIndex(nCurIdx, nTableSize)
    local nRand = math.random(2, nTableSize) -- Sinh sè ngÉu nhiªn tõ 2 ®Õn nTableSize
    return (nCurIdx + nRand - 2) % nTableSize + 1 -- TÝnh chØ sè tiÕp theo, ®¶m b¶o kh«ng trïng víi nCurIdx
end

tRouteName =
{
	[0] = "V« m«n ph¸i",
	[1] = "ThiÕu L©m",
	[2] = "ThiÕu L©m §ao",
	[3] = "ThiÕu L©m Tr­îng",
	[4] = "ThiÕu L©m QuyÒn",
	[5] = "§­êng M«n",
	[6] = "§­êng M«n",
	[7] = "Nga My",
	[8] = "Nga Mi KiÕm",
	[9] = "Nga Mi §µn",
	[10] = "C¸i Bang",
	[11] = "C¸i Bang QuyÒn",
	[12] = "C¸i Bang Bæng",
	[13] = "Vâ §ang",
	[14] = "Vâ §ang KiÕm",
	[15] = "Vâ §ang Bót",
	[16] = "D­¬ng M«n",
	[17] = "D­¬ng Gia Th­¬ng",
	[18] = "D­¬ng Gia Cung",
	[19] = "Ngò §éc",
	[20] = "HiÖp §éc",
	[21] = "Cæ S­",
	[22] = "C«n L«n",
	[23] = "C«n L«n",
	[24] = "Minh gi¸o",
	[25] = "Th¸nh ChiÕn",
	[26] = "TrËn Binh",
	[27] = "HuyÕt Nh©n",
	[28] = "Thóy Yªn",
	[29] = "Vò Tiªn",
	[30] = "Linh N÷",
	[31] = "§­êng M«n NhËm HiÖp",
	[32] = "C«n L«n KiÕm T«n",
};

-- ******************************************* Chó thÝch bëi Vilh *****************************************************
-- Tªn hµm			: 	gf_GetRouteName
-- Néi dung			:	LÊy tªn tuyÕn ®­êng dùa trªn ID tuyÕn ®­êng.
-- Gi¸ trÞ tr¶ vÒ	:	string (chuçi)
-- Tham sè		:	nRoute (ID tuyÕn ®­êng, nÕu kh«ng cung cÊp sÏ lÊy tuyÕn ®­êng hiÖn t¹i cña ng­êi ch¬i)
-- **********************************************************************************************************************
function gf_GetRouteName(nRoute)
    nRoute = nRoute or GetPlayerRoute() or 9999 -- LÊy nRoute nÕu cã, nÕu kh«ng lÊy tuyÕn ®­êng cña ng­êi ch¬i, mÆc ®Þnh lµ 9999
    local tRoute = { -- B¶ng chøa tªn c¸c tuyÕn ®­êng
        [0] = "V« m«n ph¸i",
        [1] = "ThiÕu L©m",
        [2] = "ThiÕu L©m §ao",
        [3] = "ThiÕu L©m Tr­îng",
        [4] = "ThiÕu L©m QuyÒn",
        [5] = "§­êng M«n",
        [6] = "§­êng M«n", -- L­u ý: §­êng M«n cã 2 ID lµ 5 vµ 6
        [7] = "Nga My",
        [8] = "Nga Mi KiÕm",
        [9] = "Nga Mi §µn",
        [10] = "C¸i Bang",
        [11] = "C¸i Bang QuyÒn",
        [12] = "C¸i Bang Bæng",
        [13] = "Vâ §ang",
        [14] = "Vâ §ang KiÕm",
        [15] = "Vâ §ang Bót",
        [16] = "D­¬ng M«n",
        [17] = "D­¬ng Gia Th­¬ng",
        [18] = "D­¬ng Gia Cung",
        [19] = "Ngò §éc",
        [20] = "HiÖp §éc",
        [21] = "Cæ S­",
        [22] = "C«n L«n",
        [23] = "C«n L«n", -- L­u ý: C«n L«n cã 2 ID lµ 22 vµ 23
        [24] = "Minh gi¸o",
        [25] = "Th¸nh ChiÕn",
        [26] = "TrËn Binh",
        [27] = "HuyÕt Nh©n",
        [28] = "Thóy Yªn",
        [29] = "Thóy Yªn Vò N÷",
        [30] = "Linh N÷",
        [31] = "§­êng M«n NhËm HiÖp",
        [32] = "C«n L«n KiÕm T«n",
    }
    if nRoute < 0 or nRoute > #tRoute then -- KiÓm tra nRoute cã hîp lÖ kh«ng
        return "Kh«ng râ h­íng" -- NÕu kh«ng hîp lÖ, tr¶ vÒ "Kh«ng râ h­íng"
    end
    return tRoute[nRoute] or "" -- Tr¶ vÒ tªn tuyÕn ®­êng t­¬ng øng, nÕu kh«ng cã th× tr¶ vÒ chuçi rçng
end

-- ******************************************* Chó thÝch bëi Vilh *****************************************************
-- Tªn hµm			: 	gf_GetFactionName
-- Néi dung			:	LÊy tªn m«n ph¸i dùa trªn ID m«n ph¸i.
-- Gi¸ trÞ tr¶ vÒ	:	string (chuçi)
-- Tham sè		:	nFac (ID m«n ph¸i, nÕu kh«ng cung cÊp sÏ lÊy m«n ph¸i hiÖn t¹i cña ng­êi ch¬i)
-- **********************************************************************************************************************
function gf_GetFactionName(nFac)
    nFac = nFac or GetPlayerFaction() or 9999 -- LÊy nFac nÕu cã, nÕu kh«ng lÊy m«n ph¸i cña ng­êi ch¬i, mÆc ®Þnh lµ 9999
    local tFaction = { -- B¶ng chøa tªn c¸c m«n ph¸i
        [0] = "V« m«n ph¸i",
        [1] = "ThiÕu L©m",
        [2] = "Vâ §ang",
        [3] = "Nga My",
        [4] = "C¸i Bang",
        [5] = "§­êng M«n",
        [6] = "D­¬ng M«n",
        [7] = "Ngò §éc",
        [8] = "C«n L«n",
        [9] = "Minh gi¸o",
        [10] = "Thóy Yªn",
    }
    if nFac < 0 or nFac > #tFaction then -- KiÓm tra nFac cã hîp lÖ kh«ng
        return "Kh«ng râ m«n ph¸i" -- NÕu kh«ng hîp lÖ, tr¶ vÒ "Kh«ng râ m«n ph¸i"
    end
    return tFaction[nFac] or "" -- Tr¶ vÒ tªn m«n ph¸i t­¬ng øng, nÕu kh«ng cã th× tr¶ vÒ chuçi rçng
end

-- ******************************************* Chó thÝch bëi Vilh *****************************************************
-- Tªn hµm			: 	gf_MinMax
-- Néi dung			:	Giíi h¹n mét gi¸ trÞ trong kho¶ng min vµ max.
-- Gi¸ trÞ tr¶ vÒ	:	number (sè)
-- Tham sè		:
--  * nNum: Gi¸ trÞ cÇn giíi h¹n
--  * nMin: Gi¸ trÞ nhá nhÊt
--  * nMax: Gi¸ trÞ lín nhÊt
-- **********************************************************************************************************************
function gf_MinMax(nNum, nMin, nMax)
    nNum = math.max(nNum, nMin) -- §¶m b¶o nNum kh«ng nhá h¬n nMin
    nNum = math.min(nNum, nMax) -- §¶m b¶o nNum kh«ng lín h¬n nMax
    return nNum
end

-- ******************************************* Chó thÝch bëi Vilh *****************************************************
-- Tªn hµm        : gf_UnPack
-- M« t¶         : Gi¶i nÐn (unpack) c¸c gi¸ trÞ tõ mét b¶ng (table).
-- Tham sè       :
--    * tbTable   : B¶ng cÇn gi¶i nÐn.
--    * nStartIdx : ChØ sè b¾t ®Çu gi¶i nÐn (mÆc ®Þnh lµ 1).
--    * nEndIdx   : ChØ sè kÕt thóc gi¶i nÐn (mÆc ®Þnh lµ kÝch th­íc b¶ng).
-- Gi¸ trÞ tr¶ vÒ : C¸c gi¸ trÞ ®­îc gi¶i nÐn tõ b¶ng.
-- **********************************************************************************************************************
function gf_UnPack(tbTable, nStartIdx, nEndIdx)
    local nSize = #tbTable -- LÊy kÝch th­íc cña b¶ng
    nStartIdx = nStartIdx or 1 -- NÕu nStartIdx kh«ng ®­îc cung cÊp, g¸n gi¸ trÞ mÆc ®Þnh lµ 1
    nEndIdx = nEndIdx or nSize -- NÕu nEndIdx kh«ng ®­îc cung cÊp, g¸n gi¸ trÞ mÆc ®Þnh lµ kÝch th­íc b¶ng
    if tbTable[nStartIdx] and nStartIdx <= nEndIdx then -- KiÓm tra chØ sè b¾t ®Çu cã hîp lÖ kh«ng
        return tbTable[nStartIdx], gf_UnPack(tbTable, nStartIdx + 1, nEndIdx) -- Tr¶ vÒ gi¸ trÞ t¹i chØ sè b¾t ®Çu vµ tiÕp tôc gi¶i nÐn
    end
end

-- ******************************************* Chó thÝch bëi Vilh *****************************************************
-- Tªn hµm        : gf_ColorReplace
-- M« t¶         : Thay thÕ c¸c thÎ mµu trong chuçi.
-- Tham sè       :
--    * szMsg      : Chuçi cÇn thay thÕ.
-- Gi¸ trÞ tr¶ vÒ : Chuçi sau khi ®· thay thÕ thÎ mµu.
-- **********************************************************************************************************************
function gf_ColorReplace(szMsg)
    szMsg = string.gsub(szMsg, "<>", "<color>") -- Thay thÕ <> thµnh <color>
    szMsg = string.gsub(szMsg, "<r>", "<color=red>") -- Thay thÕ <r> thµnh <color=red>
    szMsg = string.gsub(szMsg, "<y>", "<color=yellow>") -- Thay thÕ <y> thµnh <color=yellow>
    szMsg = string.gsub(szMsg, "<g>", "<color=green>") -- Thay thÕ <g> thµnh <color=green>
    szMsg = string.gsub(szMsg, "<p>", "<color=purple>") -- Thay thÕ <p> thµnh <color=purple>
    return szMsg
end

-- ******************************************* Chó thÝch bëi Vilh *****************************************************
-- Tªn hµm        : gf_InRange
-- M« t¶         : KiÓm tra mét gi¸ trÞ cã n»m trong mét kho¶ng nµo ®ã kh«ng.
-- Tham sè       :
--    * tbRange    : B¶ng chøa c¸c kho¶ng gi¸ trÞ (vd: {{1, 10}, {20, 30}}).
--    * nValue     : Gi¸ trÞ cÇn kiÓm tra.
-- Gi¸ trÞ tr¶ vÒ : 1 nÕu nValue n»m trong mét trong c¸c kho¶ng, 0 nÕu kh«ng.
-- **********************************************************************************************************************
function gf_InRange(tbRange, nValue)
    for i, v in ipairs(tbRange) do -- DuyÖt qua c¸c kho¶ng trong tbRange
        if nValue >= v[1] and nValue <= v[2] then -- KiÓm tra nValue cã n»m trong kho¶ng [v[1], v[2]] kh«ng
            return 1
        end
    end
    return 0
end

-- ******************************************* Chó thÝch bëi Vilh *****************************************************
-- Tªn hµm        : gf_GetDataTable
-- M« t¶         : T¹o mét b¶ng (table) tõ c¸c gi¸ trÞ ®Çu vµo.
-- Tham sè       : ... (nhiÒu gi¸ trÞ sè)
-- Gi¸ trÞ tr¶ vÒ : B¶ng chøa c¸c gi¸ trÞ ®Çu vµo.
-- **********************************************************************************************************************
function gf_GetDataTable(...)
    local t = {}
    for i = 1, arg.n do -- DuyÖt qua c¸c gi¸ trÞ ®Çu vµo
        t[i] = arg[i] -- Thªm gi¸ trÞ vµo b¶ng
    end
    return t
end

-- ******************************************* Chó thÝch bëi Vilh *****************************************************
-- Tªn hµm        : gf_ProbabilityJudge
-- M« t¶         : KiÓm tra x¸c suÊt x¶y ra cña mét sù kiÖn.
-- Tham sè       :
--    * nProbability : X¸c suÊt x¶y ra (0-100).
-- Gi¸ trÞ tr¶ vÒ : 1 nÕu sù kiÖn x¶y ra, 0 nÕu kh«ng.
-- **********************************************************************************************************************
function gf_ProbabilityJudge(nProbability)
    local StringFind = function(sString, nTag) -- Hµm t×m vÞ trÝ cña ký tù trong chuçi
        for i = 1, string.len(sString) do
            if string.sub(sString, i, i) == nTag then
                return i
            end
        end
        return 0
    end

    if nProbability > 100 or nProbability < 0 then -- KiÓm tra x¸c suÊt cã hîp lÖ kh«ng
        return 0
    end

    local nDotPos = StringFind(tostring(nProbability), ".") -- T×m vÞ trÝ dÊu chÊm
    local nStrLen = string.len(tostring(nProbability)) -- TÝnh ®é dµi chuçi x¸c suÊt
    local nRandomNum = math.random(1, 100 * (10 ^ (nStrLen - nDotPos))) -- Sinh sè ngÉu nhiªn

    if nRandomNum <= nProbability * (10 ^ (nStrLen - nDotPos)) then -- So s¸nh sè ngÉu nhiªn víi x¸c suÊt
        return 1
    else
        return 0
    end
end

--¸´ÖÆÒ»¸ötable
--orgÎªÔ´table£¬desÎª¸´ÖÆ³öÀ´µÄÐÂtable
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

-- ******************************************* Chó thÝch bëi Vilh *****************************************************
-- Tªn hµm        : gf_CopyTable
-- M« t¶         : Sao chÐp mét b¶ng (table).
-- Tham sè       :
--    * org (table) : B¶ng gèc cÇn sao chÐp.
--    * des (table) : B¶ng ®Ých (nÕu kh«ng cung cÊp sÏ tù ®éng t¹o míi).
-- Gi¸ trÞ tr¶ vÒ : B¶ng ®Ých (des) sau khi ®· sao chÐp.
-- **********************************************************************************************************************
function gf_CopyTable(org, des)
    des = des or {} -- NÕu des ch­a tån t¹i, t¹o mét b¶ng míi
    for i, j in pairs(org) do -- DuyÖt qua tõng phÇn tö trong b¶ng gèc (org)
        if type(j) == "table" then -- NÕu phÇn tö lµ mét b¶ng
            if not des[i] then -- NÕu phÇn tö t­¬ng øng trong b¶ng ®Ých ch­a tån t¹i
                des[i] = {} -- T¹o mét b¶ng míi ®Ó chøa phÇn tö ®ã
                gf_CopyTable(j, des[i]) -- §Ö quy sao chÐp b¶ng con
            end
        else -- NÕu phÇn tö kh«ng ph¶i lµ b¶ng
            if not des[i] then -- NÕu phÇn tö t­¬ng øng trong b¶ng ®Ých ch­a tån t¹i
                des[i] = j -- Sao chÐp gi¸ trÞ cña phÇn tö
            end
        end
    end
    return des
end

-- ******************************************* Chó thÝch bëi Vilh *****************************************************
-- Tªn hµm        : gf_FixColor
-- M« t¶         : Thªm m· mµu cho ®o¹n text.
-- Tham sè       :
--    * szString (string)  : §o¹n text cÇn thªm mµu.
--    * nColor (number)    : M· mµu (1: ®á, 2: xanh l¸, 3: xanh d­¬ng, 4: vµng).
--    * nIsNpcSay (boolean) : Cã ph¶i lµ lêi nãi cña NPC kh«ng (mÆc ®Þnh lµ kh«ng).
-- Gi¸ trÞ tr¶ vÒ : §o¹n text ®· ®­îc thªm m· mµu.
-- **********************************************************************************************************************
function gf_FixColor(szString, nColor, nIsNpcSay)
    local tbColor = { -- B¶ng mµu
        [1] = "red",
        [2] = "green",
        [3] = "blue",
        [4] = "yellow",
    }
    if nIsNpcSay == nil or nIsNpcSay == 0 then -- NÕu kh«ng ph¶i lêi nãi cña NPC
        szString = string.format("<color=%s>%s<color>", tbColor[nColor], szString)
    else -- NÕu lµ lêi nãi cña NPC
        szString = string.format("<color=%s>%s:<color>", tbColor[nColor], szString)
    end
    return szString
end

-- ******************************************* Chó thÝch bëi Vilh *****************************************************
-- Tªn hµm        : gf_DoNothing
-- M« t¶         : Hµm rçng (kh«ng lµm g× c¶).
-- **********************************************************************************************************************
function gf_DoNothing()
end

-- ******************************************* Chó thÝch bëi Vilh *****************************************************
-- Tªn hµm        : gf_Inherit
-- M« t¶         : T¹o mét b¶ng (table) míi kÕ thõa tõ mét b¶ng kh¸c.
-- Tham sè       :
--    * base (table) : B¶ng cha.
-- Gi¸ trÞ tr¶ vÒ : B¶ng con ®· kÕ thõa tõ b¶ng cha.
-- **********************************************************************************************************************
function gf_Inherit(base)
    local derive = {} -- B¶ng con
    local foo = function(t, i) return base[i] end -- Hµm trung gian ®Ó truy xuÊt phÇn tö tõ b¶ng cha
    settag(derive, newtag()) -- ThiÕt lËp tag cho b¶ng con
    settagmethod(tag(derive), "index", foo) -- ThiÕt lËp ph­¬ng thøc index ®Ó truy xuÊt tõ b¶ng cha
    for i, v in pairs(base) do -- DuyÖt qua tõng phÇn tö trong b¶ng cha
        if type(v) == "table" then -- NÕu phÇn tö lµ mét b¶ng
            derive[i] = gf_Inherit(v) -- §Ö quy kÕ thõa b¶ng con
        end
    end
    return derive
end

-- (C¸c hµm cßn l¹i ®· ®­îc gi÷ nguyªn do ®· cã chó thÝch râ rµng trong phÇn tr­íc)
-- Sao chÐp mét ®èi t­îng (b¶ng), kÕ thõa toµn bé thuéc tÝnh tõ ®èi t­îng gèc (b¶ng gèc).
function gf_CopyInherit(...)
    -- T¹o mét b¶ng míi b»ng c¸ch hîp nhÊt c¸c b¶ng ®Çu vµo.
    local base = gf_Merge2(gf_UnPack(arg));

    -- T¹o mét ®èi t­îng míi kÕ thõa tõ b¶ng 'base'.
    local derive = new(base);
    return derive -- Tr¶ vÒ ®èi t­îng míi.
end

-- Hîp nhÊt nhiÒu b¶ng thµnh mét b¶ng duy nhÊt.
function gf_Merge2(...)
    local base = {} -- B¶ng kÕt qu¶.
    for i = 1, arg.n do -- DuyÖt qua tõng b¶ng ®Çu vµo.
        for k, v in arg[i] do -- DuyÖt qua tõng cÆp key-value trong b¶ng.
            base[k] = arg[i][k]; -- Sao chÐp key-value vµo b¶ng kÕt qu¶.
        end
    end
    return base -- Tr¶ vÒ b¶ng kÕt qu¶.
end

-- (Hµm nµy kh«ng lµm g× c¶, cã thÓ ®­îc sö dông nh­ placeholder).
function nothing()
end;

-- Chän ngÉu nhiªn mét môc tõ mét b¶ng tû lÖ, cã thÓ chØ ®Þnh dßng cô thÓ.
function gf_RandRate(tRate, nMax, nLine)
    nLine = nLine or 1; -- NÕu kh«ng chØ ®Þnh dßng, mÆc ®Þnh lµ dßng 1.

    -- NÕu kh«ng cung cÊp nMax, tÝnh tæng gi¸ trÞ trong dßng nLine.
    if not nMax then
        nMax = 0;
        for i = 1, getn(tRate) do
            nMax = nMax + tRate[i][nLine];
        end
    end

    local nRand = random(nMax) -- Chän ngÉu nhiªn mét sè trong kho¶ng [1, nMax].

    -- DuyÖt qua c¸c môc trong b¶ng tû lÖ ®Ó t×m môc t­¬ng øng víi sè ngÉu nhiªn.
    for i = 1, getn(tRate) do
        if nRand <= tRate[i][nLine] then -- NÕu sè ngÉu nhiªn nhá h¬n hoÆc b»ng gi¸ trÞ trong dßng, tr¶ vÒ môc ®ã vµ chØ sè.
            return tRate[i], i;
        else -- NÕu kh«ng, trõ gi¸ trÞ ®ã ®i vµ tiÕp tôc kiÓm tra môc tiÕp theo.
            nRand = nRand - tRate[i][nLine];
        end
    end
end

-- Chän ngÉu nhiªn mét môc tõ mét b¶ng d÷ liÖu dùa trªn chØ sè ngÉu nhiªn.
function gf_RandomSelected(tData, nRndIdx)
    if not tData or 0 == getn(tData) then -- KiÓm tra nÕu b¶ng d÷ liÖu rçng.
        return 0;
    end

    local nMax = 0;
    for idx, tInfo in tData do -- TÝnh tæng gi¸ trÞ t¹i chØ sè ngÉu nhiªn cña c¸c môc trong b¶ng.
        if type(tInfo) == "table" then
            nMax = nMax + tInfo[nRndIdx];
        end
    end

    local nRand = random(1, nMax); -- Chän ngÉu nhiªn mét sè trong kho¶ng [1, nMax].

    -- T×m môc t­¬ng øng víi sè ngÉu nhiªn.
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

-- LÊy sè lÇn t¸i sinh cña ng­êi ch¬i.
function gf_GetPlayerRebornCount()
    local nAddvanceTrans = GetPlayerRebornParam(0)
    if nAddvanceTrans > 0 then
        -- NÕu ®· chuyÓn sinh cao cÊp, tr¶ vÒ sè lÇn chuyÓn sinh céng thªm 5.
        return nAddvanceTrans + 5
    end

    -- NÕu ch­a chuyÓn sinh cao cÊp, tr¶ vÒ sè lÇn t¸i sinh tõ nhiÖm vô 1538.
    return GetByte(GetTask(1538), 1)
end

-- TÝnh cÊp ®é chuyÓn sinh (tæng sè lÇn t¸i sinh * 100 + cÊp ®é hiÖn t¹i).
function gf_GetTransLevel()
    return gf_GetPlayerRebornCount()*100+GetLevel()
end

-- LÊy ngµy hiÖn t¹i ë ®Þnh d¹ng YYYYMMDD.
function gf_TodayDate()
    return tonumber(date("%Y%m%d"));
end

-- §ãng gãi ba sè nguyªn nG, nD, nP thµnh mét sè nguyªn duy nhÊt nGDP.
-- Gi¶ ®Þnh nG, nD n»m trong kho¶ng [0, 255] vµ nP n»m trong kho¶ng [0, 65535].
function gf_PackItemGDP(nG, nD, nP)
    -- §Þnh nghÜa c¸c h»ng sè ®Ó biÓu diÔn c¸c bit dÞch chuyÓn.
    local _BIT_16 = 65536; -- 2^16
    local _BIT_24 = 16777216; -- 2^24

    -- KiÓm tra tÝnh hîp lÖ cña c¸c gi¸ trÞ ®Çu vµo.
    if not nG or 0 > nG or nG > 255 then return 0; end
    if not nD or 0 > nD or nD > 255 then return 0; end
    if not nP or 0 > nP or nP > 65535 then return 0; end

    -- §ãng gãi c¸c gi¸ trÞ vµo mét sè nguyªn duy nhÊt b»ng c¸ch dÞch bit.
    -- nG ®­îc dÞch tr¸i 24 bit, nD ®­îc dÞch tr¸i 16 bit, vµ nP gi÷ nguyªn.
    return nG * _BIT_24 + nD * _BIT_16 + nP;
end

-- Gi¶i nÐn sè nguyªn nGDP thµnh ba sè nguyªn nG, nD, nP.
function gf_UnpackItemGDP(nGDP)
    local _BIT_16 = 65536;
    local _BIT_24 = 16777216;
    local nG, nD = 0, 0;

    -- KiÓm tra xem nGDP cã lín h¬n 2^24 kh«ng, nÕu cã th× lÊy phÇn nguyªn cña nGDP chia cho 2^24 ®Ó cã nG.
    if nGDP > _BIT_24 then
        nG = math.floor(nGDP / _BIT_24); -- LÊy phÇn nguyªn cña phÐp chia
        nGDP = nGDP - _BIT_24 * nG; -- CËp nhËt nGDP b»ng phÇn d­ cña phÐp chia
    end

    -- KiÓm tra xem nGDP cã lín h¬n 2^16 kh«ng, nÕu cã th× lÊy phÇn nguyªn cña nGDP chia cho 2^16 ®Ó cã nD.
    if nGDP > _BIT_16 then
        nD = math.floor(nGDP / _BIT_16);
        nGDP = nGDP - _BIT_16 * nD;
    end

    -- Tr¶ vÒ ba gi¸ trÞ nG, nD, nP.
    return nG, nD, nGDP;
end

-- Hµm t¸ch mét chuçi thµnh mét m¶ng c¸c chuçi con dùa trªn dÊu ph©n c¸ch (separator).
function split(str, splitor)
    if (splitor == nil) then -- NÕu kh«ng cung cÊp dÊu ph©n c¸ch, sö dông dÊu phÈy lµm mÆc ®Þnh.
        splitor = ","
    end

    local strArray = {} -- T¹o mét m¶ng trèng ®Ó l­u c¸c chuçi con.
    local strStart = 1 -- VÞ trÝ b¾t ®Çu t×m kiÕm dÊu ph©n c¸ch.
    local splitorLen = string.len(splitor) -- §é dµi cña dÊu ph©n c¸ch.

    -- T×m kiÕm vÞ trÝ ®Çu tiªn cña dÊu ph©n c¸ch trong chuçi.
    local index = string.find(str, splitor, strStart)
    if (index == nil) then -- NÕu kh«ng t×m thÊy dÊu ph©n c¸ch, tr¶ vÒ m¶ng chøa toµn bé chuçi ban ®Çu.
        strArray[1] = str
        return strArray
    end

    local i = 1 -- ChØ sè cña phÇn tö trong m¶ng.

    -- LÆp l¹i viÖc t×m kiÕm dÊu ph©n c¸ch vµ t¸ch chuçi.
    while index do
        strArray[i] = string.sub(str, strStart, index - 1) -- LÊy chuçi con tõ vÞ trÝ b¾t ®Çu ®Õn tr­íc dÊu ph©n c¸ch.
        i = i + 1 -- T¨ng chØ sè phÇn tö.
        strStart = index + splitorLen -- CËp nhËt vÞ trÝ b¾t ®Çu t×m kiÕm.
        index = string.find(str, splitor, strStart) -- T×m kiÕm dÊu ph©n c¸ch tiÕp theo.
    end

    -- Thªm phÇn tö cuèi cïng vµo m¶ng.
    strArray[i] = string.sub(str, strStart, string.len(str))

    return strArray -- Tr¶ vÒ m¶ng chøa c¸c chuçi con.
end

-- Sao chÐp s©u mét b¶ng (table) vµ c¸c b¶ng con cña nã, ®ång thêi duy tr× liªn kÕt ®Õn class (nÕu cã).
function __clone(org, des)
    -- DuyÖt qua tõng cÆp key-value trong b¶ng gèc (org).
    for i, j in pairs(org) do
        if type(j) == "table" then
            -- NÕu gi¸ trÞ lµ mét b¶ng, t¹o mét b¶ng míi t­¬ng øng trong b¶ng ®Ých (des) vµ gäi ®Ö quy __clone.
            des[i] = {}
            __clone(j, des[i])
        elseif type(j) == "userdata" and getmetatable(j).__type == "class" then
            -- NÕu gi¸ trÞ lµ mét ®èi t­îng class, sao chÐp nã b»ng c¸ch t¹o mét instance míi cïng class vµ g¸n vµo b¶ng ®Ých.
            des[i] = j:clone()
        else
            -- NÕu kh«ng, ®¬n gi¶n sao chÐp gi¸ trÞ vµo b¶ng ®Ých.
            des[i] = j
        end
    end
end

-- T¸ch mét chuçi thµnh mét m¶ng c¸c sè, lo¹i bá c¸c phÇn tö kh«ng ph¶i sè.
function gf_SplitStr2NumArray(str, splitor)
    -- T¹o mét m¶ng trèng ®Ó l­u tr÷ c¸c sè.
    local tNumArray = {};

    -- T¸ch chuçi thµnh m¶ng c¸c chuçi con dùa trªn dÊu ph©n c¸ch.
    local tStrArray = split(str, splitor);

    -- DuyÖt qua m¶ng c¸c chuçi con.
    for i = 1, #tStrArray do
        local nNum = tonumber(tStrArray[i]); -- ChuyÓn chuçi con thµnh sè.

        -- NÕu chuyÓn ®æi thµnh c«ng (nNum kh¸c nil), thªm sè vµo m¶ng kÕt qu¶.
        if nNum then
            table.insert(tNumArray, nNum);
        end
    end

    -- Lo¹i bá thuéc tÝnh 'n' cña m¶ng (nÕu cã), th­êng ®­îc thªm bëi hµm split.
    tNumArray.n = nil;

    return tNumArray; -- Tr¶ vÒ m¶ng c¸c sè.
end


-- In néi dung cña mét b¶ng (table) ra console, cã thôt lÒ ®Ó hiÓn thÞ cÊu tróc.
function gf_PrintTable(t, n)
    -- KiÓm tra xem ®Çu vµo cã ph¶i lµ mét b¶ng hay kh«ng.
    if type(t) ~= "table" then
        return 0; -- NÕu kh«ng ph¶i b¶ng, kh«ng lµm g× c¶.
    end

    -- ThiÕt lËp ®é thôt lÒ ban ®Çu, mÆc ®Þnh lµ 0 nÕu kh«ng cung cÊp.
    n = n or 0;

    -- T¹o mét chuçi kho¶ng tr¾ng ®Ó thôt lÒ.
    local str_space = "";
    for i = 0, n do
        str_space = str_space .. " "; -- Thªm kho¶ng tr¾ng vµo chuçi.
    end

    -- In dÊu ngoÆc nhän më ®Çu b¶ng.
    print(str_space .. "{");

    -- DuyÖt qua tõng cÆp khãa-gi¸ trÞ trong b¶ng.
    for k, v in pairs(t) do
        -- T¹o chuçi hiÓn thÞ khãa vµ gi¸ trÞ.
        local str_k_v = str_space .. " [" .. tostring(k) .. "] = ";

        -- KiÓm tra xem gi¸ trÞ cã ph¶i lµ mét b¶ng kh¸c hay kh«ng.
        if type(v) == "table" then
            -- NÕu lµ b¶ng, in chuçi khãa vµ dÊu xuèng dßng.
            print(str_k_v);

            -- Gäi ®Ö quy hµm gf_PrintTable ®Ó in b¶ng con víi ®é thôt lÒ t¨ng thªm 1.
            gf_PrintTable(v, n + 1);
        else
            -- NÕu kh«ng ph¶i b¶ng, in chuçi khãa vµ gi¸ trÞ trªn cïng mét dßng.
            str_k_v = str_k_v .. tostring(v);
            print(str_k_v);
        end
    end

    -- In dÊu ngoÆc nhän kÕt thóc b¶ng.
    print(str_space .. "}");
end
