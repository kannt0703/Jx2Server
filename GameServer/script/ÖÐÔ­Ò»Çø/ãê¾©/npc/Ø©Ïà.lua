
Include("\\script\\task\\faction\\faction_main_ym.lua");
Include("\\script\\task\\faction\\faction_head.lua");
Include("\\script\\newbattles\\functions.lua");
Include("\\script\\global\\battlefield_callback.lua")
Include("\\script\\lib\\time.lua");
Include("\\script\\online\\viet_event\\nationality\\head.lua");
Include("\\script\\online\\viet_event\\vng_task_control.lua");

THIS_RELAY_CALLBACK_SCRIPT = "\\script\\中原一区\\汴京\\npc\\丞相.lua";
g_szInfoHeader = "<color=green>Tri謚 Ph�<color>:";
g_nBuChangBeginDate = 2008080100;	--补偿开始时间
g_nBuChangEndDate = 2008080920;	--补偿结束时间。如果为0则表示不开放补偿
if IB_VERSION == 0 then
	g_nMaxBuChangTimes = 1;			--收费区本次本次补偿战场奖励次数
else
	g_nMaxBuChangTimes = 1;			--免费区本次本次补偿战场奖励次数
end;
g_nReputation = 500;		--补偿的声望
g_nContribute = 300;		--补偿的师门贡献度
--=====================================================================
TSK_BATTLEBUCHANG = 815;	--记录是否参与过本次补偿，记录的值应为g_nBuChangEndDate
TSK_BUCHANG_TIMES = 808;	--记录本次领取了多少次战场补偿
TSK_NORMAL_BUCHANG = 809	--记录本次是否领取了普通补偿

-- VNG ch鴆 n╪g Nguy猲 So竔 Ti課 C�, Tng Qu﹏ Ti課 C�
TSK_NGUYENSOAI = 2541
BYTE_TIENPHONG = 1
BYTE_TUONGQUAN = 2
BYTE_WEEK = 3
BYTE_DAY = 4

-- VNG ch鴆 n╪g b秓 v� c玭g tr筺g chuy觧 server
TSK_TRANS_POINT = 2150
TSK_TRANS_DATE  = 2151

tbJUNGONGZHANG = 
{
	[1] = {"Qu﹏ C玭g Chng",2,1,9999,2},
	[2] = {"Qu﹏ C玭g Чi",2,1,9998,5},
	[3] = {"Qu﹏ C玭g Huy Ho祅g",2,1,9977,10},
}

TB_BATTLE_EQUIP = 
{
	[1] = 
	{
		[SONG_ID] = 
				{
					{"T鑞g ti猲 phong hi謚 k�",0,102,2261,-1},
					{"T鑞g ti猲 phong hi謚 ph�",0,102,2265,-1},
				},                         
		[LIAO_ID] = 
				{                          
					{"Li猽 ti猲 phong hi謚 k�",0,102,2271,-1},
					{"Li猽 ti猲 phong hi謚 ph�",0,102,2275,-1},
				}
	},
	[2] = 
	{
		[SONG_ID] = 
				{
					{"T鑞g tng qu﹏ u kh玦",0,103,2241,0},
					{"T鑞g tng qu﹏ chi課 b祇",0,100,2241,1},
					{"T鑞g tng qu﹏ chi課 ph鬰",0,101,2241,3},
					{"T鑞g tng qu﹏ l謓h b礽",0,102,2281,-1},
					{"T鑞g l謓h ph�",0,102,2521,-1},
					{"T鑞g tng qu﹏ c� l謓h",0,102,2285,-1},				
	         	},
       	[LIAO_ID] = 
	       		{                
					{"Li猽 tng qu﹏ u kh玦",0,103,2245,0},
					{"Li猽 tng qu﹏ chi課 b祇",0,100,2245,1},
					{"Li猽 tng qu﹏ chi課 ph鬰",0,101,2245,3},
					{"Li猽 tng qu﹏ l謓h b礽",0,102,2291,-1},
					{"Li猽 tng qu﹏ c� l謓h",0,102,2295,-1},
					{"Li猽 l謓h ph�",0,102,2531,-1},
				}
	},
	[3] = 
	{
		[SONG_ID] = 
				{
					{"T鑞g nguy猲 so竔 u kh玦",0,103,2251,0},
					{"T鑞g nguy猲 so竔 chi課 b祇",0,100,2251,1},
					{"T鑞g nguy猲 so竔 chi課 ph鬰",0,101,2251,3},
					{"T鑞g so竔 k�",0,102,2505,-1},  
					{"T鑞g so竔 ph�",0,102,2501,-1},
					{"T鑞g nguy猲 so竔 l謓h k�",0,102,2305,-1}, 
					{"T鑞g nguy猲 so竔 h� ph�",0,102,2301,-1},										          
				},
		[LIAO_ID] = 
				{                          
					{"Li猽 nguy猲 so竔 u kh玦",0,103,2255,0},
					{"Li猽 nguy猲 so竔 chi課 b祇",0,100,2255,1},
					{"Li猽 nguy猲 so竔 chi課 ph鬰",0,101,2255,3},
					{"Li猽 nguy猲 so竔 l謓h k�",0,102,2315,-1},
					{"Li猽 nguy猲 so竔 h� ph�",0,102,2311,-1},
					{"Li猽 so竔 k�",0,102,2515,-1},
					{"Li猽 so竔 ph�",0,102,2511,-1},														
				}
	},
	[4] =
	{
		[SONG_ID] = {
					{"T鑞g-V躰h Vi詎 Nguy猲 So竔 u Kh玦",0,103,3000,0},
					{"T鑞g-V躰h Vi詎 Nguy猲 So竔 Chi課 Gi竝 ",0,100,3000,1},
					{"T鑞g-V躰h Vi詎 Nguy猲 So竔 Chi課 ph鬰",0,101,3000,3},
					{"T鑞g-V躰h Vi詎 Nguy猲 So竔 H� ph�",0,102,3000,-1},
					{"T鑞g-V躰h Vi詎 Nguy猲 So竔 L謓h k�",0,102,3004,-1},
					{"T鑞g-V躰h Vi詎 Nguy猲 So竔 Hi謚 ph�",0,102,3008,-1},
					{"T鑞g-V躰h Vi詎 Nguy猲 So竔 Hi謚 k�",0,102,3012,-1},
					},
		[LIAO_ID] = {
					{"Li猽-V躰h Vi詎 Nguy猲 So竔 u Kh玦",0,103,3004,0},
					{"Li猽-V躰h Vi詎 Nguy猲 So竔 Chi課 Gi竝 ",0,100,3004,1},
					{"Li猽-V躰h Vi詎 Nguy猲 So竔 Chi課 ph鬰",0,101,3004,3},
					{"Li猽-V躰h Vi詎 Nguy猲 So竔 Hi謚 ph�",0,102,3024,-1},
					{"Li猽-V躰h Vi詎 Nguy猲 So竔 Hi謚 k�",0,102,3028,-1},
					{"Li猽-V躰h Vi詎 Nguy猲 So竔 H� ph�",0,102,3016,-1},
					{"Li猽-V躰h Vi詎 Nguy猲 So竔 L謓h k�",0,102,3020,-1},					
					},
	},
	[5] =
	{
		[SONG_ID] = {
					{"T鑞g Tng Qu﹏ Chi課 Kh玦",0,103,3016,0},
					{"T鑞g Tng Qu﹏ Chi課 B祇",0,100,3016,1},
					{"T鑞g Tng Qu﹏ Chi課 Trang",0,101,3016,3},
					{"Thi猲 Chi T鑞g Tng Qu﹏ L謓h B礽",0,102,3032,-1},
					{"Thi猲 Chi T鑞g Tng Qu﹏ L謓h K�",0,102,3036,-1},
					{"Thi猲 Chi T鑞g Tng Qu﹏ L謓hPh�",0,102,3040,-1},
					},
		[LIAO_ID] = {
					{"Li猽 Tng Qu﹏ Chi課 Kh玦",0,103,3020,0},
					{"Li猽 Tng Qu﹏ Chi課 B祇",0,100,3020,1},
					{"Li猽 Tng Qu﹏ Chi課 Trang",0,101,3020,3},
					{"Thi猲 Chi Li猽 Tng Qu﹏ L謓h B礽",0,102,3044,-1},
					{"Thi猲 Chi Li猽 Tng Qu﹏ L謓h Ph�",0,102,3052,-1},
					{"Thi猲 Chi Li猽 Tng Qu﹏ L謓h K�",0,102,3048,-1},		
					},
	},	
	[6] =
	{
		[SONG_ID] = {
					{"Чi T鑞g Nguy猲 So竔 Chi課 Kh玦",0,103,3024,0},
					{"Чi T鑞g Nguy猲 So竔 Chi課 B祇",0,100,3024,1},
					{"Чi T鑞g Nguy猲 So竔 Chi課 Trang",0,101,3024,3},
					{"Чi T鑞g Nguy猲 So竔 H� Ph�",0,102,3056,-1},
					{"Чi T鑞g Nguy猲 So竔 L謓h K�",0,102,3060,-1},
					{"Чi T鑞g Nguy猲 So竔 Hi謚 Ph�",0,102,3064,-1},
					{"Чi T鑞g Nguy猲 So竔 Hi謚 K�",0,102,3068,-1},
					},
		[LIAO_ID] = {
					{"Чi Li猽 Nguy猲 So竔 Chi課 Kh玦",0,103,3028,0},
					{"Чi Li猽 Nguy猲 So竔 Chi課 B祇",0,100,3028,1},
					{"Чi Li猽 Nguy猲 So竔 Chi課 Trang",0,101,3028,3},
					{"Чi Li猽 Nguy猲 So竔 Hi謚 Ph�",0,102,3080,-1},
					{"Чi Li猽 Nguy猲 So竔 Hi謚 K�",0,102,3084,-1},	
					{"Чi Li猽 Nguy猲 So竔 H� Ph�",0,102,3072,-1},
					{"Чi Li猽 Nguy猲 So竔 L謓h K�",0,102,3076,-1},
		
					},
	},
	[7] =
	{
		[SONG_ID] = {
					{"Ng� Long Nguy猲 So竔 Chi課 Kh玦",0,103,3008,0},
					{"Ng� Long Nguy猲 So竔 Chi課 Gi竝",0,100,3008,1},
					{"Ng� Long Nguy猲 So竔 Chi課 Trang",0,101,3008,3},
					{"Ng� Long Nguy猲 So竔 H� Ph�",0,102,3088,-1},
					{"Ng� Long Nguy猲 So竔 L謓h K�",0,102,3092,-1},
					{"Ng� Long Nguy猲 So竔 Hi謚 Ph�",0,102,3096,-1},
					{"Ng� Long Nguy猲 So竔 Hi謚 K�",0,102,3100,-1},
					},
		[LIAO_ID] = {
					{"Chi猽 Th竛h Nguy猲 So竔 Kh玦",0,103,3012,0},
					{"Chi猽 Th竛h Nguy猲 So竔 Chi課 Gi竝",0,100,3012,1},
					{"Chi猽 Th竛h Nguy猲 So竔 Chi課Trang",0,101,3012,3},
					{"Chi猽 Th竛h Nguy猲 So竔 Hi謚 Ph�",0,102,3112,-1},
					{"Chi猽 Th竛h Nguy猲 So竔 Hi謚 K�",0,102,3116,-1},	
					{"Chi猽 Th竛h Nguy猲 So竔 H� Ph�",0,102,3104,-1},					
					{"Chi猽 Th竛h Nguy猲 So竔 L謓h K�",0,102,3108,-1},
					},
	},		
}

function main()
	local nCurRank = BT_GetData(PT_CURRANK);
	local nCurCamp = 0;
	if nCurRank >= 0 then
		nCurCamp = SONG_ID;
	else
		nCurCamp = LIAO_ID;
	end;
	local nEnemyCamp = SONGLIAO_ID - nCurCamp;
	local nDate = tonumber(date("%Y%m%d%H"));
	local selTab = {}
--	tinsert("V穘 b鑙 n  nh薾 l筰 nh鱪g m鉵  b� m蕋/apply_indemnitor")
	tinsert(selTab, "V穘 b鑙 nh� ng礽 t﹗ v韎 Ho祅g Thng cho gia nh藀 b秐 qu鑓/change_nationality")
	tinsert(selTab, "V穘 b鑙 mu鑞 s緋 x誴 m閠 s� vi謈 c馻 nhi謒 v� s� m玭/main_sub")
--	tinsert(selTab, "Ta mu鑞 i trang b� phe "..tCampNameZ[nEnemyCamp].." sang trang b� phe "..tCampNameZ[nCurCamp].."/change_battle_equip")
	tinsert(selTab, "Ta mu鑞 ti課 c� anh h飊g cho phe "..tCampNameZ[nCurCamp].."/introduce_rank")
	tinsert(selTab, "Ta mu鑞 i qu﹏ c玭g c馻 i phng/apply_jungong_change")
	tinsert(selTab, "Ta mu鑞 b秓 to祅 qu﹏ c玭g khi chuy觧 server/apply_jungong_save")	
	--tinsert(selTab, "H駓 b� k輈h ho箃 s� d鬾g u Th祅h T輓, u Th祅h Th�, u Th祅h Bi觰/turn_off")

	
	--local nYear,nMonth,nDay,nHour = get_date(g_nBuChangEndDate);
	--if g_nBuChangEndDate ~= 0 and nDate >= g_nBuChangBeginDate and nDate <= g_nBuChangEndDate then
	--	tinsert(selTab,format("Ta mu鑞 nh薾 b錳 thng (K誸 th骳: N╩ %d Th竛g %d Ng祔 %d %d gi�)/get_compensation",nYear,nMonth,nDay,nHour));
	--end;
	tinsert(selTab,"Kh玭g c� g�/nothing");
	Say("L穙 phu l� th鮝 tng c馻 tri襲 nh, t譵 ta c� vi謈 g� kh玭g?",getn(selTab),selTab);
end

function turn_off()
	SetTask(2154,0)
	Say("H駓 b� k輈h ho箃 s� d鬾g v藅 ph萴 th祅h c玭g.",0)
	WriteLogEx("Chuyen doi cong trang","h駓 b� k輈h ho箃",tonumber(date("%Y%m%d%H%M")))
end

function get_date(nDate)
	local nYear = tonumber(strsub(nDate,1,4));
	local nMonth = tonumber(strsub(nDate,5,6)); 
	local nDay = tonumber(strsub(nDate,7,8));
	local nHour = tonumber(strsub(nDate,9,10));
	return nYear,nMonth,nDay,nHour;
end;

function apply_indemnitor()
	local nRet = ApplyIndemnitor()
	if (nRet == 0) then
		Talk(1, "", "L穙 phu ch糿g gi� m鉵  n祇 c馻 ngi c�")
	else
		Talk(1, "", "Xin nh薾 l蕐!")
	end
end;

function main_sub()
	local nTaskValuem = FN_GetTaskState(FN_YMM)
	if (nTaskValuem == 2) then
		task_005()
		return
	elseif (nTaskValuem == 3) then
		Say("C鯽 ch輓h c馻 Ho祅g cung c� r蕋 nhi襲 c蕀 qu﹏.", 0)
		return
	elseif (nTaskValuem == 4) then
		task_009()
		return
	end

	UWorld1503 = GetTask(1503)
	if(GetLevel() > 1 and UWorld1503 < 15) then
		if(UWorld1503 == 0) then
			Say("Th竔 t� b╪g h�, ho祅g  m韎 l猲 ng玦, trong tri襲 c遪 nhi襲 chuy謓 ch璦 gi秈 quy誸. C� th� gi髉 ta kh玭g?",
				2,
				"уng �/W1503_yes",
				"Kh玭g gi髉/W1503_no")
		end
		if(UWorld1503 == 5 ) then
			Talk(1, "", "Mau n t譵 v� binh th祅h m玭!")
      	end
		if(UWorld1503 == 10) then
			Talk(1, "", "Nhanh v藋 sao? Зy c� ch髏 l� v藅 t苙g ngi.")
			SetTask(1503,15)
			ModifyExp(150)
			Earn(250)
			ModifyReputation(2, 0)
			TaskTip("Ho祅 th祅h nhi謒 v� gi髉 th鮝 tng t譵 v� binh th祅h m玭.")
		end		
	else
		i = random(1, 4)
		if (i == 1) then
			Talk(1, "", "Kh� kh╪ l緈 m韎 d裵 頲 B綾 H竛 nay ph秈 i u v韎 Li猽 Qu鑓, xem ra ph秈 ngh� c竎h kh竎 鎛 nh d﹏ ch髇g th玦!")
		elseif (i == 2) then
			Talk(1, "", "L骳 ti猲  c遪 s鑞g t鮪g n鉯 Bi謓 Lng l� n琲 chi課 tranh li猲 mi猲 kh玭g th輈h h頿 l藀 nc, xem ra c騨g ng!")
		elseif (i == 3) then
			Talk(1, "", "Gi� l祄 th鮝 tng m韎 bi誸 頲 c竎h tr� qu鑓 kh玭g d� ch髏 n祇! N鉵g n秠 l� h醤g h誸.")
		else
			Talk(1, "", "Nh蕋 th鑞g thi猲 h�, c莕 chi猽 n筽 hi襫 t礽!")
		end
	end
end;

function W1503_yes()
	Talk(1,"","Nha m玭 kh玭g  ngi, mau gi髉 ta t譵 v� binh th祅h m玭 d竛 c竜 th� th玭g b竜 cho m鋓 ngi bi誸 tin th竔 t� b╪g h�, ho祅g  m韎 l猲 vua.")
	Talk(1,"","T筰 h� 甶 ngay!")
	SetTask(1503,5)
	--AddNote("接到任务：帮助宰相赵普去找城门卫兵。")
	TaskTip("Nh薾 nhi謒 v�: Gi髉 th鮝 tng Tri謚 Ph� t譵 v� binh th祅h m玭.")
end;

function W1503_no()
end;

tb_introduce_rank = {
	[1] = {"Ti猲 Phong", BYTE_TIENPHONG, 3, 2, 1, 0, 120000, 4},
	[2] = {"Tng Qu﹏", BYTE_TUONGQUAN, 4, 3, 1, 1, 250000, 5},
}

function introduce_rank()
	if abs(GetTask(704)) < 5 then
		Talk(1,"",g_szInfoHeader.."Ch� c� <color=yellow>Nguy猲 So竔<color> v� <color=yellow>Tng Qu﹏<color> m韎 c� th� ti課 c� ngi t礽!")
		return 0
	end
	local nCurRank = BT_GetData(PT_CURRANK);
	local nCurCamp = 0;
	if nCurRank >= 0 then
		nCurCamp = SONG_ID;
	else
		nCurCamp = LIAO_ID;
	end;
	local tSay = {"Ta mu鑞 ti課 c� "..tCampNameZ[nCurCamp].." Ti猲 phong/#offer_rank(1,"..nCurCamp..")",}
	if abs(GetTask(704)) == 6 then
		tinsert(tSay, "Ta mu鑞 ti課 c� "..tCampNameZ[nCurCamp].." Tng qu﹏/#offer_rank(2,"..nCurCamp..")")
	end
	tinsert(tSay, "Kh玭g c� g�/nothing")	
	Say(g_szInfoHeader.."<color=yellow>Nguy猲 So竔<color> c� th� ti課 c� <color=yellow>3 Ti猲 Phong<color> v� <color=yellow>4 Tng Qu﹏<color> c飊g phe, <color=yellow>Tng Qu﹏<color> c� th� ti課 c� 2 Ti猲 Phong c飊g phe. Ti猲 Phong ti課 c� <color=yellow>c莕 120000 甶觤 qu﹏ c玭g, 2 N� Oa Tinh Th筩h <color>. Tng Qu﹏ ti課 c� <color=yellow>c莕 2500000 甶觤 qu﹏ c玭g, 3 N� Oa Tinh Th筩h<color>. <color=red>Ch� �: qu﹏ h祄 ti課 c� ch� c� hi謚 l鵦 trong tu莕. дn 21 gi� th� 7 h籲g tu莕 s� x衪 l筰 qu﹏ h祄.<color>",getn(tSay),tSay);
end

function offer_rank(nType,nCurCamp)	
	if tonumber(date("%w")) ~= 0 then
		Talk(1,"",g_szInfoHeader.."Hi謓 t筰 i qu﹏  xu蕋 ph竧, kh玭g th� b� sung qu﹏ l鵦! Ch� c� th� ti課 c� v祇 ng祔 Ch� Nh藅!")
		return 0
	end
	if GetTeamSize() < 2 then
		Talk(1,"",g_szInfoHeader.."Ta kh玭g th蕐 ngi d蒼 theo ngi mu鑞 ti課 c�. H穣 t� i v韎 ngi  n y g苝 ta!")
		return 0
	elseif GetTeamSize() > 2 then
		Talk(1,"",g_szInfoHeader.."M鏸 l莕 ch� c� th� ti課 c� 1 ngi. H穣 甶襲 ch豱h l筰 t� i!")
		return 0
	end
	if GetCaptainName() ~= GetName() then
		Talk(1,"",g_szInfoHeader.."H穣 th玭g b竜 i trng n g苝 ta!")
		return 0	
	end
	
	local nCurWeek = tonumber(date("%W"))
	local nCurDay = tonumber(date("%d"))
	local nTaskVal = GetTask(TSK_NGUYENSOAI)
	local nWeek =GetByte(nTaskVal,BYTE_WEEK)
	local nDay =GetByte(nTaskVal,BYTE_DAY)
	
	if nWeek ~= nCurWeek and nCurDay ~= nDay then
		nTaskVal = SetByte(nTaskVal,tb_introduce_rank[1][2],0)
		nTaskVal = SetByte(nTaskVal,tb_introduce_rank[2][2],0)
		nTaskVal = SetByte(nTaskVal,BYTE_WEEK,nCurWeek)
		nTaskVal = SetByte(nTaskVal,BYTE_DAY,nCurDay)
		SetTask(TSK_NGUYENSOAI, nTaskVal)
	end
	
	nTaskVal = GetTask(TSK_NGUYENSOAI)
	if GetByte(nTaskVal,tb_introduce_rank[nType][2]) >= tb_introduce_rank[nType][3] then
		Talk(1,"",g_szInfoHeader.."Tu莕 n祔 <color=yellow>Nguy猲 So竔<color>  ti課 c�  "..tb_introduce_rank[nType][3].." "..tb_introduce_rank[nType][1].." cho tri襲 nh r錳. Qu� l� may m緉 cho tri襲 nh!")
		return 0
	end
	if abs(GetTask(704)) == 5 and GetByte(nTaskVal,tb_introduce_rank[nType][2]) >= 2 then
		Talk(1,"",g_szInfoHeader.."Tu莕 n祔 <color=yellow>Tng Qu﹏<color>  ti課 c�  2 "..tb_introduce_rank[nType][1].." cho tri襲 nh r錳. Qu� l� may m緉 cho tri襲 nh!")
		return 0
	end
			
	local szOfferName = ""
	local nOfferCamp = 0;
	local nOfferPoint = 0;
	local nOfferRank = 0;
	
	OldPlayer = PlayerIndex;
	for i=1,GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if PlayerIndex > 0 then
			if PlayerIndex ~= OldPlayer then
				szOfferName = GetName()
				nOfferRank = GetTask(704)	
				nOfferPoint = GetTask(701)				
				if nOfferRank >= 0 then
					nOfferCamp = SONG_ID;
				else
					nOfferCamp = LIAO_ID;
				end;	
				break;
			end
		end
	end
	PlayerIndex = OldPlayer;
	
	if nCurCamp ~= nOfferCamp then
		if abs(GetTask(704)) == 6 then
			Talk(1,"",g_szInfoHeader.."в  ph遪g gian t�, <color=yellow>Nguy猲 So竔<color> kh玭g n猲 ti課 c� ngi c馻 phe ch!")
		else
			Talk(1,"",g_szInfoHeader.."в  ph遪g gian t�, <color=yellow>Tng Qu﹏<color> kh玭g n猲 ti課 c� ngi c馻 phe ch!")
		end
		return 0
	end
	
	if abs(nOfferRank) >= tb_introduce_rank[nType][8] then
		Talk(1,"",g_szInfoHeader.."Ngi 頲 ti課 c�  c� qu﹏ h祄 "..tb_introduce_rank[nType][1].."  r錳! Kh玭g c莕 ti課 c� n鱝!")
		return 0
	end
	
	if abs(nOfferPoint) < tb_introduce_rank[nType][7] then
		Say(g_szInfoHeader.."Hi謓 nay tri襲 nh 產ng tuy觧 m� nh﹏ t礽  tr蕁 秈 bi猲 cng, b秓 v� t nc. Ta nh薾 th蕐 n╪g l鵦 c馻 <color=yellow>"..szOfferName.."<color> ch璦   ti課 c�. <color=yellow>Nguy猲 So竔<color> h穣 t譵 ngi c� kh� n╪g h琻!",1,"Th藅 ng筰 qu�! Ta s� quay l筰 sau!/nothing")
		return 0
	else
		if abs(GetTask(704)) == 6 then
			Say(g_szInfoHeader.."Hi謓 nay tri襲 nh 產ng tuy觧 m� nh﹏ t礽  tr蕁 秈 bi猲 cng, b秓 v� t nc. Ta nh薾 th蕐 <color=yellow>"..szOfferName.."<color> v╪ v� song to祅. <color=yellow>Nguy猲 So竔<color> mu鑞 ti課 c� ngi n祔 ph秈 kh玭g?",2,"ng v藋! H穣 t﹗ v韎 ho祅g thng gi髉 ta!/#confirm_offer_rank("..nType..","..nCurCamp..")","Ta ch璦 mu鑞 ti課 c� ngi n祔!/nothing")
		else
			Say(g_szInfoHeader.."Hi謓 nay tri襲 nh 產ng tuy觧 m� nh﹏ t礽  tr蕁 秈 bi猲 cng, b秓 v� t nc. Ta nh薾 th蕐 <color=yellow>"..szOfferName.."<color> v╪ v� song to祅. <color=yellow>Tng Qu﹏<color> mu鑞 ti課 c� ngi n祔 ph秈 kh玭g?",2,"ng v藋! H穣 t﹗ v韎 ho祅g thng gi髉 ta!/#confirm_offer_rank("..nType..","..nCurCamp..")","Ta ch璦 mu鑞 ti課 c� ngi n祔!/nothing")
		end
	end
end

function confirm_offer_rank(nType,nCurCamp)
	local szOfferName = ""
	local szPlayerName = GetName()
	local nOK = 1
	local nForce = 1
	if nCurCamp == LIAO_ID then
		nForce = -1
	end
	OldPlayer = PlayerIndex;
	for i=1,GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if PlayerIndex > 0 then
			if PlayerIndex ~= OldPlayer then
				szOfferName = GetName()
								
				if GetItemCount(2,1,504) < tb_introduce_rank[nType][4] then
					nOK = 0
					Say(g_szInfoHeader.."N� Oa Tinh Th筩h tr猲 ngi c馻 c竎 h� kh玭g !",0)
					Say2SomeOne(OldPlayer,g_szInfoHeader.."N� Oa Tinh Th筩h tr猲 ngi c馻 "..szOfferName.." kh玭g !",0)
					PlayerIndex = OldPlayer
					return 0
				end
				
--				if GetItemCount(2,1,537) < tb_introduce_rank[nType][5] then
--					nOK = 0
--					Say(g_szInfoHeader.."C竎 h� ch璦 c�  T� Kim H錸g Bao!",0)
--					Say2SomeOne(OldPlayer,g_szInfoHeader.."T� Kim H錸g Bao tr猲 ngi c馻 "..szOfferName.." kh玭g !",0)
--					PlayerIndex = OldPlayer
--					return 0
--				end
--				
--				if GetItemCount(2,1,539) < tb_introduce_rank[nType][6] then
--					nOK = 0
--					Say(g_szInfoHeader.."C竎 h� ch璦 c�  Ho祅g Kim Чi H錸g Bao!",0)
--					Say2SomeOne(OldPlayer,g_szInfoHeader.."Ho祅g Kim Чi H錸g Bao tr猲 ngi c馻 "..szOfferName.." kh玭g !",0)
--					PlayerIndex = OldPlayer
--					return 0
--				end
				
				if DelItem(2,1,504,tb_introduce_rank[nType][4]) == 1 then	--and DelItem(2,1,537,tb_introduce_rank[nType][5]) == 1 and DelItem(2,1,539,tb_introduce_rank[nType][6]) == 1
					SetTask(704,nForce * tb_introduce_rank[nType][8])
					Say(g_szInfoHeader.."Tri襲 nh nghe danh c竎 h�  l﹗. Nay phong cho c竎 h� ch鴆 <color=green>"..tb_introduce_rank[nType][1].."<color>! H穣 d鑓 s鴆 v� tri襲 nh!",0)				
				end				
			end
		end		
	end
	PlayerIndex = OldPlayer
	
	if nOK == 0 then
		return 0
	end
	
	local nVal = GetByte(GetTask(TSK_NGUYENSOAI),tb_introduce_rank[nType][2])
	nVal = SetByte(GetTask(TSK_NGUYENSOAI), tb_introduce_rank[nType][2], nVal +1)
	SetTask(TSK_NGUYENSOAI,nVal)
	if abs(GetTask(704)) == 6 then
		WriteLogEx("Nguyen Soai tien cu ",szOfferName,1,tb_introduce_rank[nType][1])
		AddGlobalNews("[Ho祅g  ban chi誹]: nh薾 頲 ti課 c� c馻 <color=green>"..tCampNameZ[nCurCamp].." Nguy猲 So竔<color> <color=yellow>"..GetName().."<color>, nay phong cho <color=yellow>"..szOfferName.."<color> l祄 <color=green>"..tCampNameZ[nCurCamp].." "..tb_introduce_rank[nType][1].."<color>! Th藅 l� tin m鮪g cho Чi "..tCampNameZ[nCurCamp].."!" )
		Say(g_szInfoHeader.."Ti課 c� ho祅 t蕋, <color=yellow>"..szOfferName.."<color>  tr� th祅h "..tCampNameZ[nCurCamp].." "..tb_introduce_rank[nType][1]..". Ch骳 m鮪g Nguy猲 So竔!",1,"Xin 產 t�!/nothing")
	else
		WriteLogEx("Tuong Quan tien cu ",szOfferName,1,tb_introduce_rank[nType][1])
		AddGlobalNews("[Ho祅g  ban chi誹]: nh薾 頲 ti課 c� c馻 <color=green>"..tCampNameZ[nCurCamp].." Tng Qu﹏<color> <color=yellow>"..GetName().."<color>, nay phong cho <color=yellow>"..szOfferName.."<color> l祄 <color=green>"..tCampNameZ[nCurCamp].." "..tb_introduce_rank[nType][1].."<color>! Th藅 l� tin m鮪g cho Чi "..tCampNameZ[nCurCamp].."!" )
		Say(g_szInfoHeader.."Ti課 c� ho祅 t蕋, <color=yellow>"..szOfferName.."<color>  tr� th祅h "..tCampNameZ[nCurCamp].." "..tb_introduce_rank[nType][1]..". Ch骳 m鮪g Tng Qu﹏!",1,"Xin 產 t�!/nothing")
	end
end

function change_battle_equip()
	local nCurRank = BT_GetData(PT_CURRANK);
	local nCurCamp = 0;
	if nCurRank >= 0 then
		nCurCamp = SONG_ID;
	else
		nCurCamp = LIAO_ID;
	end;
	local nEnemyCamp = SONGLIAO_ID - nCurCamp;
	local selTab = {
				"Ta mu鑞 i "..tCampNameZ[nCurCamp].."Trang b� Ti猲 phong/#select_equip_type(1,"..nCurCamp..")",
				"Ta mu鑞 i "..tCampNameZ[nCurCamp].."Trang b� Tng qu﹏/#select_equip_type(2,"..nCurCamp..")",
--				"Ta mu鑞 i "..tCampNameZ[nCurCamp].."Trang b� Nguy猲 so竔/#select_equip_type(3,"..nCurCamp..")",
--				"Ta mu鑞 i "..tCampNameZ[nCurCamp].."Trang b� V躰h Vi詎 Nguy猲 So竔 /#select_equip_type(4,"..nCurCamp..")",
--				"Ta mu鑞 i "..tCampNameZ[nCurCamp].."Trang b� Thi猲 Chi Tng Qu﹏/#select_equip_type(5,"..nCurCamp..")",
--				"Ta mu鑞 i "..tCampNameZ[nCurCamp].."Trang b� Thi猲 Chi Nguy猲 So竔/#select_equip_type(6,"..nCurCamp..")",
--				"Ta mu鑞 i "..tCampNameZ[nCurCamp].."Trang b� Thi猲 Chi Nguy猲 So竔 v躰h vi詎/#select_equip_type(7,"..nCurCamp..")",
				"Kh玭g c� g�/nothing",
				}
	local szString = "";
	if IB_VERSION == 1 then
		szString = "v� hi謚 qu� nh h錸";
	end;
	Say(g_szInfoHeader.."Ngi mu鑞 i trang b�? <color=red>Ch� �: Ъng c蕄 cng h鉧 kh玭g thay i, "..szString.." bi課 m蕋. Sau khi chuy觧 qu﹏ c玭g, n誹 kh玭g th� i, c� th� l� do qu﹏ h祄 ch璦 頲 c藀 nh藅 k辮 th阨, vui l遪g sau khi x誴 h筺g l骳 9h t鑙 v祇 th� 7 m韎 n t譵 ta.<color>",getn(selTab),selTab);
end;

function select_equip_type(nType,nCurCamp)
	local nEnemyCamp = SONGLIAO_ID - nCurCamp;
	local selTab = {};
	local szCurCampEquipName = "";
	local szEnemyCampEquipName = "";
	for i=1,getn(TB_BATTLE_EQUIP[nType][nEnemyCamp]) do
		szCurCampEquipName = TB_BATTLE_EQUIP[nType][nCurCamp][i][1];
		szEnemyCampEquipName = TB_BATTLE_EQUIP[nType][nEnemyCamp][i][1];
		selTab[i] = "Ta mu鑞 i "..szCurCampEquipName.." (c莕 250 v祅g v� "..szEnemyCampEquipName..")/#get_battle_equip_confirm("..nType..","..nCurCamp..","..i..")";
	end;
	tinsert(selTab,"в ta ngh� l筰/nothing");
	local szString = "";
	if IB_VERSION == 1 then
		szString = " hi謚 qu� nh h錸 bi課 m蕋";
	end;
	Say(g_szInfoHeader.."Ngi mu鑞 i trang b� n祇 trong y? <color=red>Ch� �: Trang b� sau khi i ng c蕄 cng h鉧 kh玭g thay i, "..szString..".<color>",getn(selTab),selTab);
end;

function get_battle_equip_confirm(nType,nCurCamp,nEquipIdx)
	local selTab = {
				"уng �/#get_battle_equip("..nType..","..nCurCamp..","..nEquipIdx..")",
				"H駓 b�/nothing",
				}
	local nEnemyCamp = SONGLIAO_ID - nCurCamp;
	local szCurCampEquipName = TB_BATTLE_EQUIP[nType][nCurCamp][nEquipIdx][1];
	local szEnemyCampEquipName = TB_BATTLE_EQUIP[nType][nEnemyCamp][nEquipIdx][1];
	Say(g_szInfoHeader.."Ngi x竎 nh薾 mu鑞 i <color=yellow>"..szCurCampEquipName.." (c莕 250 v祅g v� "..szEnemyCampEquipName..")<color> ch�? <color=yellow>Ch� �: N誹 i M穙, Thng y, H� y th� ngi ph秈 m芻 trang b� v祇 ngi.<color>",getn(selTab),selTab);
end;

function get_battle_equip(nType,nCurCamp,nEquipIdx)
	if Zgc_pub_goods_add_chk(1,200) ~= 1 then
		return 0;
	end
	local nEnemyCamp = SONGLIAO_ID - nCurCamp;
	local nBody = GetBody();
	local nDelID1,nDelID2,nDelID3,nTypeID = 0,0,0,-1;
	local nID1,nID2,nID3 = 0,0,0;
	local nUpgrade = 0;
	local szDelItemName = TB_BATTLE_EQUIP[nType][nEnemyCamp][nEquipIdx][1];
	nDelID1 = TB_BATTLE_EQUIP[nType][nEnemyCamp][nEquipIdx][2];
	nDelID2 = TB_BATTLE_EQUIP[nType][nEnemyCamp][nEquipIdx][3];
	nDelID3 = TB_BATTLE_EQUIP[nType][nEnemyCamp][nEquipIdx][4];
	nTypeID = TB_BATTLE_EQUIP[nType][nEnemyCamp][nEquipIdx][5];
	local szItemName = TB_BATTLE_EQUIP[nType][nCurCamp][nEquipIdx][1];
	nID1 = TB_BATTLE_EQUIP[nType][nCurCamp][nEquipIdx][2];
	nID2 = TB_BATTLE_EQUIP[nType][nCurCamp][nEquipIdx][3];
	nID3 = TB_BATTLE_EQUIP[nType][nCurCamp][nEquipIdx][4];		
	if nTypeID ~= -1 then
		local nG,nD,nP = GetPlayerEquipInfo(nTypeID)
		if ((nG ~= nDelID1) or (nD ~= nDelID2) or (nP ~= nDelID3+nBody-1)) then
			Talk(1,"change_battle_equip",g_szInfoHeader.."Ph秈 c� <color=yellow>"..szDelItemName.."<color> m韎 c� th� i th祅h <color=yellow>"..szItemName.."<color>.");
			return 0;
		end		
		local nItemIdx = GetPlayerEquipIndex(nTypeID)		
		nUpgrade = GetEquipAttr(nItemIdx,2) or 0
		UnEquipAtPosition(nTypeID)
	end	
	local nDelItemCount = GetItemCount(nDelID1,nDelID2,nDelID3+nBody-1);
	if nDelItemCount > 1 then
		Talk(1,"change_battle_equip",g_szInfoHeader.."Ngi mang theo qu� nhi襲 <color=yellow>"..szDelItemName.."<color>, mu鑞 ta i cho ngi c竔 n祇? Ngi n猲 s緋 x誴 l筰 h祅h trang, <color=yellow> 甧m c竔 ngi mu鑞 i  l筰 y. <color>");
		return 0;
	end;
	if nDelItemCount <= 0 then
		Talk(1,"change_battle_equip",g_szInfoHeader.."Ph秈 c� <color=yellow>"..szDelItemName.."<color> m韎 c� th� i th祅h <color=yellow>"..szItemName.."<color>.");
		return 0;
	end;
	if GetCash() < 2500000 then
		Talk(1,"",g_szInfoHeader.."V祅g tr猲 ngi ngi kh玭g ,  <color=yellow>100 lng<color> m韎 c� th� i trang b� n祔.");
		return 0;
	end;
	if DelItem(nDelID1,nDelID2,nDelID3+nBody-1,1) == 1 then
		Pay(2500000);
		local nRetCode = AddItem(nID1,nID2,nID3+nBody-1,1,1,-1,-1,-1,-1,-1,-1,0,nUpgrade);
		if nRetCode == 1 then
			Msg2Player("B筺  nh薾 頲 1 "..szItemName);
			WriteLog("[Trang b� chi課 trng i]:"..GetName().."Х i 1"..szDelItemName);
		else
			WriteLog("[Trang b� chi課 trng i b� l鏸]:"..GetName().."фi"..szDelItemName.."AddItem g苝 l鏸, nRetCode:"..nRetCode);
		end;
	end;
end;

function apply_jungong_save()
	-- Gioi han bao toan cong trang Thuong Ung
	local nDate = tonumber(date("%Y%m%d"))
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	-- Gioi han Kim Ung
	if nDate < 20121124 and nNation == 74 then
		Talk(1,"",g_szInfoHeader .. "Hi謓 t筰 ch璦 n l骳 m� t輓h n╪g n祔, ngi h穣 quay l筰 sau nh�.")
		return 0
	end
	
	if GetTask(TSK_TRANS_POINT_ALLOW) == 0 then
		if GetTask(701) > 0 then
			Talk(1,"","H穣 n g苝 Ti觰 Phng  tham gia nh gi� qu﹏ h祄, nh薾 qu﹏ c玭g qu﹏ h祄 tu莕 n祔 v� i m韎 qu﹏ h祄. Sau  n g苝 ta");
			return 0;	
		end
		if GetTask(701) < 0 then
			Talk(1,"","H穣 n g苝 Ti觰 Ng鋍  tham gia nh gi� qu﹏ h祄, nh薾 qu﹏ c玭g qu﹏ h祄 tu莕 n祔 v� i m韎 qu﹏ h祄. Sau  n g苝 ta.");
			return 0;	
		end	
	end

	local selTab = 	{
								"H穣 gi髉 ta b秓 l璾 甶觤 qu﹏ c玭g/apply_jungong_confirm",
								"Ta mu鑞 nh薾 l筰 甶觤 qu﹏ c玭g/receive_jungong_save",
								"в ta suy ngh� /nothing",
							}
	if abs(GetTask(TSK_TRANS_POINT)) > 0 then
		if GetTask(TSK_TRANS_DATE) >= tonumber(date("%Y%m%d")) then			
			tremove(selTab,1)			
		else
			SetTask(TSK_TRANS_POINT,0)
			SetTask(TSK_TRANS_DATE,0)
			tremove(selTab,2)
		end
	else
		tremove(selTab,2)
	end
	Say(g_szInfoHeader.."L穙 phu c� th� gi髉 ngi b秓 to祅 甶觤 qu﹏ c玭g sau khi chuy觧 server. <color=yellow>Th� 5 h籲g tu莕 h穣 n g苝 l穙 phu b秓 l璾 qu﹏ c玭g<color>. Ph� b秓 l璾 l� <color=green>500 v祅g<color>. <color=yellow>Th阨 gian nh薾 l筰 甶觤 qu﹏ c玭g t� 10:00 - 24:00 th� 6<color>, sau th阨 gian n祔 ta kh玭g ch辵 tr竎h nhi謒 b秓 l璾 甶觤 c馻 ngi. <color=red>L璾 �: 觤 qu﹏ c玭g t鑙 產 nh薾 頲 sau khi chuy觧 server l� 110% c馻 ngi cao nh蕋 c飊g phe.<color>.",getn(selTab),selTab);
end

function apply_jungong_confirm()
--	if tonumber(date("%y%m%d")) >= 110105 then
--		Talk(1, "", "Ch鴆 n╪g n祔 產ng t筸 ng!")
--		return
--	end
	local nDay = tonumber(date("%w"))	
	local nJungGong = GetTask(701)
	local nType = 0
	if nDay ~= 4 then
		Talk(1,"",g_szInfoHeader.."Th� 5 h籲g tu莕 h穣 n y g苝 l穙 phu!")
		return
	end
	if GetLevel() <80 then
		Talk(1,"",g_szInfoHeader.."L穙 phu ch� nh薾 甶觤 c馻 cao th� ng c蕄 80 tr� l猲!")
		return	
	end
	if abs(nJungGong) <= 80000 then
		Talk(1,"",g_szInfoHeader.."觤 qu﹏ c玭g c馻 ngi nh� h琻 80000, kh玭g c莕 ph秈 b秓 l璾!")
		return	
	end
	if abs(GetTask(TSK_TRANS_POINT)) > 0 then		
		Talk(1,"",g_szInfoHeader.."Ngi ch璦 nh薾 l筰 甶觤 qu﹏ c玭g  b秓 l璾!")
		return
	end
	local strCharge =  "500 v祅g"	
	local strSay = {
							format("Ta ng �!/#apply_jungong_confirm_confirm(%d)",nType),
							"в ta suy ngh� /nothing"	
						}	
	Say("觤 qu﹏ c玭g hi謓 t筰 c馻 ngi l� <color=yellow>"..abs(nJungGong).."<color>, ph� b秓 l璾 l� <color=yellow>"..strCharge.."<color>. Sau khi b秓 l璾 甶觤 qu﹏ c玭g t筸 th阨 c馻 ngi l� 80000. X竎 nh薾 mu鑞 b秓 l璾 甶觤?",getn(strSay),strSay)
end

function apply_jungong_confirm_confirm(nType)
	local nDay = tonumber(date("%w"))
	local nDate = tonumber(date("%Y%m%d"))
	local nNextDate = tf_GetResultDate(nDate,1)
	local nJungGong = GetTask(701)
	if nDay ~= 4 then
		Talk(1,"",g_szInfoHeader.."Th� 5 h籲g tu莕 h穣 n y g苝 l穙 phu!")
		return
	end
	if abs(nJungGong) <= 80000 then
		Talk(1,"",g_szInfoHeader.."觤 qu﹏ c玭g c馻 ngi nh� h琻 80000, kh玭g c莕 ph秈 b秓 l璾!")
		return	
	end
	if abs(GetTask(TSK_TRANS_POINT)) > 0 then
		Talk(1,"",g_szInfoHeader.."Ngi ch璦 nh薾 l筰 甶觤 qu﹏ c玭g  b秓 l璾!")
		return
	end		
	if GetCash() < 5000000 then
		Talk(1,"",g_szInfoHeader.."Ngi kh玭g mang  500 v祅g!")
		return
	end
	CalcBattleRank()
	UpdateBattleMaxRank()
	if Pay(5000000)  == 1 then
		SetTask(TSK_TRANS_DATE,nNextDate)
		SetTask(TSK_TRANS_POINT,GetTask(701))
		--SetTask(TSK_TRANS_POINT_ALLOW,1)
		gf_SetTaskByte(TSK_SERVER_ID,TSK_SERVER_ID_JUNGONG,GetGlbValue(GLB_TSK_SERVER_ID))
		if nJungGong >= 0 then		
			SetTask(701,80000)
		else
			SetTask(701,-80000)
		end
		Say(g_szInfoHeader.."L穙 phu  b秓 l璾 甶觤 th祅h c玭g cho ngi. Ng祔 mai n y nh薾 l筰 nh�!",0)
		WriteLogEx("Bao luu quan cong","g鰅 甶觤 th祅h c玭g",nJungGong,"甶觤 qu﹏ c玭g")
	else
		WriteLogEx("Bao luu quan cong","g鰅 甶觤 th蕋 b筰",nJungGong,"甶觤 qu﹏ c玭g")
	end
end

function receive_jungong_save()
	local nDay = tonumber(date("%w%H"))
	local nDate = tonumber(date("%Y%m%d"))	
	if nDay < 510 or nDay >= 524 then
		Talk(1,"",g_szInfoHeader.."Th� 6 h籲g tu莕 t� 10:00 - 24:00 h穣 n y g苝 l穙 phu nh薾 l筰 甶觤!")
		return
	end
	if GetLevel() <80 then
		Talk(1,"",g_szInfoHeader.."L穙 phu ch� nh薾 甶觤 c馻 cao th� ng c蕄 80 tr� l猲!")
		return	
	end
	if abs(GetTask(TSK_TRANS_POINT)) <= 0 then
		Talk(1,"",g_szInfoHeader.."L穙 phu kh玭g gi� 甶觤 g� c馻 ngi c�!")
		return
	end
	if GetTask(TSK_TRANS_DATE) <  nDate then
		SetTask(TSK_TRANS_POINT,0)
		SetTask(TSK_TRANS_DATE,0)
		gf_SetTaskByte(TSK_SERVER_ID,TSK_SERVER_ID_JUNGONG,0)
		Talk(1,"",g_szInfoHeader.."Th藅 ng ti誧, th阨 h筺 nh薾 l筰 甶觤  qua!")
		return
	end
	local nCurCamp = BT_GetCurCamp();	
	local nSaveJunGong = abs(GetTask(TSK_TRANS_POINT))	
	local nCurRank = abs(GetTask(704))
	local nMaxJunGong = 0;
	local nAlterantJunGong = 0;	
	if gf_GetTaskByte(TSK_SERVER_ID,TSK_SERVER_ID_JUNGONG) == GetGlbValue(GLB_TSK_SERVER_ID) then
		nAlterantJunGong = nSaveJunGong
	else
		if nCurCamp == SONG_ID then
			nMaxJunGong = GetRankByIndex(1,0);
		else
			nMaxJunGong = GetRankByIndex(-1,0);
		end;
		if not nMaxJunGong then
			nMaxJunGong = 1;
		end;
		nAlterantJunGong = ceil(nMaxJunGong*1.1);
		nAlterantJunGong = min(nAlterantJunGong,nSaveJunGong);
	end
	local selTab = {
				"An t﹎ 甶, ta  bi誸 r錳/#receive_jungong_save_confirm("..nAlterantJunGong..")",
				"в ta suy ngh� /nothing",
				}
	Say(g_szInfoHeader.."觤 qu﹏ c玭g b秓 l璾 hi謓 gi� c馻 ngi ("..tCampNameZ[nCurCamp]..") l� <color=yellow>"..nSaveJunGong.."<color>, c� th� nh薾 nhi襲 nh蕋 <color=yellow>"..nAlterantJunGong.."<color> 甶觤 qu﹏ c玭g. уng � ch�?",getn(selTab),selTab);	
end


function receive_jungong_save_confirm(nAlterantJunGong)
	local nDay = tonumber(date("%w%H"))
	local nDate = tonumber(date("%Y%m%d"))	
	if nDay < 510 or nDay >= 524 then
		Talk(1,"",g_szInfoHeader.."Th� 6 h籲g tu莕 t� 10:00 - 24:00 h穣 n y g苝 l穙 phu nh薾 l筰 甶觤!")
		return
	end
	if nAlterantJunGong <= 0 then
		Talk(1,"",g_szInfoHeader.."L穙 phu kh玭g gi� 甶觤 g� c馻 ngi c�!")
		return
	end
	if GetTask(TSK_TRANS_POINT) < 0 then
		nAlterantJunGong = - nAlterantJunGong
	end
	SetRankPoint(5, 701, 1)
	CalcBattleRank()
	UpdateBattleMaxRank()
	SetTask(701,nAlterantJunGong)
	SetTask(TSK_TRANS_POINT,0)
	SetTask(TSK_TRANS_DATE,0)
	gf_SetTaskByte(TSK_SERVER_ID,TSK_SERVER_ID_JUNGONG,0)
	CalcBattleRank()
	UpdateBattleMaxRank()
	--SetTask(TSK_TRANS_POINT_ALLOW,0)
	Say(g_szInfoHeader.."L穙 phu  ph鬰 h錳 甶觤 cho ngi th祅h c玭g!",0)
	WriteLogEx("Bao luu quan cong","nh薾 甶觤 th祅h c玭g",nAlterantJunGong,"甶觤 qu﹏ c玭g")
end

function apply_jungong_change()
	local nDate = tonumber(date("%Y%m%d"))
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	-- Gioi han chuyen doi cong trang Thuong Ung
	if nDate < 20121124 and nNation == 74 then
		Talk(1,"",g_szInfoHeader .. "Hi謓 t筰 ch璦 cho ph衟 chuy觧 i c玭g tr筺g, ngi h穣 quay l筰 sau nh�.")
		return 0
	end
	local selTab = {
				"Ta  quy誸 nh, kh玭g c莕 khuy猲 n鱝/jungong_change_confirm",
				"в ta suy ngh� /nothing",
				}
	Say(g_szInfoHeader.."Ngi th藅 s� mu鑞 chuy觧 n doanh tr筰 i phng ch�? Vi謈 n祔 r蕋 t鑞 k衜, hay l� suy ngh� k� r錳 h絥 quy誸 nh! N誹 ngi  ng k� tham gia chi課 trng, <color=red>sau khi chuy觧 th祅h c玭g, ph秈 ng k� l筰<color>, Ngi  quy誸 nh r錳 ch�? <color=red>Ch� �: Ngi ch琲 c� qu﹏ c玭g th蕄 h琻 ho芻 b籲g 120000 kh玭g th� s� d鬾g t輓h n╪g n祔, h穣 mua u th祅h t輓, u th祅h th� ho芻 u th祅h bi觰 � Ng� C竎 d飊g  ti課 h祅h chuy觧 i.<color>",getn(selTab),selTab);
end;

function jungong_change_confirm()
	local nCurCamp = BT_GetCurCamp();
	local nOppCamp = SONGLIAO_ID - nCurCamp;
	local nCurJunGong = abs(BT_GetData(PT_RANKPOINT));	--自己当前的军功
	if nCurJunGong <= 120000 then
		Talk(1,"",g_szInfoHeader.."觤 qu﹏ c玭g hi謓 gi� c馻 ngi nh� h琻 ho芻 b籲g 120000, kh玭g c莕 i qu﹏ c玭g � y, h穣 mua u th祅h t輓, u th祅h th� ho芻 u th祅h bi觰 � Ng� C竎  ti課 h祅h chuy觧 i.");
		return 0;
	end;
	local nOppMaxJunGong = 0;
	if nOppCamp == SONG_ID then
		nOppMaxJunGong = GetRankByIndex(1,0);	--获得敌方第一名的军功
	else
		nOppMaxJunGong = GetRankByIndex(-1,0);	--获得敌方第一名的军功
	end;
	if not nOppMaxJunGong then
		nOppMaxJunGong = 1;
	end;
	local nAlterantJunGong = 0;	--可转换军功
	local nAlterantMaxJunGong = 360000;	--最大可转换军功
	nAlterantJunGong = ceil(nOppMaxJunGong*0.85);	--最多可转敌方最多军功的85%
	nAlterantJunGong = min(nAlterantJunGong,nCurJunGong);	--不能超过自己当前的军功
	nAlterantJunGong = min(nAlterantJunGong,nAlterantMaxJunGong)	--不能超过某个最大值
	local nNeedItemNum = 3 -- ceil(nAlterantJunGong/120000)^2;
	local selTab = {
				"An t﹎ 甶, ta  chu萵 b� r錳/#jungong_change_confirm_final("..nAlterantJunGong..")",
				"в ta suy ngh� /nothing",
				}
	Say(g_szInfoHeader.."觤 qu﹏ c玭g hi謓 gi� c馻 ngi ("..tCampNameZ[nCurCamp]..") l� <color=yellow>"..nCurJunGong.."<color>, chuy觧 n i phng ("..tCampNameZ[nOppCamp]..") c� th� chuy觧 nhi襲 nh蕋 <color=yellow>"..nAlterantJunGong.."<color> 甶觤 qu﹏ c玭g, c莕 d飊g <color=yellow>"..nNeedItemNum.." u th祅h bi觰 v� 1000 v祅g<color>, ngi ch綾 ch緉 mu鑞 chuy觧 ch�? <color=red>Ch� �: Chuy觧 qu﹏ c玭g c� nh鱪g quy t綾 sau: 1. C� th� chuy觧 nhi襲 nh蕋 360000 qu﹏ c玭g; 2. N誹 85%甶觤 qu﹏ c玭g c馻 ngi x誴 u trong b秐g x誴 h筺g qu﹏ c玭g c馻 i phng nh� h琻 360000, th� ngi ch� c� th� i nhi襲 nh蕋 (85% 甶觤 qu﹏ c玭g c馻 ngi x誴 u trong b秐g x誴 h筺g qu﹏ c玭g i phng).<color>",getn(selTab),selTab);
end;

function jungong_change_confirm_final(nAlterantJunGong)
	local nNeedItemNum = 3 -- ceil(nAlterantJunGong/120000)^2;
	local nCurJunGong = abs(BT_GetData(PT_RANKPOINT));	--自己当前的军功
	if nCurJunGong <= 120000 then
		Talk(1,"",g_szInfoHeader.."觤 qu﹏ c玭g hi謓 gi� c馻 ngi nh� h琻 ho芻 b籲g 120000, kh玭g c莕 i qu﹏ c玭g � y, h穣 mua u th祅h t輓, u th祅h th� ho芻 u th祅h bi觰 � Ng� C竎  ti課 h祅h chuy觧 i.");
		return 0;
	end;
	if  GetCash() < 10000000 then
		Talk(1,"",g_szInfoHeader.."H譶h nh� ngi kh玭g c�  1000 v祅g!");
		return 0;
	end
	if DelItem(2,1,9978,nNeedItemNum) == 1 and Pay(10000000) == 1 then
		local nCurCamp = BT_GetCurCamp();
		local nOppCamp = SONGLIAO_ID - nCurCamp;
		if nOppCamp == SONG_ID then
			BT_SetData(PT_RANKPOINT,nAlterantJunGong);
		else
			BT_SetData(PT_RANKPOINT,-nAlterantJunGong);
		end;
		BT_SetData(PT_BATTLE_DATE,0);
		BT_SetData(PT_SIGN_UP,0);
		Say(g_szInfoHeader.."B筺 t th祅h c玭g "..tCampNameZ[nCurCamp].."Phng "..nCurJunGong.." 甶觤 c玭g tr筺g i th祅h"..tCampNameZ[nOppCamp].."Phng "..nAlterantJunGong.." 甶觤 qu﹏ c玭g.",0);
		Msg2Player("B筺 t th祅h c玭g "..tCampNameZ[nCurCamp].."Phng "..nCurJunGong.." 甶觤 c玭g tr筺g i th祅h"..tCampNameZ[nOppCamp].."Phng "..nAlterantJunGong.." 甶觤 c玭g tr筺g");
		SetRankPoint(5,701,1);	--加入军功排行榜
		WriteLog("[Tri謚 Ph� chuy觧 qu﹏ c玭g]:"..GetName().."D飊g th�"..nNeedItemNum.." u th祅h bi觰 th祅h c玭g 甧m "..tCampNameZ[nCurCamp].."Phng "..nCurJunGong.." 甶觤 c玭g tr筺g i th祅h"..tCampNameZ[nOppCamp].."Phng "..nAlterantJunGong.." 甶觤 c玭g tr筺g");
	else
		Talk(1,"",g_szInfoHeader.."фi"..nAlterantJunGong.." 甶觤 qu﹏ c玭g c莕 "..nNeedItemNum.." u th祅h bi觰.");
	end;
end;

function get_compensation()
	local nGotBuChangDate = GetTask(TSK_BATTLEBUCHANG);
	if nGotBuChangDate ~= g_nBuChangEndDate then
		SetTask(TSK_BUCHANG_TIMES,0);
	end;
	local nYear,nMonth,nDay,nHour = get_date(g_nBuChangBeginDate);
	local selTab = {
				--"我要领取普通补偿（需要等级10级）/give_added_comp",
				"Ta mu鑞 nh薾 b錳 thng chi課 trng (y猽 c莡 c蕄 60)/get_battle_compensation",
				"T筸 th阨 kh玭g nh薾/nothing",
				}
	Say(g_szInfoHeader.."Ngi mu鑞 nh薾 b錳 thng n祇?",getn(selTab),selTab);
end;

function get_battle_compensation()
	local nGotBuChangDate = GetTask(TSK_BATTLEBUCHANG);
	local nGotBuChangTimes = GetTask(TSK_BUCHANG_TIMES);
	local nLevel = GetLevel();
	local nRoute = GetPlayerRoute();
	local nCurDate = tonumber(date("%Y%m%d%H"));
	if nRoute == 0 then
		Talk(1,"",g_szInfoHeader.."Ngi ph秈 gia nh藀 m玭 ph竔 m韎 c� th� nh薾 b錳 thng chi課 trng.");
		return 0;
	end;
	if nLevel < 60 then
		Talk(1,"",g_szInfoHeader.."Ъng c蕄 c馻 ngi qu� th蕄, ph秈 t n c蕄 60 m韎 c� th� nh薾 b錳 thng chi課 trng.");
		return 0;
	end;
	if nGotBuChangTimes >= g_nMaxBuChangTimes then
		Talk(1,"",g_szInfoHeader.."Ngi  nh薾 t蕋 c� b錳 thng.");
		return 0;
	end;
	if nCurDate > g_nBuChangEndDate then
		Talk(1,"",g_szInfoHeader.."L穙 phu kh玭g h� nh薾 頲 th玭g b竜 l� ngi ch璦 nh薾 .");
		return 0;
	end;
	local selTab = {
				"Ta mu鑞 d飊g Qu﹏ C玭g Chng (qu﹏ c玭g x2, kinh nghi謒 x1.5)/#give_battle_compen_confirm(1)",
				"Ta mu鑞 d飊g Чi Qu﹏ C玭g Chng (qu﹏ c玭g x5, kinh nghi謒 x2)/#give_battle_compen_confirm(2)",
				"Ta mu鑞 d飊g Huy ho祅g chng (qu﹏ c玭g x10, kinh nghi謒 x2.5)/#give_battle_compen_confirm(3)",
				"Kh玭g d飊g/#give_battle_compen_confirm(0)",
				"T筸 th阨 ta ch璦 mu鑞 nh薾 b錳 thng/nothing",
				}
	local tbExpX = {1,1,1.5,2,2,3};	--与军衔对应的经验系数
	local nCurRank = abs(BT_GetData(PT_CURRANK));
	if nCurRank == 0 or nCurRank > getn(tbExpX) then	--如果没有军衔或军衔出错
		nCurRank = 1;	--置为1
	end;
	local nLevelX = 0;
	local nCurGoldenExp = 0;
	local szAddedCompensation = "";
	if IB_VERSION == 0 then
		nLevelX = 75;
		nCurGoldenExp = GetGoldenExp();
	else
		nLevelX = 80;
	end;
	local nExpAward = floor((40000*(nLevel^2)/nLevelX)*tbExpX[nCurRank]);	--40000*（玩家等级平方/75）*军衔调节系数
	local nGoldenExpAward = 4000000;
	local nJunGong = 600;
	local szGoldenExp = "";
	if IB_VERSION == 0 then
		szGoldenExp = "S鴆 kh醗 i kinh nghi謒 <color=yellow>"..nGoldenExpAward.."<color> 甶觤 (甶觤 s鴆 kh醗 c馻 ngi hi謓 gi� l�: <color=yellow>"..nCurGoldenExp.."<color>),";
	end;
	Say(g_szInfoHeader.."Hi謓 gi� b筺 c� th� nh薾 b錳 thng chi課 trng 甶觤 qu﹏ c玭g <color=yellow>"..nJunGong.."<color> 甶觤, 甶觤 kinh nghi謒 <color=yellow>"..nExpAward.." 甶觤<color>,"..szGoldenExp.."M鏸 ngi c� th� nh薾 <color=yellow>"..g_nMaxBuChangTimes.."<color> l莕, y l� l莕 th� <color=yellow>"..(nGotBuChangTimes+1).."<color> b筺 l穘h. B筺 mu鑞 l穘h tr鵦 ti誴 hay d飊g Qu﹏ C玭g Chng  l穘h?",getn(selTab),selTab);
end;

function give_battle_compen_confirm(nType)
	if nType == 0 then
		local selTab = {
					"S� d鬾g qu﹏ c玭g chng/get_battle_compensation",
					"Kh玭g mu鑞 d飊g qu﹏ c玭g n祇 h誸/#give_battle_compensation(0)",
					}
		Say(g_szInfoHeader.."Ngi x竎 nh薾 kh玭g s� d鬾g Qu﹏ C玭g Chng ch�?",getn(selTab),selTab);
	else
		local selTab = {
					format("уng �/#give_battle_compensation(%d)",nType),
					"в ta suy ngh�/nothing",
					}
		Say(g_szInfoHeader.."Ngi x竎 nh薾 mu鑞 s� d鬾g <color=yellow>"..tbJUNGONGZHANG[nType][1].."<color> ch�?",getn(selTab),selTab);
	end;
end;

function give_battle_compensation(nType)
	local nLevel = GetLevel();
	local tbExpX = {1,1,1.5,2,2,3};	--与军衔对应的经验系数
	local nCurRank = abs(BT_GetData(PT_CURRANK));
	if nCurRank == 0 or nCurRank > getn(tbExpX) then	--如果没有军衔或军衔出错
		nCurRank = 1;	--置为1
	end;
	local tbJZGJunGong = {2,5,10};
	local tbJGZExp = {1.5,2,2.5};
	local nLevelX = 0;
	if IB_VERSION == 0 then
		nLevelX = 75;
	else
		nLevelX = 80;
	end;
	local nExpAward = floor((40000*(nLevel^2)/nLevelX)*tbExpX[nCurRank]);	--40000*（玩家等级平方/75）*军衔调节系数
	local nGoldenExpAward = 4000000;
	local nJunGong = 600;
	if nType ~= 0 then
		if DelItem(tbJUNGONGZHANG[nType][2],tbJUNGONGZHANG[nType][3],tbJUNGONGZHANG[nType][4],1) ~= 1 then
			Talk(1,"",g_szInfoHeader.."L穙 phu tuy gi�, nh璶g m総 v蒼 s竛g. Mu鑞 qua m苩 l穙 phu sao?");
			return 0;
		end;
		nExpAward = nExpAward*tbJGZExp[nType];
		nJunGong = nJunGong*tbJZGJunGong[nType];
		Msg2Player("Ngi d飊g 1 "..tbJUNGONGZHANG[nType][1]);
	end;
	local nGotBuChangTimes = GetTask(TSK_BUCHANG_TIMES);
	local nCurJunGong = BT_GetData(PT_RANKPOINT);
	SetTask(TSK_BATTLEBUCHANG,g_nBuChangEndDate);
	SetTask(TSK_BUCHANG_TIMES,nGotBuChangTimes+1);
	nGotBuChangTimes = nGotBuChangTimes + 1;
	if nCurJunGong >= 0 then
		BT_SetData(PT_RANKPOINT,nCurJunGong+nJunGong);
		Msg2Player("Phe T鑞g, b筺 nh薾 頲 "..nJunGong.." 甶觤 c玭g tr筺g");
	else
		BT_SetData(PT_RANKPOINT,nCurJunGong-nJunGong);
		Msg2Player("Phe Li猽, b筺 nh薾 頲 "..nJunGong.." 甶觤 c玭g tr筺g");
	end;
	ModifyExp(nExpAward);
	Msg2Player("B筺 nh薾 頲 "..nExpAward.." 甶觤 kinh nghi謒 b錳 thng chi課 trng");
	if IB_VERSION == 0 then
		gf_GoldenExp2Exp(nGoldenExpAward);
	end;
	Msg2Player("Зy l� l莕 th� "..nGotBuChangTimes.." l莕 b錳 thng chi課 trng");
	WriteLog("[Tri謚 Ph� b錳 thng"..g_nBuChangEndDate.."]"..GetName().."th�"..nGotBuChangTimes.." (c� th� l穘h nhi襲 nh蕋 "..g_nMaxBuChangTimes.." l莕) l莕 l穘h b錳 thng chi課 trng. Ъng c蕄: "..nLevel..", lo筰 Qu﹏ C玭g Chng:"..nType..", qu﹏ h祄:"..nCurRank..", qu﹏ c玭g: "..nJunGong);
end;

function give_added_comp()
	if GetTask(TSK_NORMAL_BUCHANG) == g_nBuChangEndDate then
		Talk(1,"",g_szInfoHeader.."Ngi  nh薾 b錳 thng r錳.");
		return 0;
	end;
	local nYear,nMonth,nDay,nHour = get_date(g_nBuChangBeginDate);
	local nLevel = GetLevel();
	if nLevel < 10 then
		Talk(1,"",g_szInfoHeader.."Ъng c蕄 c馻 ngi qu� th蕄, ph秈 t n c蕄 10 m韎 c� th� nh薾 b錳 thng.");
		return 0;
	end;
	local nExpAward = 0;
	if IB_VERSION == 0 then	--如果是收费区
		nExpAward = floor((nLevel^4)/2);
	else
		nExpAward = floor((nLevel^4)/3 + GetPlayerGoldCoin()*100);
	end;
	nExpAward = gf_MinMax(nExpAward,10000,200000000);
	local nGoldenExpAward = floor((nLevel^4)/4);
	local nCurGoldenExp = GetGoldenExp();
	local selTab = {
				"Nh薾 /give_added_comp_confirm",
				"T筸 th阨 kh玭g nh薾/nothing",
				}
	local szGoldenExp = "";
	if IB_VERSION == 0 then	--如果是收费区
		szGoldenExp = "Chuy觧 <color=yellow>"..nGoldenExpAward.."<color> 甶觤 甶觤 s鴆 kh醗 (甶觤 s鴆 kh醗 hi謓 gi� c馻 ngi l� <color=yellow>"..nCurGoldenExp.."<color>),";
	end;
	Say(g_szInfoHeader.."B錳 thng l莕 n祔 ngi c� th� nh薾 <color=yellow>"..nExpAward.."<color>,"..szGoldenExp.."<color=yellow>"..g_nReputation.."<color> 甶觤 danh v鋘g v� <color=yellow>"..g_nContribute.."<color> 甶觤 c鑞g hi課 S� M玭 (c莕 v祇 m玭 ph竔). Ngi mu鑞 nh薾 b錳 thng n祔 ch�?",getn(selTab),selTab);
end;
--额外的补偿
function give_added_comp_confirm()	
	SetTask(TSK_NORMAL_BUCHANG,g_nBuChangEndDate);
	local nRoute = GetPlayerRoute();
	local nLevel = GetLevel();
	local nExpAward = 0;
	if IB_VERSION == 0 then	--如果是收费区
		nExpAward = floor((nLevel^4)/2);
	else
		nExpAward = floor((nLevel^4)/3 + GetPlayerGoldCoin()*100);
	end;
	nExpAward = gf_MinMax(nExpAward,10000,200000000);
	ModifyExp(nExpAward);
	Msg2Player("B筺 nh薾 頲 "..nExpAward.."B錳 thng 甶觤 kinh nghi謒");
	local nGoldenExpAward = floor((nLevel^4)/4);
	if IB_VERSION == 0 then	--如果是收费区
		gf_GoldenExp2Exp(nGoldenExpAward);
	end;
	ModifyReputation(g_nReputation,0);
	if nRoute ~= 0 then
		SetTask(336,GetTask(336)+g_nContribute);
		Msg2Player("B筺 nh薾 頲 "..g_nContribute.."B錳 thng 甶觤 c鑞g hi課 S� M玭");
	end;
	WriteLog("[Tri謚 Ph� b錳 thng"..g_nBuChangEndDate.."]:"..GetName().."Nh薾 b錳 thng");
end;

function nothing()

end;

function Zgc_pub_goods_add_chk(goods_num,goods_weight)
	if GetFreeItemRoom() < goods_num then
		Talk (1,"","<color=red>kho秐g tr鑞g<color> trong h祅h trang kh玭g !")
		return 0
	elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--判断玩家负重和空间
		Talk (1,"","<color=red>S鴆 l鵦<color> c馻 b筺 kh玭g !")
		return 0
	else 
		return 1
	end
end