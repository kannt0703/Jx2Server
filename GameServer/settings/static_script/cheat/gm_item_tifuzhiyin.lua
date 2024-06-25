--Ìå·þÖ¸Òý

Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task\\world\\task_head.lua")
Include("\\script\\system_switch_config.lua")

g_szTitle = "<color=green>H­íng dÉn:<color>"

function OnUse(nItem)
	if 1 ~= IsExpSvrSystemOpen() then
		return
	end
	
	local tSay = {}
	local nRoute = GetPlayerRoute();
	if nRoute <= 0 then
		tSay = {
			"Gia nhËp m«n ph¸i/JoinRoute_UpdateLevel",
		}
	else
		tSay = {
			"NhËp Code/GiftCodeNhap",
                        		"NhËn Thªm/Get_Mored",
                                               	 "NhËn danh hiÖu/Get_Danh_Hieu",
			"NhËn vµng bao/Get_VANGBAO1",
                       		 "T¨ng ®iÓm nh©n vËt/Get_Diem_Char",
			"NhËn Ên chuyÓn sinh/Get_An",
                       		 "NhËn Bé DiÖu D­¬ng +15/Get_YaoYang_15",
			"NgÉu nhiªn nhËn ®­îc Trang BÞ Kim Xµ Lv3 +15/Get_JinShe",
			format("%s/Process_Equip_LingTu", "NhËn Linh §å +10"),
			format("%s/Process_SanJianTao", "NhËn trang søc ®eo h«ng 4 sao"),
			"NhËn L­u Ph¸i Ch©n QuyÓn vµ YÕu QuyÕt/Get_Book",
                       		 "NhËn C¸c Lo¹i Nguyªn LiÖu/Get_Nguyen_Lieu",
			"NhËn 4000 vµng/Get_Money",
			"Thao t¸c bang héi/TongOperation",
			"Thao t¸c kinh m¹ch/GetJingMai",
			"Bæ sung tinh lùc/Get_Energy",
			"Kü n¨ng sèng/Life_Skill",
			"NhËn tµi liÖu c­êng hãa/Get_Enhance",
			"NhËn ®¸ quý/Get_Gem",
			"Ph¸t s¸ng vk/PS_vk",
			"NhËn r­¬ng thÇn tµi/Get_RTT1",
			"NhËn Hu©n Ch­¬ng Anh Hïng/Get_HCAH1",
			"Reset l¹i giíi h¹n giê ch¬i/Reset_Time_Playy",
			"N©ng cao ®¼ng cÊp chuyÓn sinh nh©n vËt/player_reborn",
			"Thay ®æi h­íng Phôc Sinh/change_PhucSinh",
			format("%s/Pet_OP", "Phôc sinh thó c­ng"),
			format("%s/getTiLi", "Håi phôc thÓ lùc"),
			format("%s/getTianJiaoLing", "NhËn Thiªn Kiªu LÖnh"),
		}
		if 3 == nRoute then
			tinsert(tSay, "NhËn Thiªn PhËt Ch©u vµ Ph¸ Ma Chó/Give_ZhuzhuZhouzhou")
		end
		if 6 == nRoute then
			tinsert(tSay, "NhËn ¸m KhÝ vµ C¬ Quan/Give_JiguanAnqi")
		end
		if 8 == nRoute then
			tinsert(tSay, "NhËn X¸ Lîi Kim §¬n/Give_Dandan")
		end		
		if 17 == nRoute then
			tinsert(tSay, "NhËn ChiÕn M·/Give_ZhanMa")
		end
		if 18 == nRoute then
			tinsert(tSay, "NhËn ChiÕn M· vµ Tô TiÔn/Give_Jiancu")
		end
		if 20 == nRoute then
			tinsert(tSay, "NhËn Phong Thi Phï/Give_Fengshifu")
		end
		if 21 == nRoute then
			tinsert(tSay, "NhËn Cæ/Give_GuGu")
		end
		if 30 == nRoute then
			tinsert(tSay, "NhËn §iªu/ling_nv_xiaodiao")
		end
	end
	tinsert(tSay, "Thanh lý tói/ClearBagAllItem");
	tinsert(tSay, "T¹i h¹ chØ xem qua th«i/nothing");
	Say(g_szTitle.."HÖ thèng hç trî ng­êi ch¬i? Liªn hÖ https://facebook.com/thuong.eopi ®Ó gãp ý hoÆc hç trî!", getn(tSay), tSay);
end

function PS_vk()
	local szSay = {
		g_szTitle.."H·y lùa chän hiÖu øng vò khÝ!",
		"ThiÕt Cèt/PS_1",
		"B¸ch ChiÕn/PS_2",
		"Ch­íc NhËt/PS_3",
		"TuÊn DËt/PS_4",
		"§µo Lý/PS_5",
		"Danh Tóc/PS_6",
		"L¹c Hµ/PS_7",
		"L¨ng Tiªu/PS_8",
		"PhÇn V©n/PS_9",
		"§o¹n Giao/PS_10",
		"C¸i ThÕ/PS_11",
		"Ph¸ Qu©n/PS_12",
		"Hµo m«n/PS_13",
		"Ra khái/nothing",
	};
	SelectSay(szSay);
end

function PS_1()
	BindWeaponEffect("ThiÕt Cèt",1)	
end
function PS_2()
	BindWeaponEffect("B¸ch ChiÕn",1)	
end
function PS_3()
	BindWeaponEffect("Ch­íc NhËt",1)	
end
function PS_4()
	BindWeaponEffect("TuÊn DËt",1)	
end
function PS_5()
	BindWeaponEffect("§µo Lý",1)	
end
function PS_6()
	BindWeaponEffect("Danh Tóc",1)	
end
function PS_7()
	BindWeaponEffect("L¹c Hµ",1)	
end
function PS_8()
	BindWeaponEffect("L¨ng Tiªu",1)	
end
function PS_9()
	BindWeaponEffect("PhÇn V©n",1)	
end
function PS_10()
	BindWeaponEffect("§o¹n Giao",1)	
end
function PS_11()
	BindWeaponEffect("C¸i ThÕ",1)	
end
function PS_12()
	BindWeaponEffect("Ph¸ Qu©n",1)	
end
function PS_13()
	BindWeaponEffect("Hµo m«n",1)	
end
function Get_VANGBAO1()
	                AddItem(2,1,539,1);
	                AddItem(2,1,30229,1);
	                PlaySound("\\sound\\sound_i016.wav");
	                SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end
function Get_HCAH1()
	                AddItem(2,1,30499,200);
	                PlaySound("\\sound\\sound_i016.wav");
	                SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end


function getTianJiaoLing()
	AddItem(2,97,236,100)
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end
function getTiLi()
	RestoreStamina()
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end
function Pet_OP()
	local tSay = {}
	if GetSkillLevel(30149) == 0 then
		tinsert(tSay, format("%s/activePet", "KÝch ho¹t phôc sinh thó c­ng"))
	end
	tinsert(tSay, format("%s/getPetEgg", "NhËn Trøng Thó C­ng"))
	tinsert(tSay, format("%s/getLingLi", "NhËn ®iÓm linh lùc"))
	tinsert(tSay, "T¹i h¹ chØ xem qua th«i/nothing");
	Say(g_szTitle.."Ng­¬i cÇn gióp ®ì g×? Liªn hÖ https://facebook.com/Thuong.EoPi ®Ó ®­îc hç trî thªm!!!", getn(tSay), tSay);
end

function activePet()
	local nId = 30149
	if GetSkillLevel(nId) == 0 then
		LearnSkill(nId)
		for i = 1,4 do
			LevelUpSkill(nId)
		end
		
		Msg2Player("§· häc Gi¸ng Linh ThuËt cÊp 5");
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
	end
end

function Process_SanJianTao()
   if 1 ~= gf_Judge_Room_Weight(10, 1, g_szTitle) then
		return 0;
	end
	-- kx6 hoan lÂ¨ng
        local pifeng,pIndex	=AddItem(0,154,32,1,4,-1,-1,-1,-1,-1,-1,0,15)
        FeedItem(pIndex,1000000)
		SetItemFeedUpAttrs(pIndex,random(2514,2515),random(2527,2531),random(2543,2547),random(2561,2566),random(2572,2573),random(2608,2612))
		local huizhang,hIndex	=AddItem(0,153,32,1,4,-1,-1,-1,-1,-1,-1,0,15)
		FeedItem(hIndex,1000000)
		SetItemFeedUpAttrs(hIndex,random(2514,2515),random(2527,2531),random(2543,2547),random(2561,2566),random(2572,2573),random(2583,2585))
		local xie,xIndex	=AddItem(0,152,32,1,4,-1,-1,-1,-1,-1,-1,0,15)
		FeedItem(xIndex,1000000)
		SetItemFeedUpAttrs(xIndex,random(2514,2515),random(2527,2531),random(2543,2547),random(2561,2566),random(2572,2573),random(2583,2586))
	-- end kx6 hoan lÂ¨ng
	
	 -- kx6 Â®Â»ng giao
	    local pifeng,pIndex	=AddItem(0,154,33,1,4,-1,-1,-1,-1,-1,-1,0,15)
        FeedItem(pIndex,1000000)
		SetItemFeedUpAttrs(pIndex,random(2618,2619),random(2631,2635),random(2647,2651),random(2665,2670),random(2678,2680),random(2703,2706))
		local huizhang,hIndex	=AddItem(0,153,33,1,4,-1,-1,-1,-1,-1,-1,0,15)
		FeedItem(hIndex,1000000)
		SetItemFeedUpAttrs(hIndex,random(2618,2619),random(2631,2635),random(2647,2651),random(2665,2670),random(2678,2680),random(2690,2693))
		local xie,xIndex	=AddItem(0,152,33,1,4,-1,-1,-1,-1,-1,-1,0,15)
		FeedItem(xIndex,1000000)
		SetItemFeedUpAttrs(xIndex,random(2618,2619),random(2631,2635),random(2647,2651),random(2665,2670),random(2678,2680),random(2690,2693))

	-- end kx6 Â®Â»ng giao	

	  -- kx6 khÃ«i phÂ­Ã®ng
		local pifeng,pIndex	=AddItem(0,154,34,1,4,-1,-1,-1,-1,-1,-1,0,15)
        FeedItem(pIndex,1000000)
		SetItemFeedUpAttrs(pIndex,random(2712,2713),random(2725,2729),random(2741,2745),random(2759,2764),random(2772,2774),random(2799,2803))
		local huizhang,hIndex	=AddItem(0,153,34,1,4,-1,-1,-1,-1,-1,-1,0,15)
		FeedItem(hIndex,1000000)
		SetItemFeedUpAttrs(hIndex,random(2712,2713),random(2725,2729),random(2741,2745),random(2759,2764),random(2772,2774),random(2784,2787))
		local xie,xIndex	=AddItem(0,152,34,1,4,-1,-1,-1,-1,-1,-1,0,15)
		FeedItem(xIndex,1000000)
		SetItemFeedUpAttrs(xIndex,random(2712,2713),random(2725,2729),random(2741,2745),random(2759,2764),random(2772,2774),random(2784,2787))
	-- end kx6 khÃ«i phÂ­Ã®ng	
end
function GiftCodeNhap()
	AskClientForString("CODECHECK1","",1,9999,"NhËp GiftCode")
end;
function CODECHECK1(nVar)
	local danhan = GetTask(3005)
	if nVar == 'loliteam' and danhan == 0 then
	Msg2Player("§¹i hiÖp nhËn ®­îc 10 c©y b¸t nh· lín")
	Msg2Player("§¹i hiÖp nhËn ®­îc 10 c©y b¸t nh· lín")
	Msg2Player("§¹i hiÖp nhËn ®îc 2 tói h¹t gièng")
	Msg2Player("§¹i hiÖp nhËn ®îc 5 vÐ TiÓu Y Vµng")
	if gf_Judge_Room_Weight(28, 100, " ") ~= 1 then
		return 0;
	end
	AddItem(2,0,398,10,4)
	AddItem(2,0,504,10,4)
	AddItem(2,1,30087,2,4)
	AddItem(2,1,30491,5,4)
	SetTask(3005,1)
	elseif  danhan == 1 then
	Talk(1,"","B¹n ®· nhËn GiftCode nµy råi. Vui lßng kh«ng nhËn l¹i")
	else
	Talk(1,"","B¹n ®· nhËn GiftCode nµy råi hoÆc GiftCode kh«ng tån t¹i trªn hÖ thèng")
	end
end;

function getPetEgg()
	AddItem(2,1,30728,100)
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function getLingLi()
	local nAdd = 10000
	local nTask = 1535
	local nCur = GetTask(nTask) / 100
	if nCur < 1000000 then
		nCur = nCur + nAdd
		SetTask(nTask, nCur*100)
		Msg2Player(format("NhËn thµnh c«ng %d linh lùc", nAdd))
	end
end
function Get_RTT1()
	                AddItem(2,1,30344,10);
	                PlaySound("\\sound\\sound_i016.wav");
	                SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function Process_Equip_LingTu()
    if 1 ~= gf_Judge_Room_Weight(10, 1, g_szTitle) then
				return 0;
		end
		for i=30221,30222 do 
			AddItem(0,102,i,1,1,-1,-1,-1,-1,-1,-1,1)
		end
		local nRoute	= GetPlayerRoute();
		local nBody 	= GetBody();
		if nRoute == 2 then
            AddItem(0,3,30207,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nRoute == 3 then
            AddItem(0,8,30208,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nRoute == 4 then
            AddItem(0,0,30209,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nRoute == 6 then
            AddItem(0,1,30210,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nRoute == 8 then
            AddItem(0,2,30211,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nRoute == 9 then
            AddItem(0,10,30212,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nRoute == 11 then
            AddItem(0,0,30213,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nRoute == 12 then
            AddItem(0,5,30214,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nRoute == 14 then
            AddItem(0,2,30215,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nRoute == 15 then
            AddItem(0,9,30216,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nRoute == 17 then
            AddItem(0,6,30217,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nRoute == 18 then
            AddItem(0,4,30218,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nRoute == 20 then
            AddItem(0,7,30219,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nRoute == 21 then
            AddItem(0,11,30220,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nRoute == 23 then
            AddItem(0,2,30221,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nRoute == 29 then
            AddItem(0,13,30222,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nRoute == 30 then
            AddItem(0,12,30223,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nBody == 1 then
			AddItem(0,101,30235,1,1,-1,-1,-1,-1,-1,-1,-1,10)
			AddItem(0,101,30239,1,1,-1,-1,-1,-1,-1,-1,-1,10)
			AddItem(0,101,30243,1,1,-1,-1,-1,-1,-1,-1,-1,10)
			AddItem(0,100,30235,1,1,-1,-1,-1,-1,-1,-1,-1,10)
			AddItem(0,103,30235,1,1,-1,-1,-1,-1,-1,-1,-1,10)
		end
		if nBody == 2 then
			AddItem(0,101,30236,1,1,-1,-1,-1,-1,-1,-1,-1,10)
			AddItem(0,101,30240,1,1,-1,-1,-1,-1,-1,-1,-1,10)
			AddItem(0,101,30244,1,1,-1,-1,-1,-1,-1,-1,-1,10)
			AddItem(0,100,30236,1,1,-1,-1,-1,-1,-1,-1,-1,10)
			AddItem(0,103,30236,1,1,-1,-1,-1,-1,-1,-1,-1,10)
		end
		if nBody == 3 then
			AddItem(0,101,30237,1,1,-1,-1,-1,-1,-1,-1,-1,10)
			AddItem(0,101,30241,1,1,-1,-1,-1,-1,-1,-1,-1,10)
			AddItem(0,101,30245,1,1,-1,-1,-1,-1,-1,-1,-1,10)
			AddItem(0,100,30237,1,1,-1,-1,-1,-1,-1,-1,-1,10)
			AddItem(0,103,30237,1,1,-1,-1,-1,-1,-1,-1,-1,10)
		end
		if nBody == 4 then
			AddItem(0,101,30238,1,1,-1,-1,-1,-1,-1,-1,-1,10)
			AddItem(0,101,30242,1,1,-1,-1,-1,-1,-1,-1,-1,10)
			AddItem(0,101,30246,1,1,-1,-1,-1,-1,-1,-1,-1,10)
			AddItem(0,100,30238,1,1,-1,-1,-1,-1,-1,-1,-1,10)
			AddItem(0,103,30238,1,1,-1,-1,-1,-1,-1,-1,-1,10)
		end
end

function JoinRoute_UpdateLevel()
	if GetPlayerFaction() ~= 0 then
		Talk(1,"",format("Ng­¬i ®· gia nhËp m«n ph¸i råi, ta kh«ng thÓ gióp ®­îc g×."));
		return 0;
	end
	local tMenu = {
		"ThiÕu L©m/join_sl",
		"Vâ §ang/join_wd",
		"Nga My/join_em",
		"C¸i Bang/join_gb",
		"§­êng M«n/join_tm",
		"D­¬ng M«n/join_ym",
		"Ngò §éc/join_wdu",
		"C«n L«n/join_kl",
		"Thóy Yªn/join_cy",
		"Minh Giao/join_mg",
		"Ra khái/nothing",
	};
	Say("Ng­¬i muèn gia nhËp l­u ph¸i g×?", getn(tMenu), tMenu);
end

--------------------------------------------------Ñ¡ÔñÃÅÅÉ¿ªÊ¼--------------------------------------
function join_sl()
	if GetSex() == 2 then
		Say(g_szTitle.."Ph¸i ThiÕu L©m chØ thu nhËn ®Ö tö nam", 0);
		return
	end

	if GetPlayerFaction() ~= 0 then
		return
	end;

	local szSay = {
		g_szTitle.."Ng­¬i muèn gia nhËp l­u ph¸i g×?",
		"ThiÕu L©m vâ t«ng (QuyÒn)/#enter_mp(4)",
		"ThiÕu L©m thiÒn t«ng (Tr­îng)/#enter_mp(3)",
		"ThiÕu L©m tôc gia (§ao)/#enter_mp(2)",
		"Ra khái/nothing",
	};

	SelectSay(szSay);
end;

function join_mg()
	--if GetSex() == 2 then
	--	Say(g_szTitle.."Ph¸i ThiÕu L©m chØ thu nhËn ®Ö tö nam", 0);
	--	return
	--end

	--if GetPlayerFaction() ~= 0 then
	--	return
	--end;

	local szSay = {
		g_szTitle.."Ng­¬i muèn gia nhËp l­u ph¸i g×?",
		"minh giao but/#enter_mp(26)",
		"minh giao dao/#enter_mp(25)",
		"minh giao chao/#enter_mp(27)",
		"Ra khái/nothing",
	};

	SelectSay(szSay);
end;

function join_wd()
	if GetPlayerFaction() ~= 0 then
		return
	end;

	local szSay = {
		g_szTitle.."Ng­¬i muèn gia nhËp l­u ph¸i g×?",
		"Vâ §ang ®¹o gia (KiÕm)/#enter_mp(14)",
		"Vâ §ang tôc gia (Bót)/#enter_mp(15)",
		"Ra khái/nothing",
	};

	SelectSay(szSay);
end;

function join_em()
	if GetSex() == 1 then
		Say(g_szTitle.."Nga My kh«ng nhËn ®Ö tö nam", 0);
		return
	end

	if GetPlayerFaction() ~= 0 then
		return
	end

	local szSay = {
		g_szTitle.."Ng­¬i muèn gia nhËp l­u ph¸i g×?",
		"Nga My phËt gia (KiÕm)/#enter_mp(8)",
		"Nga My tôc gia (CÇm)/#enter_mp(9)",
		"Ra khái/nothing",
	};

	SelectSay(szSay);
end;

function join_gb()
	if GetPlayerFaction() ~= 0 then
		return
	end;

	local szSay = {
		g_szTitle.."Ng­¬i muèn gia nhËp l­u ph¸i g×?",
		"C¸i Bang TÜnh y (QuyÒn)/#enter_mp(11)",
		"C¸i Bang ¤ Y (Bæng)/#enter_mp(12)",
		"Ra khái/nothing",
	};
	SelectSay(szSay);
end;

function join_tm()
	if GetPlayerFaction() ~= 0 then
		return
	end;

	local szSay = {
		g_szTitle.."Ng­¬i muèn gia nhËp l­u ph¸i g×?",
		"§­êng M«n/#enter_mp(6)",
		"Ra khái/nothing",
	};
	SelectSay(szSay);
end;

function join_ym()
	if GetPlayerFaction() ~= 0 then
		return
	end;

	local szSay = {
		g_szTitle.."Ng­¬i muèn gia nhËp l­u ph¸i g×?",
		"D­¬ng M«n Th­¬ng Kþ/#enter_mp(17)",
		"D­¬ng M«n Cung Kþ/#enter_mp(18)",
		"Ra khái/nothing",
	};
	SelectSay(szSay);
end;

function join_wdu()
	if GetPlayerFaction() ~= 0 then
		return
	end;

	local szSay = {
		g_szTitle.."Ng­¬i muèn gia nhËp l­u ph¸i g×?",
		"HiÖp §éc (Song §ao)/#enter_mp(20)",
		"Tµ §éc Cæ S­ (Tr¶o)/#enter_mp(21)",
		"Ra khái/nothing",
	};
	SelectSay(szSay);
end;

function join_kl()
	if GetSex()==2 then
		Talk(1,"","C«n L«n kh«ng thu nhËn ®Ö tö n÷!");
		return 0
	end

	if GetPlayerFaction() ~= 0 then
		return
	end;

	local szSay = {
		g_szTitle.."Ng­¬i muèn gia nhËp l­u ph¸i g×?",
		"C«n L«n Thiªn S­/#enter_mp(23)",
		"Ra khái/nothing",
	};
	SelectSay(szSay);
end;

function join_cy()
	if GetSex()==1 then
		Talk(1,"","Thóy Yªn kh«ng thu nhËn ®Ö tö nam!");
		return 0
	end

	if GetPlayerFaction() ~= 0 then
		return
	end;

	local szSay = {
		g_szTitle.."Ng­¬i muèn gia nhËp l­u ph¸i g×?",
		"Thóy Yªn Vò Tiªn (Qu¹t)/#enter_mp(29)",
		"Thóy Yªn Linh N÷ (Tiªu)/#enter_mp(30)",
		"Ra khái/nothing",
	};
	SelectSay(szSay);
end;

-----------------------------------------ÈëÃÅÅÉ----------------------------------------
function enter_mp(nRoute)
	local nBegin = 0;
	local nEnd = 0;
	local nBody = GetBody(); --1=Õý³£ÄÐ£¬2=¿ýÎµÄÐ£¬3=ÐÔ¸ÐÅ®£¬4=½¿Ð¡Å®

	SetPlayerRoute(nRoute);						--ÉèÖÃÁ÷ÅÉ

	if nRoute == 2 then						--ÉÙÁÖË×¼Ò
		LearnSkill(3);
		LearnSkill(5);
		LearnSkill(32);
		nBegin = 21;
		nEnd = 31;
	elseif nRoute == 3 then					--ÉÙÁÖìøÉ®
		LearnSkill(6);
		LearnSkill(57);
		nBegin = 45;
		nEnd = 56;
	elseif nRoute == 4 then					--ÉÙÁÖÎäÉ®
		LearnSkill(2);
		LearnSkill(44);
		nBegin = 33;
		nEnd = 43;
	elseif nRoute == 14 then					--Îäµ±µÀ¼Ò
		LearnSkill(4);
		LearnSkill(146);
		nBegin = 125;
		nEnd = 145;
	elseif nRoute == 15 then					--Îäµ±Ë×¼Ò
		LearnSkill(5);
		LearnSkill(159);
		nBegin = 147;
		nEnd = 158;
	elseif nRoute == 8 then					--¶ëáÒ·ð¼Ò
		LearnSkill(4);
		LearnSkill(89);
		nBegin = 75
		nEnd = 88;
	elseif nRoute == 9 then					--¶ëáÒË×¼Ò
		LearnSkill(10);
		LearnSkill(102);
		nBegin = 90
		nEnd = 101;
	elseif nRoute == 11 then					--Ø¤°ï¾»Ò¢
		LearnSkill(2);
		LearnSkill(113);
		nBegin = 103
		nEnd = 112;
	elseif nRoute == 12 then					--Ø¤°ïÎÛÒ¢
		LearnSkill(5);
		LearnSkill(124);
		nBegin = 114
		nEnd = 123;
	elseif nRoute == 6 then					--ÌÆÃÅ
		LearnSkill(7);
		LearnSkill(74);
		nBegin = 58
		nEnd = 73;
	elseif nRoute == 17 then					--ÑîÃÅÇ¹Æï
		LearnSkill(11);
		LearnSkill(732);
		nBegin = 720;
		nEnd = 731;
	elseif nRoute == 18 then					--ÑîÃÅ¹­Æï
		LearnSkill(12);
		LearnSkill(745);
		nBegin = 733;
		nEnd = 744;
	elseif nRoute == 20 then					--Îå¶¾Ð°ÏÀ
		LearnSkill(13);
		LearnSkill(775);
		nBegin = 364;
		nEnd = 377;
	elseif nRoute == 21 then					--Îå¶¾¹ÆÊ¦
		LearnSkill(14);
		LearnSkill(774);
		nBegin = 347;
		nEnd = 363;
	elseif nRoute == 23 then					--À¥¢ØÌìÊ¦
		LearnSkill(4);
		LearnSkill(1032);
		nBegin = 1017 ;
		nEnd = 1031;
	elseif nRoute == 25 then					--Ã÷½ÌÊ¥Õ½
		LearnSkill(3);
		LearnSkill(1066);
		nBegin = 1053 ;
		nEnd = 1065;
	elseif nRoute == 26 then					--Ã÷½ÌÕó±ø
		LearnSkill(8);
		LearnSkill(1096);
		nBegin = 1083 ;
		nEnd = 1095;
	elseif nRoute == 27 then					--Ã÷½ÌÑªÈË
		LearnSkill(14);
		LearnSkill(1213);
		nBegin = 1131 ;
		nEnd = 1143;
	elseif nRoute == 29 then					--´äÑÌÎèÏÉ
		LearnSkill(15);
		LearnSkill(1196);
		nBegin = 1165 ;
		nEnd = 1176;
	elseif nRoute == 30 then					--´äÑÌÁéÅ®
		LearnSkill(16);
		LearnSkill(1230);
		nBegin = 1217 ;
		nEnd = 1229;
	else
		return
	end;

	LearnSkill(20);

	for i = nBegin, nEnd do
		LearnSkill(i);
		while LevelUpSkill(i) == 1 do
		end
	end;

	----------------------------ÉèÖÃÊýÖµ------------
	SetTask(336, 20000);				--ÉèÖÃÊ¦ÃÅ¹±Ï×¶È
	ModifyReputation(2000, 0);			--ÉèÖÃÉùÍû
	PlayerReborn(1, random(4));			--6×ª
	gf_SetTaskByte(1538, 1, 5) 			--5×ª
	SetLevel(99, 1);								--ÉèÖÃµÈ¼¶
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),913,0,0)
	Msg2Player("Thao t¸c thµnh c«ng, h·y ®¨ng nhËp l¹i")
	AddItem(0,105,15,1,1,-1,-1,-1,-1,-1,-1);
	AddItem(2, 1, 1005, 1);
	AddItem(0, 200,40, 1);
	AddItem(2, 1, 1003, 1);
	AddItem(2, 1, 1004, 1);
	SaveNow()
	Talk(1,"","Thao t¸c thµnh c«ng, h·y ®¨ng nhËp l¹i")
end

function Get_YaoYang_15()
	if 1 ~= gf_Judge_Room_Weight(10, 1, g_szTitle) then
				return 0;
		end
		for i=3190,3194 do
				AddItem(0,102,i,1,1,-1,-1,-1,-1,-1,-1)
		end
		local nRoute	= GetPlayerRoute();
		local nBody 	= GetBody();
		local nLevel  = 15;
		if nRoute == 2 and nBody ==1 then 
				AddItem(0,100,3128,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3128,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3128,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,3,8992,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 2 and nBody ==2 then 
				AddItem(0,100,3129,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3129,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3129,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,3,8992,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 3 and nBody ==1 then 
				AddItem(0,100,3132,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3132,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3132,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,8,8994,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 3 and nBody ==2 then 
				AddItem(0,100,3133,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3133,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3133,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,8,8994,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 4 and nBody ==1 then 
				AddItem(0,100,3130,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3130,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3130,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,0,8993,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 4 and nBody ==2 then 
				AddItem(0,100,3131,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3131,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3131,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,0,8993,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 6 and nBody ==1 then 
				AddItem(0,100,3134,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3134,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3134,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,1,8995,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 6 and nBody ==2 then 
				AddItem(0,100,3135,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3135,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3135,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,1,8995,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 6 and nBody ==3 then 
				AddItem(0,100,3136,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3136,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3136,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,1,8995,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 6 and nBody ==4 then 
				AddItem(0,100,3137,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3137,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3137,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,1,8995,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 8 and nBody ==3 then 
				AddItem(0,100,3138,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3138,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3138,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,2,8996,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 8 and nBody ==4 then 
				AddItem(0,100,3139,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3139,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3139,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,2,8996,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end

		if nRoute == 9 and nBody ==3 then 
				AddItem(0,100,3140,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3140,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3140,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,10,8997,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 9 and nBody ==4 then 
				AddItem(0,100,3141,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3141,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3141,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,10,8997,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 11 and nBody ==1 then 
				AddItem(0,100,3142,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3142,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3142,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,0,8998,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		if nRoute == 11 and nBody ==2 then 
				AddItem(0,100,3143,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3143,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3143,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,0,8998,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 11 and nBody ==3 then 
				AddItem(0,100,3144,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3144,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3144,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,0,8998,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		if nRoute == 11 and nBody ==4 then 
				AddItem(0,100,3145,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3145,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3145,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,0,8998,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end

		if nRoute == 12 and nBody ==1 then 
				AddItem(0,100,3146,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3146,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3146,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,5,8999,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		if nRoute == 12 and nBody ==2 then 
				AddItem(0,100,3147,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3147,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3147,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,5,8999,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 12 and nBody ==3 then 
				AddItem(0,100,3148,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3148,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3148,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,5,8999,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		if nRoute == 12 and nBody ==4 then 
				AddItem(0,100,3149,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3149,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3149,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,5,8999,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 14 and nBody ==1 then 
				AddItem(0,100,3150,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3150,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3150,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,2,9000,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		if nRoute == 14 and nBody ==2 then 
				AddItem(0,100,3151,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3151,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3151,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,2,9000,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 14 and nBody ==3 then 
				AddItem(0,100,3152,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3152,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3152,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,2,9000,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		if nRoute == 14 and nBody ==4 then 
				AddItem(0,100,3153,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3153,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3153,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,2,9000,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 15 and nBody ==1 then 
				AddItem(0,100,3154,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3154,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3154,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,9,9001,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		if nRoute == 15 and nBody ==2 then 
				AddItem(0,100,3155,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3155,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3155,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,9,9001,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 15 and nBody ==3 then 
				AddItem(0,100,3156,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3156,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3156,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,9,9001,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		if nRoute == 15 and nBody ==4 then 
				AddItem(0,100,3157,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3157,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3157,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,9,9001,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 17 and nBody ==1 then 
				AddItem(0,100,3158,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3158,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3158,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,6,9002,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		if nRoute == 17 and nBody ==2 then 
				AddItem(0,100,3159,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3159,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3159,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,6,9002,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 17 and nBody ==3 then 
				AddItem(0,100,3160,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3160,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3160,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,6,9002,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		if nRoute == 17 and nBody ==4 then 
				AddItem(0,100,3161,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3161,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3161,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,6,9002,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end

		if nRoute == 18 and nBody ==1 then 
				AddItem(0,100,3162,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3162,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3162,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,4,9003,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		if nRoute == 18 and nBody ==2 then 
				AddItem(0,100,3163,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3163,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3163,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,4,9003,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 18 and nBody ==3 then 
				AddItem(0,100,3164,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3164,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3164,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,4,9003,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		if nRoute == 18 and nBody ==4 then 
				AddItem(0,100,3165,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3165,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3165,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,4,9003,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end

		if nRoute == 20 and nBody ==1 then 
				AddItem(0,100,3166,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3166,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3166,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,7,9004,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		if nRoute == 20 and nBody ==2 then 
				AddItem(0,100,3167,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3167,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3167,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,7,9004,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 20 and nBody ==3 then 
				AddItem(0,100,3168,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3168,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3168,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,7,9004,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		if nRoute == 20 and nBody ==4 then 
				AddItem(0,100,3169,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3169,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3169,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,7,9004,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 21 and nBody ==1 then 
				AddItem(0,100,3170,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3170,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3170,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,11,9005,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		if nRoute == 21 and nBody ==2 then 
				AddItem(0,100,3171,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3171,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3171,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,11,9005,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 21 and nBody ==3 then 
				AddItem(0,100,3172,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3172,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3172,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,11,9005,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		if nRoute == 21 and nBody ==4 then 
				AddItem(0,100,3173,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3173,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3173,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,11,9005,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 23 and nBody ==1 then 
				AddItem(0,100,3174,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				AddItem(0,101,3174,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				AddItem(0,103,3174,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				AddItem(0,2,9006,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
		end
		if nRoute == 23 and nBody ==2 then 
				AddItem(0,100,3175,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				AddItem(0,101,3175,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				AddItem(0,103,3175,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				AddItem(0,2,9006,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
		end
		
		if nRoute == 29 and nBody ==3 then 
				AddItem(0,100,3188,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				AddItem(0,101,3188,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				AddItem(0,103,3188,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				AddItem(0,13,9010,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
		end
		if nRoute == 29 and nBody ==4 then 
				AddItem(0,100,3189,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				AddItem(0,101,3189,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				AddItem(0,103,3189,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				AddItem(0,13,9010,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
		end
		if nRoute == 30 and nBody ==3 then 
				AddItem(0,100,3190,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				AddItem(0,101,3190,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				AddItem(0,103,3190,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				AddItem(0,12,9011,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
		end
		if nRoute == 30 and nBody ==4 then 
				AddItem(0,100,3191,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				AddItem(0,101,3191,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				AddItem(0,103,3191,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				AddItem(0,12,9011,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
		end
end

function Get_JinShe()
		if 1 ~= gf_Judge_Room_Weight(10, 1, g_szTitle) then
				return 0;
		end
		local nRoute	= GetPlayerRoute();
		local nBody 	= GetBody();
		local nLevel  = 15;
		if nRoute == 2 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,186,164,182,759,771,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,186,164,182,759,771,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,186,164,182,759,771,1004)
				FeedItem(xIndex,1000000)
		end
		
		if nRoute == 3 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,165,182,759,771,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,165,182,759,771,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,165,182,759,771,1004)
				FeedItem(xIndex,1000000)
		end
		
		if nRoute == 4 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,165,182,759,771,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,165,182,759,771,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,165,182,759,771,1004)
				FeedItem(xIndex,1000000)
		end
		
		
		if nRoute == 6 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,162,178,757,754,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,162,178,757,754,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,162,178,757,754,1004)
				FeedItem(xIndex,1000000)
		end
		
		if nRoute == 8 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,165,182,759,771,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,165,182,759,771,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,165,182,759,771,1004)
				FeedItem(xIndex,1000000)
		end
		

		if nRoute == 9 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,165,182,759,771,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,165,182,759,771,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,165,182,759,771,1004)
				FeedItem(xIndex,1000000)
		end

		if nRoute == 11 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,183,181,757,770,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,183,181,757,770,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,183,181,757,770,1004)
				FeedItem(xIndex,1000000)
		end

		if nRoute == 12 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,163,178,758,754,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,163,178,758,754,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,163,178,758,754,1004)
				FeedItem(xIndex,1000000)
		end
		
		if nRoute == 14 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,165,182,759,771,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,165,182,759,771,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,165,182,759,771,1004)
				FeedItem(xIndex,1000000)
		end
		
		if nRoute == 15 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,164,178,760,754,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,164,178,760,754,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,164,178,760,754,1004)
				FeedItem(xIndex,1000000)
		end
		
		if nRoute == 17 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,183,181,757,770,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,183,181,757,770,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,183,181,757,770,1004)
				FeedItem(xIndex,1000000)
		end

		if nRoute == 18 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,162,178,757,754,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,162,178,757,754,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,162,178,757,754,1004)
				FeedItem(xIndex,1000000)
		end

		if nRoute == 20 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,163,179,758,755,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,163,179,758,755,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,163,179,758,755,1004)
				FeedItem(xIndex,1000000)
		end
		
		if nRoute == 21 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,165,180,760,756,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,165,180,760,756,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,165,180,760,756,1004)
				FeedItem(xIndex,1000000)
		end
		
		if nRoute == 23 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,165,182,759,771,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,165,182,759,771,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,165,182,759,771,1004)
				FeedItem(xIndex,1000000)
		end
		
		if nRoute == 29 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,162,178,757,754,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,162,178,757,754,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,162,178,757,754,1004)
				FeedItem(xIndex,1000000)
		end

		if nRoute == 30	then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,164,178,760,754,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,164,178,760,754,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,164,178,760,754,1004)
				FeedItem(xIndex,1000000)
		end
	
end

function Get_Book()
	local szSay = {
		g_szTitle.."NhËn L­u Ph¸i Ch©n QuyÓn vµ QuyÕt YÕu!",
		"NhËn Ch©n QuyÓn/Get_Book_ZhenJuan",
		"NhËn QuyÕt YÕu/Get_Book_JueYao",
		"Th¨ng cÊp mËt tÞch ®· trang bÞ/Get_Book_Update",
		"T¨ng phÇn tr¨m chØ sè mËt tÞch/Get_Buff_Update",
		"Ra khái/nothing",
	};
	SelectSay(szSay);
end

function Get_Nguyen_Lieu()
	local szSay = {
		g_szTitle.."NhËn C¸c Lo¹i VËt LiÖu!",
		"NhËn 100 Thiªn M«n Kim LÖnh/Get_NL_TMKL",
		"NhËn 100 Thiªn Cang LÖnh/Get_NL_TCL",
		"NhËn 1000 Ma Tinh/Get_NL_MT",
		"Ra khái/nothing",
	};
	SelectSay(szSay);
end

function Get_NL_TMKL()
	AddItem(2,1,30370,100)
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function Get_NL_TCL()
	AddItem(2,95,204,100)
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function Get_NL_MT()
	AddItem(2,1,30497,1000)
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function Get_Book_ZhenJuan()
	if gf_Judge_Room_Weight(7, 1, g_szTitle) ~= 1 then
		return 0;
	end

	local nRoute	= GetPlayerRoute();
	
	if nRoute == 2 then
		AddItem(0, 107, 204,5)
		AddItem(0, 107, 204-38,5)
	end
	
		if nRoute == 3 then
		AddItem(0, 107, 206,5)
		AddItem(0, 107, 206-38,5)
	end
	
		if nRoute == 4 then
		AddItem(0, 107, 205,5)
		AddItem(0, 107, 205-38,5)
	end
	
		if nRoute == 6 then
		AddItem(0, 107, 207,5)
		AddItem(0, 107, 207-38,5)
	end
	
		if nRoute == 8 then
		AddItem(0, 107, 208,5)
		AddItem(0, 107, 208-38,5)
	end
	
		if nRoute == 9 then
		AddItem(0, 107, 209,5)
		AddItem(0, 107, 209-38,5)
	end
	
		if nRoute == 11 then
		AddItem(0, 107, 210,5)
		AddItem(0, 107, 210-38,5)
	end
	
		if nRoute == 12 then
		AddItem(0, 107, 211,5)
		AddItem(0, 107, 211-38,5)
	end
	
		if nRoute == 14 then
		AddItem(0, 107, 212,5)
		AddItem(0, 107, 212-38,5)
	end
	
		if nRoute == 15 then
		AddItem(0, 107, 213,5)
		AddItem(0, 107, 213-38,5)
	end
	
		if nRoute == 17 then
		AddItem(0, 107, 214,5)
		AddItem(0, 107, 214-38,5)
	end
	
		if nRoute == 18 then
		AddItem(0, 107, 215,5)
		AddItem(0, 107, 215-38,5)
	end
	
		if nRoute == 20 then
		AddItem(0, 107, 216,5)
		AddItem(0, 107, 216-38,5)
	end
	
			if nRoute == 21 then
		AddItem(0, 107, 217,5)
		AddItem(0, 107, 217-38,5)
	end
	
	if nRoute == 23 then--À¥¢ØÌìÊ¦
		AddItem(0, 107, 218,5)
		AddItem(0, 107, 218-20,5)
	end
	
	if nRoute == 29 then--ÎèÏÉ
		AddItem(0, 107, 222,5)
	  AddItem(0, 107, 222-20,5)
	end
	
	if nRoute == 30 then--ÁéÅ®
		AddItem(0, 107, 223,5)
		AddItem(0, 107, 223-20,5)
	end
	gf_AddItemEx({0, 112, 158,	1, 4}, "L¨ng Ba Vi Bé tt");
	
	gf_AddItemEx({0, 112, 224,	1, 4}, "L¨ng Ba Vi Bé");
end

function Get_Book_JueYao()
	local tJue ={
		[2]		={1,10},
		[3]		={21,31},
		[4]		={11,20},
		[6]		={32,46},
		[8]		={47,59},
		[9]		={60,70},
		[11]	={71,79},
		[12]	={80,88},
		[14]	={89,108},
		[15]	={109,119},
		[17]	={120,130},
		[18]	={131,141},
		[20]	={142,154},
		[21]	={155,168},
		[23]	={169,182},
		[25]	={183,194},
		[26]	={195,206},
		[27]	={207,218},
		[29]	={219,229},
		[30]	={230,240},
	};

	local nRoute = GetPlayerRoute()
	if 1 ~= gf_CheckPlayerRoute() then
		return 0;
	end

	if 1 ~= gf_Judge_Room_Weight((tJue[nRoute][2] - tJue[nRoute][1] + 1), 1, g_szTitle) then
		return 0;
	end

	for i = tJue[nRoute][1],tJue[nRoute][2] do
		gf_AddItemEx({2, 6, i, 1, 4}, "QuyÕt YÕu");
	end
end

function Get_Book_Update()
	for i=1,100 do LevelUpBook() end
	for i=1,100 do LevelUpBook(1) end
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function Get_Buff_Update()
	CastState("state_add_book_attribute_value",1000,-1,-1)
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function Get_Money()
	if GetCash() < 40000000 then
		Earn(40000000 - GetCash());
	end
end

function Give_ZhuzhuZhouzhou()
	if gf_Judge_Room_Weight(2, 1) ~= 1 then
		return 0;
	end

	AddItem(2, 3, 4, 99);
	AddItem(2, 3, 12, 99);	
end

function Give_JiguanAnqi()
	if gf_Judge_Room_Weight(11, 1) ~= 1 then
		return 0;
	end
  for i = 1,9 do
		AddItem(2, 11, i, 2000, 4);
	end
	AddItem(2, 3, 6, 999, 4);	
end

function Give_Dandan()
	if gf_Judge_Room_Weight(1, 1) ~= 1 then
		return 0;
	end
	AddItem(2, 3, 7, 999);
end

function Give_ZhanMa()
	if gf_Judge_Room_Weight(1, 10) ~= 1 then
		return 0;
	end
	AddItem(0,105,38,1,1,7,14524,7,14524,7,14517);
end

function Give_Jiancu()
	if gf_Judge_Room_Weight(2, 100) ~= 1 then
		return 0;
	end
	AddItem(2, 15, 10, 2000);
	AddItem(0,105,38,1,1,7,14524,7,14524,7,14517);
end

function Give_Fengshifu()
	if gf_Judge_Room_Weight(5, 1) ~= 1 then
		return 0;
	end

	AddItem(1, 6, 34,	30, 4);
	AddItem(1, 6, 46, 30, 4);
	AddItem(1, 6, 84,	30, 4);
	AddItem(1, 6, 153,30, 4);
	AddItem(1, 6, 154,30, 4);
end

function Give_GuGu()
	if gf_Judge_Room_Weight(32, 1) ~= 1 then
		return 0;
	end
  for i = 1,31 do
		AddItem(2, 17, i, 99, 4);
	end

	if 0 >= GetItemCount(2, 0, 1063) and 1 == gf_Judge_Room_Weight(1, 1) then
		AddItem(2, 0, 1063, 1);
	end
end

function ling_nv_xiaodiao()
	local szSay = {};
	szSay[getn(szSay) + 1] = "NhËn TiÓu §iªu/Give_XiaoDiao";
	szSay[getn(szSay) + 1] = "Nu«i TiÓu §iªu/Give_XiaoDiaoFood";
	szSay[getn(szSay) + 1] = "HuÊn luyÖn TiÓu §iªu/Feed_XiaoDiao";
	szSay[getn(szSay) + 1] = "Ra khái/nothing";
	Say(g_szTitle.."TiÓu §iªu thao t¸c.", getn(szSay), szSay)
end


function Give_XiaoDiao()
	if gf_Judge_Room_Weight(1, 1) ~= 1 then
		return 0;
	end
	AddItem(2, 20, random(1, 5), 1, 4);
end

function Give_XiaoDiaoFood()
	if gf_Judge_Room_Weight(11, 1) ~= 1 then
		return 0;
	end

	for i = 6, 12 do
		if i == 11 then
			AddItem(2, 97, i, 1, 4);
		else
			AddItem(2, 97, i, 100, 4);
		end
	end
end

function Feed_XiaoDiao()
	local nPetItemIndex = GetPlayerEquipIndex(12);
	if (nPetItemIndex == nil or nPetItemIndex <=0) then
		Msg2Player("C¸c h¹ ch­a cã thó c­ng, kh«ng thÓ tiÕn hµnh huÊn luyÖn!");
		return
	end;
	local ItemGen, ItemDetail, ItemParticular = GetItemInfoByIndex(nPetItemIndex);
	if (ItemGen == nil or ItemDetail == nil or ItemParticular == nil)
		or (ItemGen ~= 2 or ItemDetail ~= 20)
	then
		Msg2Player("C¸c h¹ ch­a cã thó c­ng, kh«ng thÓ tiÕn hµnh huÊn luyÖn!");
		return
	end

	for i = 1, 84 do
		LevelUpPet(nPetItemIndex)
	end
end

function ClearBagAllItem(bTag)
	if not bTag or tonumber(bTag) ~= 1 then
		Say(g_szTitle.."Ng­¬i muèn thanh lý tói?", 2, "§ång ý/#ClearBagAllItem(1)", "Ra khái/nothing")
		return
	end
	ClearItemInPos();
	if GetItemCount(2,1,30644) < 1 and GetFreeItemRoom() > 0 then
		AddItem(2,1,30644,1)
	end
end

function TongOperation()
	local szSay = {
		g_szTitle.."Thao t¸c bang héi",
		"Ta muèn lËp bang héi/TongOperation_Create",
		"Ta muèn th¨ng cÊp bang héi/TongOperation_update",
		"Ra khái/nothing",
	};
	SelectSay(szSay);
end

function TongOperation_Create()
	if IsTongMember() ~= 0 then
		Talk(1,"","Ng­¬i ®· cã bang héi");
		return
	end
	if gf_Judge_Room_Weight(2, 100, " ") ~= 1 then
		return 0;
	end
	if GetItemCount(2,0,555) < 1 then
		AddItem(2,0,555,1)
	end
	if GetItemCount(2,0,125) < 1 then
  	AddItem(2,0,125,1)
  end
  if GetReputation() < 2000 then
  	ModifyReputation(2000 - GetReputation(), 0)
  end
  if GetCash() < 5000000 then
  	Earn(5000000 - GetCash())
  end
  CreateTongDialog()
end


function TongOperation_update()
	if GetTongLevel() < 3 then
		AddTongLevel();
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
	end
end

function GetJingMai()
	local szSay = {
		g_szTitle.."Thao th¸c kinh m¹ch",
		"TÈy ®iÓm kinh m¹ch/GetJingMai_Reset",
		format("%s/getZhenqi", "NhËn ch©n khÝ"),
		format("%s/getJingMaiTongRen", "NhËn Kinh M¹ch §ång Nh©n"),
		"Ra khái/nothing",
	};
	if MeridianGetLevel() < 4 then
		tinsert(szSay, 2, "Th¨ng cÊp c¶nh giíi Vâ T«n/GetJingMai_Update")
	end
	SelectSay(szSay);
end

function getZhenqi()
	AwardGenuineQi(180000);
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end
function getJingMaiTongRen()
	AddItem(2, 1,30730, 100)
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function GetJingMai_Update()
	local nLevel = MeridianGetLevel()
	for i = nLevel + 1, 4 do
		MeridianUpdateLevel()
	end
	local nNum = 600000 - (MeridianGetDanTian() + MeridianGetQiHai());
	if nNum > 0 then
		AwardGenuineQi(nNum);
	end
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function GetJingMai_Reset(bTag)
	if not bTag or tonumber(bTag) ~= 1 then
		Say(g_szTitle.."Thao th¸c kinh m¹ch", 2,"§ång ý/#GetJingMai_Reset(1)", "Hñy bá/nothing")
		return 0;
	end
	MeridianRestore(-1);
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function player_reborn()
	PlayerReborn(2, random(4));			--6×ª
	gf_SetTaskByte(1538, 1, 5) 			--5×ª
	SetLevel(99, 1);								--ÉèÖÃµÈ¼¶
	ModifyReputation(10000,0)
	SetTask(336,10000)
	
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
end

function Get_Energy()
	local nCur, nMax = ModifyEnergy(0, 1);
	ModifyEnergy(nMax - nCur, 1);
end

function Life_Skill()
	local tSay = {
		"Muèn t¨ng cÊp kü n¨ng thu thËp/upgrade_gather_skill",
		"Muèn t¨ng cÊp kü n¨ng s¶n xuÊt/upgrade_compose_skill",
		"NhËn nguyªn liÖu chÕ trang bÞ Linh §å/get_lingtu_equip_material",
		"T¹i h¹ chØ xem qua th«i/nothing",
	}
	Say(g_szTitle.."T¨ng cÊp kü n¨ng sèng", getn(tSay), tSay);
end

function upgrade_gather_skill()
	local tGather = {1, 2, 5, 6};
	local tName = {"§èn c©y", "Lµm da", "§µo kho¸ng", "KÐo t¬"};
	local str = ""
	for k, v in tName do
		str = str.."<color=gold>"..v.."<color>,"
	end
	for k, v in tGather do
		local nCur = GetLifeSkillLevel(0, v)
		local nMax = GetLifeSkillMaxLevel(0, v);
		if nMax > nCur then
			local msg = g_szTitle..format("HiÖn t¹i chØ cã thÓ th¨ng cÊp kü n¨ng %s, <color=gold>%s<color> ®ang ®¹t cÊp <color=green>%d<color>, muèn th¨ng cÊp <color=gold>%s<color> ®Õn cÊp <color=green>%d<color> kh«ng?",
				 str, tName[k], nCur, tName[k], nMax);
			Say(msg, 2, format("§ång ý/#upgrade_gather_skill_do(%d, %d)", v, nMax), "Hñy bá/nothing")
			return 0;
		end
	end
	Talk(1,"","Kh«ng cã kü n¨ng sèng cã thÓ th¨ng cÊp, h·y ®i t×m NPC ®Ó häc vµ th¨ng cÊp giíi h¹n kü n¨ng ®Õn cÊp 99")
end

function upgrade_gather_skill_do(nSkill, nMax)
	for i = GetLifeSkillLevel(0, nSkill), nMax do
		AddLifeSkillExp(0, nSkill, 9999999);		
	end
	if 79 == nMax then
		Talk(1,"","HiÖn ®· hoµn thµnh th¨ng cÊp kü n¨ng, h·y ®i t×m NPC ®Ó t¨ng cÊp giíi h¹n ®Õn 99 nµo!")
	end
	Msg2Player(format("Thµnh c«ng t¨ng cÊp kü n¨ng ®Õn cÊp %d", nMax));
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
end

function upgrade_compose_skill()
	local tGather = {2, 3, 4, 5, 9, 10};
	local tName = {"ChÕ t¹o binh khÝ dµi", "ChÕ t¹o binh khÝ ng¾n", "ChÕ t¹o kú m«n binh khÝ", "Lµm hé gi¸p", "H¹ trang", "§Çu qu¸n"};
	local str = ""
	for k, v in tName do
		str = str.."<color=gold>"..v.."<color>,"
	end
	for k, v in tGather do
		local nCur = GetLifeSkillLevel(1, v)
		local nMax = GetLifeSkillMaxLevel(1, v);
		if nMax > nCur then
			local msg = g_szTitle..format("HiÖn t¹i chØ cã thÓ th¨ng cÊp kü n¨ng %s, <color=gold>%s<color> ®ang ®¹t cÊp <color=green>%d<color>, muèn th¨ng cÊp <color=gold>%s<color> ®Õn cÊp <color=green>%d<color> kh«ng?",
				 str, tName[k], nCur, tName[k], nMax);
			Say(msg, 2, format("§ång ý/#upgrade_compose_skill_do(%d, %d)", v, nMax), "Hñy bá/nothing")
			return 0;
		end
	end
	Talk(1,"","Kh«ng cã kü n¨ng sèng cã thÓ th¨ng cÊp, h·y ®i t×m NPC ®Ó häc vµ th¨ng cÊp giíi h¹n kü n¨ng ®Õn cÊp 99")
end

function upgrade_compose_skill_do(nSkill, nMax)
	for i = GetLifeSkillLevel(1, nSkill), nMax do
		AddLifeSkillExp(1, nSkill, 9999999);		
	end
	if 79 == nMax then
		Talk(1,"","HiÖn ®· hoµn thµnh th¨ng cÊp kü n¨ng, h·y ®i t×m NPC ®Ó t¨ng cÊp giíi h¹n ®Õn 99 nµo!")
	end
	Msg2Player(format("Thµnh c«ng t¨ng cÊp kü n¨ng ®Õn cÊp %d", nMax));
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
end

function get_lingtu_equip_material()
	if gf_Judge_Room_Weight(18, 100) ~= 1 then
		Talk(1,"",format("Tói kh«ng ®ñ %d « trèng", 18));
		return 0;
	end
	AddItem(2, 1, 30670, 999);
	AddItem(2, 1, 30671, 999);
	AddItem(2, 1, 30672, 999);
	AddItem(2, 1, 30673, 999);
	AddItem(2, 1, 30674, 999);
	AddItem(2, 2, 38, 999);
	AddItem(2, 2, 12, 999);
	AddItem(2, 2, 39, 999);
	AddItem(2, 2, 13, 999);
	AddItem(2, 2, 49, 999);
	AddItem(2, 2, 56, 999);
	AddItem(2, 2, 50, 999);
	AddItem(2, 2, 100, 999);
	AddItem(2, 1, 30680, 999);
	AddItem(2, 1, 30681, 999);
	AddItem(2, 1, 30682, 999);
	AddItem(2, 1, 30683, 999);
	AddItem(2, 1, 30684, 999);
end

function Get_Mored()
	local tSay = {
		"NhËn ChiÕn T­îng/chientuong",
		"NhËn Vò KhÝ Nguyªn Tö/vknt",
		"NhËn Set Thiªn H¹ V« Song/thvs",
		"NhËn Thó C­ìi Pro/thucuoipro",
		"NhËn Ngo¹i Trang vip tèc ®¸nh/ngoaitrangtocdanh",
		"NhËn Ngo¹i Trang vip dame/ngoaitrangdame",
		"LuyÖn max skill trÊn ph¸i/maxtranphai",
		"Håi m¸u, mana/getTiLi",
		"T¹i h¹ chØ xem qua th«i/nothing",
	}
	Say(g_szTitle.."By trananh - 0911406340", getn(tSay), tSay);
end



function chientuong()
	AddItem(0,105,30033,1,1,7,403,7,-1,7,-1,7,0);
end

function vknt()
	if gf_Judge_Room_Weight(12, 100) ~= 1 then
		Talk(1,"",format("Tói kh«ng ®ñ %d « trèng", 12));
		return 0;
	end
	AddItem(0,0,16,1,1,7,485,7,485,7,485,-1,15);
	AddItem(0,2,38,1,1,7,485,7,485,7,485,-1,15);
	AddItem(0,5,42,1,1,7,485,7,485,7,485,-1,15);
	AddItem(0,1,55,1,1,7,485,7,485,7,485,-1,15);
	AddItem(0,3,66,1,1,7,485,7,485,7,485,-1,15);
	AddItem(0,10,77,1,1,7,485,7,485,7,485,-1,15);
	AddItem(0,9,88,1,1,7,485,7,485,7,485,-1,15);
	AddItem(0,8,99,1,1,7,485,7,485,7,485,-1,15);
	AddItem(0,6,110,1,1,7,485,7,485,7,485,-1,15);
	AddItem(0,4,121,1,1,7,485,7,485,7,485,-1,15);
	AddItem(0,11,14,1,1,7,485,7,485,7,485,-1,15);
	AddItem(0,7,14,1,1,7,485,7,485,7,485,-1,15);
end

function thvs()
	if gf_Judge_Room_Weight(12, 100) ~= 1 then
		Talk(1,"",format("Tói kh«ng ®ñ %d « trèng", 12));
		return 0;
	end
	AddItem(0,100,30207,1,1,-1,-1,-1,-1,-1,-1,-1,15);
	AddItem(0,101,30207,1,1,-1,-1,-1,-1,-1,-1,-1,15);
	AddItem(0,103,30207,1,1,-1,-1,-1,-1,-1,-1,-1,15);
	AddItem(0,100,30208,1,1,-1,-1,-1,-1,-1,-1,-1,15);
	AddItem(0,101,30208,1,1,-1,-1,-1,-1,-1,-1,-1,15);
	AddItem(0,103,30208,1,1,-1,-1,-1,-1,-1,-1,-1,15);
	AddItem(0,100,30209,1,1,-1,-1,-1,-1,-1,-1,-1,15);
	AddItem(0,101,30209,1,1,-1,-1,-1,-1,-1,-1,-1,15);
	AddItem(0,103,30209,1,1,-1,-1,-1,-1,-1,-1,-1,15);
	AddItem(0,100,30210,1,1,-1,-1,-1,-1,-1,-1,-1,15);
	AddItem(0,101,30210,1,1,-1,-1,-1,-1,-1,-1,-1,15);
	AddItem(0,103,30210,1,1,-1,-1,-1,-1,-1,-1,-1,15);
end

function thucuoipro()
	if gf_Judge_Room_Weight(10, 100) ~= 1 then
		Talk(1,"",format("Tói kh«ng ®ñ %d « trèng", 10));
		return 0;
	end
	AddItem(0,105,30044,1,1,7,403,7,-1,7,-1,7,0);
	AddItem(0,105,30021,1,1,7,403,7,-1,7,-1,7,0);
	AddItem(0,105,30023,1,1,7,403,7,-1,7,-1,7,0);
	AddItem(0,105,30025,1,1,7,403,7,-1,7,-1,7,0);
	AddItem(0,105,30027,1,1,7,403,7,-1,7,-1,7,0);
	AddItem(0,105,30030,1,1,7,403,7,-1,7,-1,7,0);
	AddItem(0,105,30040,1,1,7,403,7,-1,7,-1,7,0);
	AddItem(0,105,30041,1,1,7,403,7,-1,7,-1,7,0);
	AddItem(0,105,30048,1,1,7,403,7,-1,7,-1,7,0);
	AddItem(0,105,10107,1,1,7,403,7,-1,7,-1,7,0);
	AddItem(0,105,10108,1,1,7,403,7,-1,7,-1,7,0);
	AddItem(0,105,10109,1,1,7,403,7,-1,7,-1,7,0);
	AddItem(0,105,10110,1,1,7,403,7,-1,7,-1,7,0);
	AddItem(0,105,10111,1,1,7,403,7,-1,7,-1,7,0);
	AddItem(0,105,10112,1,1,7,403,7,-1,7,-1,7,0);

end

function ngoaitrangtocdanh()
	if gf_Judge_Room_Weight(3, 100) ~= 1 then
		Talk(1,"",format("Tói kh«ng ®ñ %d « trèng", 3));
		return 0;
	end
	AddItem(0,110,514,1,1,7,276,7,276,7,276,7,0);
	AddItem(0,110,515,1,1,7,276,7,276,7,276,7,0);
	AddItem(0,110,516,1,1,7,276,7,276,7,276,7,0);
	AddItem(0,110,517,1,1,7,276,7,276,7,276,7,0);
	AddItem(0,109,514,1,1,7,276,7,276,7,276,7,0);
	AddItem(0,109,515,1,1,7,276,7,276,7,276,7,0);
	AddItem(0,109,516,1,1,7,276,7,276,7,276,7,0);
	AddItem(0,109,517,1,1,7,276,7,276,7,276,7,0);
	AddItem(0,108,514,1,1,7,276,7,276,7,276,7,0);
	AddItem(0,108,515,1,1,7,276,7,276,7,276,7,0);
	AddItem(0,108,516,1,1,7,276,7,276,7,276,7,0);
	AddItem(0,108,517,1,1,7,276,7,276,7,276,7,0);
end

function ngoaitrangdame()
	if gf_Judge_Room_Weight(3, 100) ~= 1 then
		Talk(1,"",format("Tói kh«ng ®ñ %d « trèng", 3));
		return 0;
	end
	AddItem(0,110,514,1,1,7,252,7,252,7,252,7,0);
	AddItem(0,110,515,1,1,7,252,7,252,7,252,7,0);
	AddItem(0,110,516,1,1,7,252,7,252,7,252,7,0);
	AddItem(0,110,517,1,1,7,252,7,252,7,252,7,0);
	AddItem(0,109,514,1,1,7,252,7,252,7,252,7,0);
	AddItem(0,109,515,1,1,7,252,7,252,7,252,7,0);
	AddItem(0,109,516,1,1,7,252,7,252,7,252,7,0);
	AddItem(0,109,517,1,1,7,252,7,252,7,252,7,0);
	AddItem(0,108,514,1,1,7,252,7,252,7,252,7,0);
	AddItem(0,108,515,1,1,7,252,7,252,7,252,7,0);
	AddItem(0,108,516,1,1,7,252,7,252,7,252,7,0);
	AddItem(0,108,517,1,1,7,252,7,252,7,252,7,0);
end

function maxtranphai()
	for i = 1,20 do

		while LevelUpSkill(1196) == 1 do

		end
		while LevelUpSkill(44) == 1 do

		end
		while LevelUpSkill(146) == 1 do

		end
		while LevelUpSkill(745) == 1 do

		end
		while LevelUpSkill(113) == 1 do

		end
		while LevelUpSkill(1032) == 1 do

		end
		while LevelUpSkill(74) == 1 do

		end
		while LevelUpSkill(774) == 1 do

		end
		while LevelUpSkill(775) == 1 do

		end
		while LevelUpSkill(732) == 1 do

		end
		while LevelUpSkill(159) == 1 do

		end
		while LevelUpSkill(89) == 1 do

		end
		while LevelUpSkill(102) == 1 do

		end
		while LevelUpSkill(1230) == 1 do

		end
		while LevelUpSkill(57) == 1 do

		end
		while LevelUpSkill(124) == 1 do

		end
		while LevelUpSkill(32) == 1 do

		end
	end;
end

function Get_Enhance()
	local tSay = {
		"NhËn ThÇn Th¹ch §Þnh Hån/Get_Enhance_1",
		"NhËn Tinh th¹ch Thiªn Th¹ch/Get_Enhance_2",
		"T¹i h¹ chØ xem qua th«i/nothing",
	}
	Say(g_szTitle.."T¨ng cÊp kü n¨ng sèng", getn(tSay), tSay);
end

function Get_Enhance_1()
	if gf_Judge_Room_Weight(2, 10, " ") ~= 1 then
		return 0;
	end
	gf_AddItemEx2({2, 1, 1068, 1}, "Thiªn Th¹ch linh th¹ch", "Get_Enhance_1", "NhËn ThÇn Th¹ch §Þnh Hån", 0, 1);
	gf_AddItemEx2({2, 1, 1067, 1}, "Thiªn Th¹ch linh th¹ch", "Get_Enhance_1", "NhËn ThÇn Th¹ch §Þnh Hån", 0, 1);
end

function Get_Enhance_2()
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end
	AddItem(2, 1, 1009, 100);
	WriteLogEx("Get_Enhance_2","NhËn Tinh th¹ch Thiªn Th¹ch", 100, "Thiªn Th¹ch Tinh Th¹ch");
end

function Get_Gem()
	if gf_Judge_Room_Weight(24, 100, " ") ~= 1 then
		return 0;
	end
        AddItem(2, 22, 101, 100);
	WriteLogEx("Get_Gem","NhËn ®¸ quý", 100, "HuyÕt TrÝch Th¹ch CÊp 1");
	AddItem(2, 22, 201, 100);
	WriteLogEx("Get_Gem","NhËn ®¸ quý", 100, "NguyÖt B¹ch Th¹ch CÊp 1");
	AddItem(2, 22, 301, 100);
	WriteLogEx("Get_Gem","NhËn ®¸ quý", 100, "Hæ Ph¸ch Th¹ch CÊp 1");
	AddItem(2, 22, 401, 100);	
	WriteLogEx("Get_Gem","NhËn ®¸ quý", 100, "H¾c DiÖu Th¹ch CÊp 1");
        AddItem(2, 22, 102, 100);
	WriteLogEx("Get_Gem","NhËn ®¸ quý", 100, "HuyÕt TrÝch Th¹ch CÊp 2");
	AddItem(2, 22, 202, 100);
	WriteLogEx("Get_Gem","NhËn ®¸ quý", 100, "NguyÖt B¹ch Th¹ch CÊp 2");
	AddItem(2, 22, 302, 100);
	WriteLogEx("Get_Gem","NhËn ®¸ quý", 100, "Hæ Ph¸ch Th¹ch CÊp 2");
	AddItem(2, 22, 402, 100);	
	WriteLogEx("Get_Gem","NhËn ®¸ quý", 100, "H¾c DiÖu Th¹ch CÊp 2");
        AddItem(2, 22, 103, 100);
	WriteLogEx("Get_Gem","NhËn ®¸ quý", 100, "HuyÕt TrÝch Th¹ch CÊp 3");
	AddItem(2, 22, 203, 100);
	WriteLogEx("Get_Gem","NhËn ®¸ quý", 100, "NguyÖt B¹ch Th¹ch CÊp 3");
	AddItem(2, 22, 303, 100);
	WriteLogEx("Get_Gem","NhËn ®¸ quý", 100, "Hæ Ph¸ch Th¹ch CÊp 3");
	AddItem(2, 22, 403, 100);	
	WriteLogEx("Get_Gem","NhËn ®¸ quý", 100, "H¾c DiÖu Th¹ch CÊp 3");
        AddItem(2, 22, 104, 100);
	WriteLogEx("Get_Gem","NhËn ®¸ quý", 100, "HuyÕt TrÝch Th¹ch CÊp 4");
	AddItem(2, 22, 204, 100);
	WriteLogEx("Get_Gem","NhËn ®¸ quý", 100, "NguyÖt B¹ch Th¹ch CÊp 4");
	AddItem(2, 22, 304, 100);
	WriteLogEx("Get_Gem","NhËn ®¸ quý", 100, "Hæ Ph¸ch Th¹ch CÊp 4");
	AddItem(2, 22, 404, 100);	
	WriteLogEx("Get_Gem","NhËn ®¸ quý", 100, "H¾c DiÖu Th¹ch CÊp 4");
        AddItem(2, 22, 105, 100);
	WriteLogEx("Get_Gem","NhËn ®¸ quý", 100, "HuyÕt TrÝch Th¹ch CÊp 5");
	AddItem(2, 22, 205, 100);
	WriteLogEx("Get_Gem","NhËn ®¸ quý", 100, "NguyÖt B¹ch Th¹ch CÊp 5");
	AddItem(2, 22, 305, 100);
	WriteLogEx("Get_Gem","NhËn ®¸ quý", 100, "Hæ Ph¸ch Th¹ch CÊp 5");
	AddItem(2, 22, 405, 100);	
	WriteLogEx("Get_Gem","NhËn ®¸ quý", 100, "H¾c DiÖu Th¹ch CÊp 5");
	AddItem(2, 22, 106, 100);
	WriteLogEx("Get_Gem","NhËn ®¸ quý", 100, "HuyÕt TrÝch Th¹ch CÊp 6");
	AddItem(2, 22, 206, 100);
	WriteLogEx("Get_Gem","NhËn ®¸ quý", 100, "NguyÖt B¹ch Th¹ch CÊp 6");
	AddItem(2, 22, 306, 100);
	WriteLogEx("Get_Gem","NhËn ®¸ quý", 100, "Hæ Ph¸ch Th¹ch CÊp 6");
	AddItem(2, 22, 406, 100);	
	WriteLogEx("Get_Gem","NhËn ®¸ quý", 100, "H¾c DiÖu Th¹ch CÊp 6");
                    AddItem(2, 22, 107, 100);
                    WriteLogEx("Get_Gem","NhËn ®¸ quý", 100, "HuyÕt TrÝch Th¹ch CÊp 7");
                    AddItem(2, 22, 207, 100);
	WriteLogEx("Get_Gem","NhËn ®¸ quý", 100, "NguyÖt B¹ch Th¹ch CÊp 7");
                   AddItem(2, 22, 307, 100);
	WriteLogEx("Get_Gem","NhËn ®¸ quý", 100, "Hæ Ph¸ch Th¹ch CÊp 7");
                   AddItem(2, 22, 407, 100);	
	WriteLogEx("Get_Gem","NhËn ®¸ quý", 100, "H¾c DiÖu Th¹ch CÊp 7");




end

function Get_Diem_Char()
	local szSay = {
		g_szTitle.."T¨ng ®iÓm cho nh©n vËt!",
		"NhËn Qu©n hµm nguyªn so¸i/Get_NguyenSoai",
		"NhËn NhËn 250.000 ®iÓm c«ng tr¹ng/Get_CongTrang",
		"NhËn NhËn 10.000 ®iÓm danh väng/Get_DanhVong",
		"NhËn NhËn 10.000 ®iÓm s­ m«n/Get_SuMon",
		"Ra khái/nothing",
	};
	SelectSay(szSay);
end

function Get_NguyenSoai()
	SetTask(704,6)
        Msg2SubWorld("Chóc mõng b¹n ®· trë thµnh Nguyªn So¸i ®Ñp trai");
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),904,0,0)
end

function Get_CongTrang()
	SetTask(701, GetTask(701) + 250000)
        Msg2SubWorld("Chóc mõng b¹n ®· nhËn ®­îc 250.000 ®iÓm c«ng tr¹ng");
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function Get_DanhVong()
	ModifyReputation(10000,0)
        Msg2SubWorld("Chóc mõng b¹n ®· nhËn ®­îc 10.000 ®iÓm danh väng");
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function Get_SuMon()
	SetTask(336,GetTask(336) + 10000)
        Msg2SubWorld("Chóc mõng b¹n ®· nhËn ®­îc 10.000 ®iÓm s­ m«n");
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function Get_Danh_Hieu()
	local szSay = {
		g_szTitle.."NhËn danh hiÖu mµ ®¹i hiÖp mong muèn!",
		"NhËn Danh HiÖu Du HiÖp/Get_DuHiep",
		"NhËn Danh HiÖu ¦ng D­¬ng/Get_UngDuong",
		"NhËn Danh HiÖu ChiÕn Cuång/Get_ChienCuong",
		"NhËn Vâ L©m B¸ch HiÓu Sinh/Get_VLBHS",
                "NhËn Siªu Nh©n VÞt Muèi/Get_SNVM",
                "NhËn Siªu Nh©n Gao/Get_SNGAO",
                "NhËn Siªu Nh©n M× Bß/Get_SNMiBo",
                "NhËn Siªu Nh©n M× Gµ/Get_SNMiGa",
                "NhËn Siªu Nh©n M× T«m/Get_SNMiTom",
                "Trang kÕ/Get_Danh_Hieu2",
		"Ra khái/nothing",
	};
	SelectSay(szSay);
end

function Get_DuHiep()
	AddTitle(65, 1)
        Msg2SubWorld("Chóc mõng b¹n nhËn ®­îc danh hiÖu Du HiÖp");
	PlaySound("\\sound\\sound_i017.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),912,0,0)
end

function Get_UngDuong()
	AddTitle(65, 2)
        Msg2SubWorld("Chóc mõng b¹n nhËn ®­îc danh hiÖu ¦ng D­¬ng");
	PlaySound("\\sound\\sound_i017.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),912,0,0)
end

function Get_ChienCuong()
	AddTitle(65, 3)
        Msg2SubWorld("Chóc mõng b¹n nhËn ®­îc danh hiÖu ChiÕn Cuån");
	PlaySound("\\sound\\sound_i017.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),912,0,0)
end

function Get_VLBHS()
	AddTitle(63, 1)
        Msg2SubWorld("Chóc mõng b¹n nhËn ®­îc danh hiÖu Vâ L©m B¸ch HiÓu Sinh");
	PlaySound("\\sound\\sound_i017.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),912,0,0)
end

function Get_SNVM()
	AddTitle(62, 1)
        Msg2SubWorld("Chóc mõng b¹n nhËn ®­îc danh hiÖu Siªu Nh©n VÞt Muèi");
	PlaySound("\\sound\\sound_i017.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),912,0,0)
end

function Get_SNGAO()
	AddTitle(62, 2)
        Msg2SubWorld("Chóc mõng b¹n nhËn ®­îc danh hiÖu Siªu Nh©n Gao");
	PlaySound("\\sound\\sound_i017.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),912,0,0)
end

function Get_SNMiBo()
	AddTitle(62, 3)
        Msg2SubWorld("Chóc mõng b¹n nhËn ®­îc danh hiÖu Siªu Nh©n M× Bß");
	PlaySound("\\sound\\sound_i017.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),912,0,0)
end

function Get_SNMiGa()
	AddTitle(62, 4)
        Msg2SubWorld("Chóc mõng b¹n nhËn ®­îc danh hiÖu Siªu Nh©n M× Gµ");
	PlaySound("\\sound\\sound_i017.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),912,0,0)
end

function Get_SNMiTom()
	AddTitle(62, 5)
        Msg2SubWorld("Chóc mõng b¹n nhËn ®­îc danh hiÖu Siªu Nh©n M× T«m");
	PlaySound("\\sound\\sound_i017.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),912,0,0)
end

function Get_Danh_Hieu2()
	local szSay = {
		g_szTitle.."NhËn danh hiÖu mµ ®¹i hiÖp mong muèn!",
                "NhËn Danh HiÖu Sèng kh«ng yªu/Get_DelYeu",
                "NhËn Danh HiÖu HËn ®êi v« ®èi/Get_HanDoi",
                "NhËn Danh HiÖu Buån V× §Ñp Trai/Get_SadDep",
                "NhËn Danh HiÖu Ng¹o ThÕ V« Song/Get_NgaoTheVoSong",
                "NhËn Danh HiÖu B¸ V­¬ng/Get_BaVuong",
                "NhËn Danh HiÖu §¹i HiÖp/Get_DaiHiep",
                "NhËn Danh HiÖu Tinh Anh §á/Get_TinhAnhDo",
                "NhËn Danh HiÖu Tinh Anh TÝm/Get_TinhAnhTim",
		"Ra khái/nothing",
	};
	SelectSay(szSay);
end

function Get_BaVuong()
	AddTitle(66, 1)
        Msg2SubWorld("Chóc mõng b¹n nhËn ®­îc danh hiÖu ChÝ T«n V­¬ng Gi¶");
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),913,0,0)
end

function Get_DaiHiep()
	AddTitle(66, 2)
        Msg2SubWorld("Chóc mõng b¹n nhËn ®­îc danh hiÖu §éc Bé Thiªn H¹");
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),913,0,0)
end

function Get_TinhAnhDo()
	AddTitle(66, 3)
        Msg2SubWorld("Chóc mõng b¹n nhËn ®­îc danh hiÖu Vâ l©m hµo kiÖt");
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),913,0,0)
end

function Get_TinhAnhTim()
	AddTitle(66, 4)
        Msg2SubWorld("Chóc mõng b¹n nhËn ®­îc danh hiÖu Giang hå tinh anh");
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),913,0,0)
end

function Get_NgaoTheVoSong()
	AddTitle(61, 7)
        Msg2SubWorld("Chóc mõng b¹n nhËn ®­îc danh hiÖu Ng¹o ThÕ V« Song");
	PlaySound("\\sound\\sound_i017.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),912,0,0)
end

function Get_SadDep()
	AddTitle(62, 13)
        Msg2SubWorld("Chóc mõng b¹n nhËn ®­îc danh hiÖu Buån V× §Ñp Trai");
	PlaySound("\\sound\\sound_i017.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),912,0,0)
end

function Get_DelYeu()
	AddTitle(62, 6)
        Msg2SubWorld("Chóc mõng b¹n nhËn ®­îc danh hiÖu Sèng kh«ng yªu");
	PlaySound("\\sound\\sound_i017.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),912,0,0)
end

function Get_HanDoi()
	AddTitle(62, 7)
        Msg2SubWorld("Chóc mõng b¹n nhËn ®­îc danh hiÖu HËn §êi V« §èi");
	PlaySound("\\sound\\sound_i017.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),912,0,0)
end

function Reset_Time_Playy()
	SetAntiEnthrallmentInfo(1, 1, 1);
        Msg2SubWorld("Liªn hÖ facebook.com/Thuong.EoPi ®Ó ®­îc hç trî");
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function Get_An()
	if gf_Judge_Room_Weight(4, 100, " ") ~= 1 then
		return 0;
	end
                AddItem(2, 0, 30002, 1 ,1);
	WriteLogEx("Get_An","NhËn Ên:", 100, "Long tö Ên");
	AddItem(2, 0, 30005, 1, 1);
	WriteLogEx("Get_An","NhËn Ên:", 100, "Phông tö Ên");
	AddItem(2, 0, 30003, 1, 1);
	WriteLogEx("Get_An","NhËn Ên:", 100, "Hæ tö Ên");
	AddItem(2, 0, 30006, 1, 1);	
	WriteLogEx("Get_An","NhËn Ên:", 100, "¦ng tö Ên");
                AddItem(2, 0, 30001, 1, 1);	
	WriteLogEx("Get_An","NhËn Ên:", 100, "tö Ên");
end
function change_PhucSinh()
	local tSay = {}
	local tHeader = "§¹i hiÖp muèn thay ®æi theo h­íng nµo. §èi víi Phôc Sinh, sau khi thay ®æi sÏ bÞ vÒ level 10, h·y ®Õn g¾p B¹ch Tiªn Sinh (TuyÒn Ch©u) ®Ó nhËn l¹i level !!!!."		
	tinsert(tSay, "H­íng Long Tö/#confirm_change_chuyensinh(1)")
	tinsert(tSay, "H­íng Hæ Tö/#confirm_change_chuyensinh( 2)")
	tinsert(tSay, "H­íng ¦ng Tö/#confirm_change_chuyensinh(3)")		
	tinsert(tSay, "H­íng Phông Tö/#confirm_change_chuyensinh(4)")
	tinsert(tSay, "T¹m thêi ta ch­a muèn thay ®æi/nothing")
	Say(tHeader, getn(tSay), tSay)			
end

function confirm_change_chuyensinh(nWay)
	local nNum_cs6 = GetPlayerRebornParam(0)
	PlayerReborn(nNum_cs6,nWay) -- Thay ®æi h­íng chuyÓn Sinh 6 thµnh c«ng		
	Talk(1,"", "Chóc mõng ®¹i hiÖp ®· thay ®æi h­íng Phôc Sinh thµnh c«ng !")		
	Msg2Player("Chóc mõng ®¹i hiÖp ®· thay ®æi h­íng Phôc Sinh thµnh c«ng !")
	SetLevel(99,0)
	NewWorld(200,1353, 2876)
end

function get_translife_item()
	if gf_JudgeRoomWeight(5,300,"") == 0 then
		return
	end	

	BigDelItem(2,0,30002, BigGetItemCount(2,0,30002))
	BigDelItem(2,0,30003, BigGetItemCount(2,0,30003))
	BigDelItem(2,0,30005, BigGetItemCount(2,0,30005))
	BigDelItem(2,0,30006, BigGetItemCount(2,0,30006))
	local nTransCount = GetTranslifeCount()	
	local nType = GetTranslifeFaction()	
	---------chuyÓn sinh 7
	if GetPlayerRebornParam(0) == 2 then
		local nType_cs7 = GetPlayerRebornParam(1)
		local nBody = GetBody()	
		gf_AddItemEx(tb_translife_seal_cs6[nType_cs7][2], tb_translife_seal_cs6[nType_cs7][1])		
		if GetLevel() < 79 then
			Talk(1,"","§¹i hiÖp ch­a ®ñ yªu cÇu ®Ó nhËn l¹i trang bÞ")	
			return
		end
		SetTask(336,GetTask(336) - 100)
		Msg2Player("B¹n bÞ trõ 100 ®iÓm s­ m«n.")
		local nType_cs6 = GetPlayerRebornParam(1) -- xãa trang bi CS6
		local nBody_cs6 = GetBody()
		for i=1, getn(tb_translife_cloth_cs7_nhanlai[nType_cs7][nBody]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth_cs7_nhanlai[nType_cs7][nBody][i])
			P = P + GetBody() - 1
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
		end					
		for i = 1, 3 do
			gf_AddItemEx(tb_translife_cloth_cs7_nhanlai[nType_cs7][nBody][i], "NhËn l¹i trang bÞ")
		end
		for i=1, getn(tb_translife_cloth[nType][nTransCount]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType][nTransCount][i][2])
			P = P + GetBody() - 1
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
			gf_AddItemEx({G, D, P, nCount,1, lvatt1, att1, lvatt2, att2, lvatt3, att3},tb_translife_cloth[nType][nTransCount][i][1])
		end				
		Talk(1,"","§©y lµ nh÷ng vËy quý gi¸, lÇn sau cÈn thËn ko ®Ó mÊt n÷a ®Êy!")	
		WriteLogEx("Chuyen Sinh","nhËn l¹i Ên vµ ngo¹i trang chuyÓn sinh 7 theo h­íng "..tb_translife_seal[nType_cs6][3])		
		return
	end	
end
