--���ָ��
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\system_switch_config.lua");

g_szTitle = "<color=green>H��ng d�n:<color>"
function OnUse(nItem)
	if 1 ~= IsExpSvrSystemOpen() then
		return
	end
	
	local tSay = {}
	local nRoute = GetPlayerRoute();
	if nRoute <= 0 then
		tSay = {
			"Gia nh�p m�n ph�i/JoinRoute_UpdateLevel",
		}
	else
		tSay = {
			"Nh�n trang b� Th�ng D�ng/GetTB",
			"Nh�n trang b� Chi�n Tr��ng/GetCT",
			"Nh�n trang b� Ti�u D�ng/Get_TieuDung",
			"Nh�n v�ng bao/Get_VANGBAO1",
			"Ph�t s�ng vk/PS_vk",
			"Nh�n �n chuy�n sinh/Get_An",
			"Luy�n max skill tr�n ph�i/maxtranphai",

			"Ch�c n�ng kh�c/Get_Orther",
			format("%s/getTiLi", "H�i ph�c th� l�c"),
		}
		if 3 == nRoute then
			tinsert(tSay, "Nh�n Thi�n Ph�t Ch�u v� Ph� Ma Ch�/Give_ZhuzhuZhouzhou")
		end
		if 6 == nRoute then
			tinsert(tSay, "Nh�n �m Kh� v� C� Quan/Give_JiguanAnqi")
		end
		if 8 == nRoute then
			tinsert(tSay, "Nh�n X� L�i Kim ��n/Give_Dandan")
		end		
		if 17 == nRoute then
			tinsert(tSay, "Nh�n Chi�n M�/Give_ZhanMa")
		end
		if 18 == nRoute then
			tinsert(tSay, "Nh�n Chi�n M� v� T� Ti�n/Give_Jiancu")
		end
		if 20 == nRoute then
			tinsert(tSay, "Nh�n Phong Thi Ph�/Give_Fengshifu")
		end
		if 21 == nRoute then
			tinsert(tSay, "Nh�n C�/Give_GuGu")
		end
		if 30 == nRoute then
			tinsert(tSay, "Nh�n �i�u/ling_nv_xiaodiao")
		end
	end
	tinsert(tSay, "X�a kho ��/ClearBagAllItem");
	tinsert(tSay, "Tho�t/nothing");
	Say(g_szTitle.."Ng��i c�n gi�p �� g�?", getn(tSay), tSay);
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


function Get_Orther()
	local szSay = {
		g_szTitle.."L�a ch�n",
		"Thao t�c Kinh M�ch/GetJingMai",
		"Thao t�c M�t T�ch Y�u Quy�t/Get_Book",
		"Thao t�c th� c�ng/Pet_OP",
		"Ch�c n�ng bang h�i/TongOperation",
		"Thay ��i h� ph�i kh�c/JoinRoute_UpdateLevel",
		"Ra kh�i/nothing",
	};
	SelectSay(szSay);	
end
function Get_An()
	if gf_Judge_Room_Weight(4, 100, " ") ~= 1 then
		return 0;
	end
                AddItem(2, 0, 30002, 1 ,1);
	WriteLogEx("Get_An","Nh�n �n:", 100, "Long t� �n");
	AddItem(2, 0, 30005, 1, 1);
	WriteLogEx("Get_An","Nh�n �n:", 100, "Ph�ng t� �n");
	AddItem(2, 0, 30003, 1, 1);
	WriteLogEx("Get_An","Nh�n �n:", 100, "H� t� �n");
	AddItem(2, 0, 30006, 1, 1);	
	WriteLogEx("Get_An","Nh�n �n:", 100, "�ng t� �n");
                AddItem(2, 0, 30001, 1, 1);	
	WriteLogEx("Get_An","Nh�n �n:", 100, "t� �n");
end

function PS_vk()
	local szSay = {
		g_szTitle.."H�y l�a ch�n hi�u �ng v� kh�!",
		"Thi�t C�t/PS_1",
		"B�ch Chi�n/PS_2",
		"Ch��c Nh�t/PS_3",
		"Tu�n D�t/PS_4",
		"��o L�/PS_5",
		"Danh T�c/PS_6",
		"L�c H�/PS_7",
		"L�ng Ti�u/PS_8",
		"Ph�n V�n/PS_9",
		"�o�n Giao/PS_10",
		"C�i Th�/PS_11",
		"Ph� Qu�n/PS_12",
		"H�o m�n/PS_13",
		"Ra kh�i/nothing",
	};
	SelectSay(szSay);
end

function PS_1()
	BindWeaponEffect("Thi�t C�t",1)	
end
function PS_2()
	BindWeaponEffect("B�ch Chi�n",1)	
end
function PS_3()
	BindWeaponEffect("Ch��c Nh�t",1)	
end
function PS_4()
	BindWeaponEffect("Tu�n D�t",1)	
end
function PS_5()
	BindWeaponEffect("��o L�",1)	
end
function PS_6()
	BindWeaponEffect("Danh T�c",1)	
end
function PS_7()
	BindWeaponEffect("L�c H�",1)	
end
function PS_8()
	BindWeaponEffect("L�ng Ti�u",1)	
end
function PS_9()
	BindWeaponEffect("Ph�n V�n",1)	
end
function PS_10()
	BindWeaponEffect("�o�n Giao",1)	
end
function PS_11()
	BindWeaponEffect("C�i Th�",1)	
end
function PS_12()
	BindWeaponEffect("Ph� Qu�n",1)	
end
function PS_13()
	BindWeaponEffect("H�o m�n",1)	
end

function Get_VANGBAO1()
	                AddItem(2,1,539,1);
	                AddItem(2,1,30229,1);
	                PlaySound("\\sound\\sound_i016.wav");
	                SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end


--TRANG BI THONG THUONG
function GetTB()
	local szSay = {
		g_szTitle.."L�a ch�n",
		"Trang b� Kim X� 6 Max/Get_KimXa",
		"Trang b� H�c B�ch V� Song/Get_HBVS",
		"Trang b� V� Song Chi�n Th�n/Get_VSCT",
		"Trang bi Th�ng Thi�n Gi�i/Get_ThongThien",
		"Trang b� Minh Tinh V� C�c/Get_NgocBoi",
		"Nh�n trang b� Ngo�i Trang/Get_NgoaiTrang",
		"Trang b� Buff 55%/Get_Buff",
		"Nh�n th� c��i/Get_house",
		"Ra kh�i/nothing",
	};
	SelectSay(szSay);	
end

function Get_VSCT()
	if 1 ~= gf_Judge_Room_Weight(3, 1, g_szTitle) then
		return 0;
	end

	local nRoute	= GetPlayerRoute();
	local nBody 	= 30651 + GetBody() - 1;
	
	AddItem(0, 103, nBody, 1,1, -1,-1,-1,-1,-1,-1,1,15);
	AddItem(0, 101, nBody, 1,1, -1,-1,-1,-1,-1,-1,1,15);
	AddItem(0, 100, nBody, 1,1, -1,-1,-1,-1,-1,-1,1,15);
end

function Get_HBVS()
	if 1 ~= gf_Judge_Room_Weight(3, 1, g_szTitle) then
		return 0;
	end

	local nRoute	= GetPlayerRoute();
	local nBody 	= 20020 + GetBody() - 1;
	
	AddItem(0, 103, nBody, 1,1, -1,-1,-1,-1,-1,-1,1,15);
	AddItem(0, 101, nBody, 1,1, -1,-1,-1,-1,-1,-1,1,15);
	AddItem(0, 100, nBody, 1,1, -1,-1,-1,-1,-1,-1,1,15);
end

function Get_ThongThien()
	if 1 ~= gf_Judge_Room_Weight(3, 1, g_szTitle) then
		return 0;
	end

	local nRoute	= GetPlayerRoute();
	local nBody 	= 20016 + GetBody() - 1;
	
	AddItem(0, 103, nBody, 1,1, -1,-1,-1,-1,-1,-1,1,15);
	AddItem(0, 101, nBody, 1,1, -1,-1,-1,-1,-1,-1,1,15);
	AddItem(0, 100, nBody, 1,1, -1,-1,-1,-1,-1,-1,1,15);
	
	AddItem(0, 102, 20000, 1,1, -1,-1,-1,-1,-1,-1,1,15);
	AddItem(0, 102, 20001, 1,1, -1,-1,-1,-1,-1,-1,1,15);
	AddItem(0, 102, 20002, 1,1, -1,-1,-1,-1,-1,-1,1,15);
	AddItem(0, 102, 20003, 1,1, -1,-1,-1,-1,-1,-1,1,15);
	
	Get_VK_TT();
end

function Get_VK_TT()
	if 1 ~= gf_Judge_Room_Weight(1, 1, g_szTitle) then
		return 0;
	end
	
	local nBody = GetBody();
	local nRoute = GetPlayerRoute();
	
	if nRoute == 2 then --TL�
		local nA = 3;
		local nB = 20000;
		AddItem(0, nA, nB, 1,1,7,252,7,252,7,252,1,15);
	end
	
	if nRoute == 3 then --TLT
		local nA = 8;
		local nB = 20001;
		AddItem(0, nA, nB, 1,1,7,252,7,252,7,252,1,15);
	end
	
	if nRoute == 4 then --TLQ
		local nA = 0;
		local nB = 20002;
		AddItem(0, nA, nB, 1,1,7,252,7,252,7,252,1,15);
	end
	
	if nRoute == 6 then --�M
		local nA = 1;
		local nB = 20003;
		AddItem(0, nA, nB, 1,1,7,252,7,252,7,252,1,15);
	end
	
	if nRoute == 8 then --NMK
		local nA = 2;
		local nB = 20004;
		AddItem(0, nA, nB, 1,1,7,252,7,252,7,252,1,15);
	end
	
	if nRoute == 9 then --NM�
		local nA = 10;
		local nB = 20005;
		AddItem(0, nA, nB, 1,1,7,252,7,252,7,252,1,15);
	end
	
	if nRoute == 11 then --CBQ
		local nA = 0;
		local nB = 20006;
		AddItem(0, nA, nB, 1,1,7,252,7,252,7,252,1,15);
	end
	
	if nRoute == 12 then --CBB
		local nA = 5;
		local nB = 20007;
		AddItem(0, nA, nB, 1,1,7,252,7,252,7,252,1,15);
	end
	
	if nRoute == 14 then --V�K
		local nA = 2;
		local nB = 20008;
		AddItem(0, nA, nB, 1,1,7,252,7,252,7,252,1,15);
	end
	
	if nRoute == 15 then --V�B
		local nA = 9;
		local nB = 20009;
		AddItem(0, nA, nB, 1,1,7,252,7,252,7,252,1,15);
	end
	
	if nRoute == 17 then --DGT
		local nA = 6;
		local nB = 20010;
		AddItem(0, nA, nB, 1,1,7,252,7,252,7,252,1,15);
	end
	
	if nRoute == 18 then --DGC
		local nA = 4;
		local nB = 20011;
		AddItem(0, nA, nB, 1,1,7,252,7,252,7,252,1,15);
	end
	
	if nRoute == 20 then --H�
		local nA = 7;
		local nB = 20012;
		AddItem(0, nA, nB, 1,1,7,252,7,252,7,252,1,15);
	end
	
	if nRoute == 21 then --T�
		local nA = 11;
		local nB = 20013;
		AddItem(0, nA, nB, 1,1,7,252,7,252,7,252,1,15);
	end
	
	if nRoute == 23 then --Cl
		local nA = 2;
		local nB = 20014;
		AddItem(0, nA, nB, 1,1,7,252,7,252,7,252,1,15);
	end
	
	if nRoute == 29 then --TYVT
		local nA = 13;
		local nB = 20018;
		AddItem(0, nA, nB, 1,1,7,252,7,252,7,252,1,15);
	end
	
	if nRoute == 30 then --TYLN
		local nA = 12;
		local nB = 20019;
		AddItem(0, nA, nB, 1,1,7,252,7,252,7,252,1,15);
	end
	
end

function Get_NgoaiTrang()
	local szSay = {
		g_szTitle.."L�a ch�n trang b?",
		"Ngo�i trang �m H�n/Get_NT_AmHon",
		"Ngo�i trang Th�ng Thi�n/Get_NT_ThongThien",
		"Ngo�i trang Thi�n V� C� Sa/Get_NT_TVCS",
		"Ngo�i trang V�n Tinh/Get_NT_VanTinh",
		"Ngo�i trang Xu�n Y/Get_NT_XuanY",
		"Ngo�i trang Kh�ng T��c/Get_NT_KhongTuoc",
		"Ngo�i trang Di�p Th��ng Thu/Get_NT_DiepThuongThu",
		"Ra kh�i/nothing",
	};
	SelectSay(szSay);
end

function Get_NT_ThongThien()
	if 1 ~= gf_Judge_Room_Weight(3, 1, g_szTitle) then
		return 0;
	end

	local nRoute	= GetPlayerRoute();
	local nBody1 	= 1053 + GetBody() - 1;
	
	AddItem(0,108,nBody1,1,4,7,496,7,13069,7,13355,0,15)
	AddItem(0,109,nBody1,1,4,7,496,7,13069,7,13355,0,15)
	AddItem(0,110,nBody1,1,4,7,496,7,13069,7,13355,0,15)
	
	AddItem(0,108,nBody1,1,4,7,14524,7,13069,7,13355,0,15)
	AddItem(0,109,nBody1,1,4,7,14524,7,13069,7,13355,0,15)
	AddItem(0,110,nBody1,1,4,7,14524,7,13069,7,13355,0,15)
end

function Get_NT_AmHon()
	if 1 ~= gf_Judge_Room_Weight(3, 1, g_szTitle) then
		return 0;
	end

	local nRoute	= GetPlayerRoute();
	local nBody1 	= 680 + GetBody() - 1;
	
	AddItem(0,108,nBody1,1,4,7,496,7,13069,7,13355,0,15)
	AddItem(0,109,nBody1,1,4,7,496,7,13069,7,13355,0,15)
	AddItem(0,110,nBody1,1,4,7,496,7,13069,7,13355,0,15)
	
	AddItem(0,108,nBody1,1,4,7,14524,7,13069,7,13355,0,15)
	AddItem(0,109,nBody1,1,4,7,14524,7,13069,7,13355,0,15)
	AddItem(0,110,nBody1,1,4,7,14524,7,13069,7,13355,0,15)
end

function Get_NT_TVCS()
	if 1 ~= gf_Judge_Room_Weight(3, 1, g_szTitle) then
		return 0;
	end

	local nRoute	= GetPlayerRoute();
	local nBody1 	= 713 + GetBody() - 1;
	
	AddItem(0,108,nBody1,1,4,7,496,7,13069,7,13355,0,15)
	AddItem(0,109,nBody1,1,4,7,496,7,13069,7,13355,0,15)
	AddItem(0,110,nBody1,1,4,7,496,7,13069,7,13355,0,15)
	
	AddItem(0,108,nBody1,1,4,7,14524,7,13069,7,13355,0,15)
	AddItem(0,109,nBody1,1,4,7,14524,7,13069,7,13355,0,15)
	AddItem(0,110,nBody1,1,4,7,14524,7,13069,7,13355,0,15)
end

function Get_NT_VanTinh()
	if 1 ~= gf_Judge_Room_Weight(3, 1, g_szTitle) then
		return 0;
	end

	local nRoute	= GetPlayerRoute();
	local nBody1 	= 1009 + GetBody() - 1;
	
	AddItem(0,108,nBody1,1,4,7,496,7,13069,7,13355,0,15)
	AddItem(0,109,nBody1,1,4,7,496,7,13069,7,13355,0,15)
	AddItem(0,110,nBody1,1,4,7,496,7,13069,7,13355,0,15)
	
	AddItem(0,108,nBody1,1,4,7,14524,7,13069,7,13355,0,15)
	AddItem(0,109,nBody1,1,4,7,14524,7,13069,7,13355,0,15)
	AddItem(0,110,nBody1,1,4,7,14524,7,13069,7,13355,0,15)
end

function Get_NT_XuanY()
	if 1 ~= gf_Judge_Room_Weight(3, 1, g_szTitle) then
		return 0;
	end

	local nRoute	= GetPlayerRoute();
	local nBody1 	= 1005 + GetBody() - 1;
	
	AddItem(0,108,nBody1,1,4,7,496,7,13069,7,13355,0,15)
	AddItem(0,109,nBody1,1,4,7,496,7,13069,7,13355,0,15)
	AddItem(0,110,nBody1,1,4,7,496,7,13069,7,13355,0,15)
	
	AddItem(0,108,nBody1,1,4,7,14524,7,13069,7,13355,0,15)
	AddItem(0,109,nBody1,1,4,7,14524,7,13069,7,13355,0,15)
	AddItem(0,110,nBody1,1,4,7,14524,7,13069,7,13355,0,15)
end

function Get_NT_KhongTuoc()
	if 1 ~= gf_Judge_Room_Weight(3, 1, g_szTitle) then
		return 0;
	end

	local nRoute	= GetPlayerRoute();
	local nBody1 	= 929 + GetBody() - 1;
	
	AddItem(0,108,nBody1,1,4,7,496,7,13069,7,13355,0,15)
	AddItem(0,109,nBody1,1,4,7,496,7,13069,7,13355,0,15)
	AddItem(0,110,nBody1,1,4,7,496,7,13069,7,13355,0,15)
	
	AddItem(0,108,nBody1,1,4,7,14524,7,13069,7,13355,0,15)
	AddItem(0,109,nBody1,1,4,7,14524,7,13069,7,13355,0,15)
	AddItem(0,110,nBody1,1,4,7,14524,7,13069,7,13355,0,15)
end

function Get_NT_DiepThuongThu()
	if 1 ~= gf_Judge_Room_Weight(3, 1, g_szTitle) then
		return 0;
	end

	local nRoute	= GetPlayerRoute();
	local nBody1 	= 953 + GetBody() - 1;
	
	AddItem(0,108,nBody1,1,4,7,496,7,13069,7,13355,0,15)
	AddItem(0,109,nBody1,1,4,7,496,7,13069,7,13355,0,15)
	AddItem(0,110,nBody1,1,4,7,496,7,13069,7,13355,0,15)
	
	AddItem(0,108,nBody1,1,4,7,14524,7,13069,7,13355,0,15)
	AddItem(0,109,nBody1,1,4,7,14524,7,13069,7,13355,0,15)
	AddItem(0,110,nBody1,1,4,7,14524,7,13069,7,13355,0,15)
end

function Get_NgocBoi()
	if 1 ~= gf_Judge_Room_Weight(2, 1, g_szTitle) then
		return 0;
	end

	AddItem(0,102,31130,1,1,7,496,7,13069,7,13069,0,0)
	AddItem(0,102,31131,1,1,7,496,7,13069,7,13069,0,0)
	AddItem(0,102,31130,1,1,7,13069,7,13069,7,13069,0,0)
	AddItem(0,102,31131,1,1,7,13069,7,13069,7,13069,0,0)
end

function Get_KimXa()
	local szSay = {
		g_szTitle.."L�a ch�n trang b?",
		"Trang b� Kim X� Phi Phong Hoan L�ng/Get_KXDH",
		"Trang b� Kim X� Phi Phong ��ng Giao/Get_KXTH",
		"Trang b� Kim X� Phi Phong Kh�i Ph��ng/Get_KXVD",
		"Ra kh�i/nothing",
	};
	SelectSay(szSay);
end

function Get_TKX()
	AddItem(2, 1, 30526,1000);
	AddItem(2, 1, 30532,1000);
end

function Get_KXDH()
	if 1 ~= gf_Judge_Room_Weight(3, 1, g_szTitle) then
		return 0;
	end

	--kx6 hoan l�ng
        local pifeng,pIndex	=AddItem(0,154,32,1,4,-1,-1,-1,-1,-1,-1,0,15)
        FeedItem(pIndex,1000000)
		SetItemFeedUpAttrs(pIndex,random(2514,2515),random(2527,2531),random(2543,2547),random(2561,2566),random(2572,2573),random(2608,2612))
		local huizhang,hIndex	=AddItem(0,153,32,1,4,-1,-1,-1,-1,-1,-1,0,15)
		FeedItem(hIndex,1000000)
		SetItemFeedUpAttrs(hIndex,random(2514,2515),random(2527,2531),random(2543,2547),random(2561,2566),random(2572,2573),random(2583,2585))
		local xie,xIndex	=AddItem(0,152,32,1,4,-1,-1,-1,-1,-1,-1,0,15)
		FeedItem(xIndex,1000000)
		SetItemFeedUpAttrs(xIndex,random(2514,2515),random(2527,2531),random(2543,2547),random(2561,2566),random(2572,2573),random(2583,2586))
	-- end kx6 hoan l�ng
end

function Get_KXTH()
	if 1 ~= gf_Judge_Room_Weight(3, 1, g_szTitle) then
		return 0;
	end

	 -- kx6 ��ng giao
	    local pifeng,pIndex	=AddItem(0,154,33,1,4,-1,-1,-1,-1,-1,-1,0,15)
        FeedItem(pIndex,1000000)
		SetItemFeedUpAttrs(pIndex,random(2618,2619),random(2631,2635),random(2647,2651),random(2665,2670),random(2678,2680),random(2703,2706))
		local huizhang,hIndex	=AddItem(0,153,33,1,4,-1,-1,-1,-1,-1,-1,0,15)
		FeedItem(hIndex,1000000)
		SetItemFeedUpAttrs(hIndex,random(2618,2619),random(2631,2635),random(2647,2651),random(2665,2670),random(2678,2680),random(2690,2693))
		local xie,xIndex	=AddItem(0,152,33,1,4,-1,-1,-1,-1,-1,-1,0,15)
		FeedItem(xIndex,1000000)
		SetItemFeedUpAttrs(xIndex,random(2618,2619),random(2631,2635),random(2647,2651),random(2665,2670),random(2678,2680),random(2690,2693))

	-- end kx6 ��ng giao
end

function Get_KXVD()
	if 1 ~= gf_Judge_Room_Weight(3, 1, g_szTitle) then
		return 0;
	end

	-- kx6 kh�i ph��ng
		local pifeng,pIndex	=AddItem(0,154,34,1,4,-1,-1,-1,-1,-1,-1,0,15)
        FeedItem(pIndex,1000000)
		SetItemFeedUpAttrs(pIndex,random(2712,2713),random(2725,2729),random(2741,2745),random(2759,2764),random(2772,2774),random(2799,2803))
		local huizhang,hIndex	=AddItem(0,153,34,1,4,-1,-1,-1,-1,-1,-1,0,15)
		FeedItem(hIndex,1000000)
		SetItemFeedUpAttrs(hIndex,random(2712,2713),random(2725,2729),random(2741,2745),random(2759,2764),random(2772,2774),random(2784,2787))
		local xie,xIndex	=AddItem(0,152,34,1,4,-1,-1,-1,-1,-1,-1,0,15)
		FeedItem(xIndex,1000000)
		SetItemFeedUpAttrs(xIndex,random(2712,2713),random(2725,2729),random(2741,2745),random(2759,2764),random(2772,2774),random(2784,2787))
	-- end kx6 kh�i ph��ng	)
end

function Get_Buff()
	if 1 ~= gf_Judge_Room_Weight(3, 1, g_szTitle) then
		return 0;
	end
	
	local nBody 	= 30025	 + GetBody() - 1;
	
	AddItem(0, 103, nBody, 1,1, 7,292,7,292,7,292,1,15);
	AddItem(0, 100, nBody, 1,1, 7,292,7,292,7,292,1,15);
	AddItem(0, 101, nBody, 1,1, 7,292,7,292,7,292,1,15);
	AddItem(0,102,30223,1,1,7,292,7,292,7,292,1,15);
	AddItem(0,102,30224,1,1,7,292,7,292,7,292,1,15);
end

function Get_house()
	AddItem(0,105,38,1,1,7,101,7,101,7,101);
	AddItem(0,105,30033,1,1,7,101,7,101,7,101);
	AddItem(0,105,30056,1,1,7,101,7,101,7,101);
	AddItem(0,105,163,1,1,7,101,7,101,7,101);
end



--TRANG BI CHIEN TRUONG
function GetCT()
	local szSay = {
		g_szTitle.."L�a ch�n",
		"Nh�n trang b� H�a Ph�ng/Get_CT_HP",
		"Nh�n trang b� Thanh Long/Get_CT_TL",
		"Nh�n trang b� Uy H�/Get_CT_UH",
		"Ra kh�i/nothing",
	};
	SelectSay(szSay);	
end
--Trang bi UY HO
function Get_CT_UH()
	local szSay = {
		g_szTitle.."L�a ch�n trang b�",
		"Trang ph�c Uy H� T��ng Phe T�ng/Get_T_UHT",
		"Trang ph�c Uy H� So�i Phe T�ng/Get_T_UHS",
		"Trang ph�c Uy H� T��ng Phe Li�u/Get_L_UHT",
		"Trang ph�c Uy H� So�i Phe Li�u/Get_L_UHS",
		"Ra kh�i/nothing",
	};
	SelectSay(szSay);
end
 
--Get Tong UH Tuong
function Get_T_UHT()
	local ID1 = 20556; --ID Trang b� ��u ti�n UHT
	local ID2 = 10196; --ID Trang b� ��u ti�n ng�c b�i UHT
	
	ID = {[2] = 	{3, ID1, ID2},[3] = 	{8,ID1 + 2,ID2 + 2},[4] = 	{0,ID1 + 4,ID2 + 4},[6] = 	{1,ID1 + 6,ID2 + 6},[8]= 	{2,ID1 + 10,ID2 + 10},
		[9]= 	{10,ID1 + 12,ID2 + 12},[11]=	{0,ID1 + 14,ID2 + 14},[12]=	{5,ID1 + 18,ID2 + 18},[14]=	{2,ID1 + 22,ID2 + 22},[15]=	{9,ID1 + 26,ID2 + 26},
		[17]=	{6,ID1 + 30,ID2 + 30},[18]=	{4,ID1 + 34,ID2 + 34},[20]=	{7,ID1 + 38,ID2 + 38},[21]=	{11,ID1 + 42,ID2 + 42},[23]=	{2,ID1 + 46,ID2 + 46},
		[29]=	{13,ID1 + 46 + 14,ID2 + 46 + 16},[30]=	{12,ID1 + 46 + 16,ID2 + 46 + 16},
	};
	
	local nRoute = GetPlayerRoute();
	if nRoute == 8 or nRoute == 9 or nRoute == 29 or nRoute == 30 then
		nBody = GetBody() - 3;
	else
		nBody = GetBody() - 1;
	end
	
	for k, v in pairs(ID) do
		if nRoute == k then
			local nA = v[1];
			local nID = v[2] + nBody;
			local nNB = v[3] + nBody;
			
			AddItem(0, 103, nID, 1,1,-1,-1,-1,-1,-1,-1,1,15); --Trang Ph�c
			AddItem(0, 101, nID, 1,1,-1,-1,-1,-1,-1,-1,1,15);
			AddItem(0, 100, nID, 1,1,-1,-1,-1,-1,-1,-1,1,15);
			
			AddItem(0, 102, nNB, 1,1,-1,-1,-1,-1,-1,-1,1,15); -- Ng�c
			AddItem(0, 102, nNB + 64, 1,1,-1,-1,-1,-1,-1,-1,1,15);
			AddItem(0, 102, nNB + 64 * 2, 1,1,-1,-1,-1,-1,-1,-1,1,15);
					
			AddItem(0, nA, nID, 1,1,-1,-1,-1,-1,-1,-1,1,15); --V� Kh�
		end
	end
end

--Get Tong UH SOai
function Get_T_UHS()
	local ID1 = 20620; --ID Trang b� ��u ti�n UHS
	local ID2 = 10388; --ID Trang b� ��u ti�n ng�c b�i UHS
	
	ID = {[2] = 	{3, ID1, ID2},[3] = 	{8,ID1 + 2,ID2 + 2},[4] = 	{0,ID1 + 4,ID2 + 4},[6] = 	{1,ID1 + 6,ID2 + 6},[8]= 	{2,ID1 + 10,ID2 + 10},
		[9]= 	{10,ID1 + 12,ID2 + 12},[11]=	{0,ID1 + 14,ID2 + 14},[12]=	{5,ID1 + 18,ID2 + 18},[14]=	{2,ID1 + 22,ID2 + 22},[15]=	{9,ID1 + 26,ID2 + 26},
		[17]=	{6,ID1 + 30,ID2 + 30},[18]=	{4,ID1 + 34,ID2 + 34},[20]=	{7,ID1 + 38,ID2 + 38},[21]=	{11,ID1 + 42,ID2 + 42},[23]=	{2,ID1 + 46,ID2 + 46},
		[29]=	{13,ID1 + 46 + 14,ID2 + 46 + 16},[30]=	{12,ID1 + 46 + 16,ID2 + 46 + 16},
	};
	
	local nRoute = GetPlayerRoute();
	if nRoute == 8 or nRoute == 9 or nRoute == 29 or nRoute == 30 then
		nBody = GetBody() - 3;
	else
		nBody = GetBody() - 1;
	end
	
	for k, v in pairs(ID) do
		if nRoute == k then
			local nA = v[1];
			local nID = v[2] + nBody;
			local nNB = v[3] + nBody;
			
			AddItem(0, 103, nID, 1,1,-1,-1,-1,-1,-1,-1,1,15); --Trang Ph�c
			AddItem(0, 101, nID, 1,1,-1,-1,-1,-1,-1,-1,1,15);
			AddItem(0, 100, nID, 1,1,-1,-1,-1,-1,-1,-1,1,15);
			
			AddItem(0, 102, nNB, 1,1,-1,-1,-1,-1,-1,-1,1,15); -- Ng�c
			AddItem(0, 102, nNB + 64, 1,1,-1,-1,-1,-1,-1,-1,1,15);
			AddItem(0, 102, nNB + 64 * 2, 1,1,-1,-1,-1,-1,-1,-1,1,15);
			AddItem(0, 102, nNB + 64 * 3, 1,1,-1,-1,-1,-1,-1,-1,1,15); --So�i c� 4 Ng�c

			AddItem(0, nA, nID, 1,1,-1,-1,-1,-1,-1,-1,1,15); --V� Kh�
		end
	end
end

--Get Tong UH Tuong
function Get_L_UHT()
	local ID1 = 20684; --ID Trang b� ��u ti�n UHT
	local ID2 = 10644; --ID Trang b� ��u ti�n ng�c b�i UHT
	
	ID = {[2] = 	{3, ID1, ID2},[3] = 	{8,ID1 + 2,ID2 + 2},[4] = 	{0,ID1 + 4,ID2 + 4},[6] = 	{1,ID1 + 6,ID2 + 6},[8]= 	{2,ID1 + 10,ID2 + 10},
		[9]= 	{10,ID1 + 12,ID2 + 12},[11]=	{0,ID1 + 14,ID2 + 14},[12]=	{5,ID1 + 18,ID2 + 18},[14]=	{2,ID1 + 22,ID2 + 22},[15]=	{9,ID1 + 26,ID2 + 26},
		[17]=	{6,ID1 + 30,ID2 + 30},[18]=	{4,ID1 + 34,ID2 + 34},[20]=	{7,ID1 + 38,ID2 + 38},[21]=	{11,ID1 + 42,ID2 + 42},[23]=	{2,ID1 + 46,ID2 + 46},
		[29]=	{13,ID1 + 46 + 14,ID2 + 46 + 16},[30]=	{12,ID1 + 46 + 16,ID2 + 46 + 16},
	};
	
	local nRoute = GetPlayerRoute();
	if nRoute == 8 or nRoute == 9 or nRoute == 29 or nRoute == 30 then
		nBody = GetBody() - 3;
	else
		nBody = GetBody() - 1;
	end
	
	for k, v in pairs(ID) do
		if nRoute == k then
			local nA = v[1];
			local nID = v[2] + nBody;
			local nNB = v[3] + nBody;
			
			AddItem(0, 103, nID, 1,1,-1,-1,-1,-1,-1,-1,1,15); --Trang Ph�c
			AddItem(0, 101, nID, 1,1,-1,-1,-1,-1,-1,-1,1,15);
			AddItem(0, 100, nID, 1,1,-1,-1,-1,-1,-1,-1,1,15);
			AddItem(0, 102, nNB, 1,1,-1,-1,-1,-1,-1,-1,1,15); -- Ng�c
			AddItem(0, 102, nNB + 64, 1,1,-1,-1,-1,-1,-1,-1,1,15);
			AddItem(0, 102, nNB + 64 * 2, 1,1,-1,-1,-1,-1,-1,-1,1,15);	
			AddItem(0, nA, nID, 1,1,-1,-1,-1,-1,-1,-1,1,15); --V� Kh�
		end
	end
end

--Get Lieu UH SOai
function Get_L_UHS()
	local ID1 = 20748; --ID Trang b� ��u ti�n UHT
	local ID2 = 10836; --ID Trang b� ��u ti�n ng�c b�i UHT
	
	ID = {[2] = 	{3, ID1, ID2},[3] = 	{8,ID1 + 2,ID2 + 2},[4] = 	{0,ID1 + 4,ID2 + 4},[6] = 	{1,ID1 + 6,ID2 + 6},[8]= 	{2,ID1 + 10,ID2 + 10},
		[9]= 	{10,ID1 + 12,ID2 + 12},[11]=	{0,ID1 + 14,ID2 + 14},[12]=	{5,ID1 + 18,ID2 + 18},[14]=	{2,ID1 + 22,ID2 + 22},[15]=	{9,ID1 + 26,ID2 + 26},
		[17]=	{6,ID1 + 30,ID2 + 30},[18]=	{4,ID1 + 34,ID2 + 34},[20]=	{7,ID1 + 38,ID2 + 38},[21]=	{11,ID1 + 42,ID2 + 42},[23]=	{2,ID1 + 46,ID2 + 46},
		[29]=	{13,ID1 + 46 + 14,ID2 + 46 + 16},[30]=	{12,ID1 + 46 + 16,ID2 + 46 + 16},
	};
	
	local nRoute = GetPlayerRoute();
	if nRoute == 8 or nRoute == 9 or nRoute == 29 or nRoute == 30 then
		nBody = GetBody() - 3;
	else
		nBody = GetBody() - 1;
	end
	
	for k, v in pairs(ID) do
		if nRoute == k then
			local nA = v[1];
			local nID = v[2] + nBody;
			local nNB = v[3] + nBody;
			
			AddItem(0, 103, nID, 1,1,-1,-1,-1,-1,-1,-1,1,15); --Trang Ph�c
			AddItem(0, 101, nID, 1,1,-1,-1,-1,-1,-1,-1,1,15);
			AddItem(0, 100, nID, 1,1,-1,-1,-1,-1,-1,-1,1,15);	
			AddItem(0, 102, nNB, 1,1,-1,-1,-1,-1,-1,-1,1,15); -- Ng�c
			AddItem(0, 102, nNB + 64, 1,1,-1,-1,-1,-1,-1,-1,1,15);
			AddItem(0, 102, nNB + 64 * 2, 1,1,-1,-1,-1,-1,-1,-1,1,15);
			AddItem(0, 102, nNB + 64 * 3, 1,1,-1,-1,-1,-1,-1,-1,1,15); --So�i c� 4 Ng�c		
			AddItem(0, nA, nID, 1,1,-1,-1,-1,-1,-1,-1,1,15); --V� Kh�
		end
	end
end


--Trang bi THANH LONG
function Get_CT_TL()
	local szSay = {
		g_szTitle.."L�a ch�n trang b�",
		"Trang ph�c Thanh Long T��ng Phe T�ng/Get_T_TLT",
		"Trang ph�c Thanh Long So�i Phe T�ng/Get_T_TLS",
		"Trang ph�c Thanh Long T��ng Phe Li�u/Get_L_TLT",
		"Trang ph�c Thanh Long So�i Phe Li�u/Get_L_TLS",
		"Ra kh�i/nothing",
	};
	SelectSay(szSay);
end
 
--Get Tong TL Tuong
function Get_T_TLT()
	local ID1 = 20300; --ID Trang b� ��u ti�n
	local ID2 = 9300; --ID Trang b� ��u ti�n ng�c b�i
	
	ID = {[2] = 	{3, ID1, ID2},[3] = 	{8,ID1 + 2,ID2 + 2},[4] = 	{0,ID1 + 4,ID2 + 4},[6] = 	{1,ID1 + 6,ID2 + 6},[8]= 	{2,ID1 + 10,ID2 + 10},
		[9]= 	{10,ID1 + 12,ID2 + 12},[11]=	{0,ID1 + 14,ID2 + 14},[12]=	{5,ID1 + 18,ID2 + 18},[14]=	{2,ID1 + 22,ID2 + 22},[15]=	{9,ID1 + 26,ID2 + 26},
		[17]=	{6,ID1 + 30,ID2 + 30},[18]=	{4,ID1 + 34,ID2 + 34},[20]=	{7,ID1 + 38,ID2 + 38},[21]=	{11,ID1 + 42,ID2 + 42},[23]=	{2,ID1 + 46,ID2 + 46},
		[29]=	{13,ID1 + 46 + 14,ID2 + 46 + 16},[30]=	{12,ID1 + 46 + 16,ID2 + 46 + 16},
	};
	
	local nRoute = GetPlayerRoute();
	if nRoute == 8 or nRoute == 9 or nRoute == 29 or nRoute == 30 then
		nBody = GetBody() - 3;
	else
		nBody = GetBody() - 1;
	end
	
	for k, v in pairs(ID) do
		if nRoute == k then
			local nA = v[1];
			local nID = v[2] + nBody;
			local nNB = v[3] + nBody;
			
			AddItem(0, 103, nID, 1,1,-1,-1,-1,-1,-1,-1,1,15); --Trang Ph�c
			AddItem(0, 101, nID, 1,1,-1,-1,-1,-1,-1,-1,1,15);
			AddItem(0, 100, nID, 1,1,-1,-1,-1,-1,-1,-1,1,15);
			
			AddItem(0, 102, nNB, 1,1,-1,-1,-1,-1,-1,-1,1,15); -- Ng�c
			AddItem(0, 102, nNB + 64, 1,1,-1,-1,-1,-1,-1,-1,1,15);
			AddItem(0, 102, nNB + 64 * 2, 1,1,-1,-1,-1,-1,-1,-1,1,15);
					
			AddItem(0, nA, nID, 1,1,-1,-1,-1,-1,-1,-1,1,15); --V� Kh�
		end
	end
end

--Get Tong TL SOai
function Get_T_TLS()
	local ID1 = 20364; --ID Trang b� ��u ti�n
	local ID2 = 9556; --ID Trang b� ��u ti�n ng�c b�i
	
	ID = {[2] = 	{3, ID1, ID2},[3] = 	{8,ID1 + 2,ID2 + 2},[4] = 	{0,ID1 + 4,ID2 + 4},[6] = 	{1,ID1 + 6,ID2 + 6},[8]= 	{2,ID1 + 10,ID2 + 10},
		[9]= 	{10,ID1 + 12,ID2 + 12},[11]=	{0,ID1 + 14,ID2 + 14},[12]=	{5,ID1 + 18,ID2 + 18},[14]=	{2,ID1 + 22,ID2 + 22},[15]=	{9,ID1 + 26,ID2 + 26},
		[17]=	{6,ID1 + 30,ID2 + 30},[18]=	{4,ID1 + 34,ID2 + 34},[20]=	{7,ID1 + 38,ID2 + 38},[21]=	{11,ID1 + 42,ID2 + 42},[23]=	{2,ID1 + 46,ID2 + 46},
		[29]=	{13,ID1 + 46 + 14,ID2 + 46 + 16},[30]=	{12,ID1 + 46 + 16,ID2 + 46 + 16},
	};
	
	local nRoute = GetPlayerRoute();
	if nRoute == 8 or nRoute == 9 or nRoute == 29 or nRoute == 30 then
		nBody = GetBody() - 3;
	else
		nBody = GetBody() - 1;
	end
	
	for k, v in pairs(ID) do
		if nRoute == k then
			local nA = v[1];
			local nID = v[2] + nBody;
			local nNB = v[3] + nBody;
			
			AddItem(0, 103, nID, 1,1,-1,-1,-1,-1,-1,-1,1,15); --Trang Ph�c
			AddItem(0, 101, nID, 1,1,-1,-1,-1,-1,-1,-1,1,15);
			AddItem(0, 100, nID, 1,1,-1,-1,-1,-1,-1,-1,1,15);
			
			AddItem(0, 102, nNB, 1,1,-1,-1,-1,-1,-1,-1,1,15); -- Ng�c
			AddItem(0, 102, nNB + 64, 1,1,-1,-1,-1,-1,-1,-1,1,15);
			AddItem(0, 102, nNB + 64 * 2, 1,1,-1,-1,-1,-1,-1,-1,1,15);
			AddItem(0, 102, nNB + 64 * 3, 1,1,-1,-1,-1,-1,-1,-1,1,15); --So�i c� 4 Ng�c

			AddItem(0, nA, nID, 1,1,-1,-1,-1,-1,-1,-1,1,15); --V� Kh�
		end
	end
end

--Get Lieu TL Tuong
function Get_L_TLT()
	local ID1 = 20428; --ID Trang b� ��u ti�n
	local ID2 = 10644; --ID Trang b� ��u ti�n ng�c b�i 
	
	ID = {[2] = 	{3, ID1, ID2},[3] = 	{8,ID1 + 2,ID2 + 2},[4] = 	{0,ID1 + 4,ID2 + 4},[6] = 	{1,ID1 + 6,ID2 + 6},[8]= 	{2,ID1 + 10,ID2 + 10},
		[9]= 	{10,ID1 + 12,ID2 + 12},[11]=	{0,ID1 + 14,ID2 + 14},[12]=	{5,ID1 + 18,ID2 + 18},[14]=	{2,ID1 + 22,ID2 + 22},[15]=	{9,ID1 + 26,ID2 + 26},
		[17]=	{6,ID1 + 30,ID2 + 30},[18]=	{4,ID1 + 34,ID2 + 34},[20]=	{7,ID1 + 38,ID2 + 38},[21]=	{11,ID1 + 42,ID2 + 42},[23]=	{2,ID1 + 46,ID2 + 46},
		[29]=	{13,ID1 + 46 + 14,ID2 + 46 + 16},[30]=	{12,ID1 + 46 + 16,ID2 + 46 + 16},
	};
	
	local nRoute = GetPlayerRoute();
	if nRoute == 8 or nRoute == 9 or nRoute == 29 or nRoute == 30 then
		nBody = GetBody() - 3;
	else
		nBody = GetBody() - 1;
	end
	
	for k, v in pairs(ID) do
		if nRoute == k then
			local nA = v[1];
			local nID = v[2] + nBody;
			local nNB = v[3] + nBody;
			
			AddItem(0, 103, nID, 1,1,-1,-1,-1,-1,-1,-1,1,15); --Trang Ph�c
			AddItem(0, 101, nID, 1,1,-1,-1,-1,-1,-1,-1,1,15);
			AddItem(0, 100, nID, 1,1,-1,-1,-1,-1,-1,-1,1,15);
			AddItem(0, 102, nNB, 1,1,-1,-1,-1,-1,-1,-1,1,15); -- Ng�c
			AddItem(0, 102, nNB + 64, 1,1,-1,-1,-1,-1,-1,-1,1,15);
			AddItem(0, 102, nNB + 64 * 2, 1,1,-1,-1,-1,-1,-1,-1,1,15);	
			AddItem(0, nA, nID, 1,1,-1,-1,-1,-1,-1,-1,1,15); --V� Kh�
		end
	end
end

--Get Lieu TL Soai
function Get_L_TLS()
	local ID1 = 20492; --ID Trang b� ��u ti�n
	local ID2 = 9940; --ID Trang b� ��u ti�n ng�c b�i
	
	ID = {[2] = 	{3, ID1, ID2},[3] = 	{8,ID1 + 2,ID2 + 2},[4] = 	{0,ID1 + 4,ID2 + 4},[6] = 	{1,ID1 + 6,ID2 + 6},[8]= 	{2,ID1 + 10,ID2 + 10},
		[9]= 	{10,ID1 + 12,ID2 + 12},[11]=	{0,ID1 + 14,ID2 + 14},[12]=	{5,ID1 + 18,ID2 + 18},[14]=	{2,ID1 + 22,ID2 + 22},[15]=	{9,ID1 + 26,ID2 + 26},
		[17]=	{6,ID1 + 30,ID2 + 30},[18]=	{4,ID1 + 34,ID2 + 34},[20]=	{7,ID1 + 38,ID2 + 38},[21]=	{11,ID1 + 42,ID2 + 42},[23]=	{2,ID1 + 46,ID2 + 46},
		[29]=	{13,ID1 + 46 + 14,ID2 + 46 + 16},[30]=	{12,ID1 + 46 + 16,ID2 + 46 + 16},
	};
	
	local nRoute = GetPlayerRoute();
	if nRoute == 8 or nRoute == 9 or nRoute == 29 or nRoute == 30 then
		nBody = GetBody() - 3;
	else
		nBody = GetBody() - 1;
	end
	
	for k, v in pairs(ID) do
		if nRoute == k then
			local nA = v[1];
			local nID = v[2] + nBody;
			local nNB = v[3] + nBody;
			
			AddItem(0, 103, nID, 1,1,-1,-1,-1,-1,-1,-1,1,15); --Trang Ph�c
			AddItem(0, 101, nID, 1,1,-1,-1,-1,-1,-1,-1,1,15);
			AddItem(0, 100, nID, 1,1,-1,-1,-1,-1,-1,-1,1,15);	
			AddItem(0, 102, nNB, 1,1,-1,-1,-1,-1,-1,-1,1,15); -- Ng�c
			AddItem(0, 102, nNB + 64, 1,1,-1,-1,-1,-1,-1,-1,1,15);
			AddItem(0, 102, nNB + 64 * 2, 1,1,-1,-1,-1,-1,-1,-1,1,15);
			AddItem(0, 102, nNB + 64 * 3, 1,1,-1,-1,-1,-1,-1,-1,1,15); --So�i c� 4 Ng�c		
			AddItem(0, nA, nID, 1,1,-1,-1,-1,-1,-1,-1,1,15); --V� Kh�
		end
	end
end


--Trang bi Hoa Phung
function Get_CT_HP()
	local szSay = {
		g_szTitle.."L�a ch�n trang b�",
		"Trang ph�c H�a Ph�ng T��ng Phe T�ng/Get_T_HPT",
		"Trang ph�c H�a Ph�ng So�i Phe T�ng/Get_T_HPS",
		"Trang ph�c H�a Ph�ng T��ng Phe Li�u/Get_L_HPT",
		"Trang ph�c H�a Ph�ng So�i Phe Li�u/Get_L_HPS",
		"Ra kh�i/nothing",
	};
	SelectSay(szSay);
end
 
--Get Tong HP Tuong
function Get_T_HPT()
	local ID1 = 30311; --ID Trang b� ��u ti�n
	local ID2 = 30228; --ID Trang b� ��u ti�n ng�c b�i
	
	ID = {[2] = 	{3, ID1, ID2},[3] = 	{8,ID1 + 2,ID2 + 2},[4] = 	{0,ID1 + 4,ID2 + 4},[6] = 	{1,ID1 + 6,ID2 + 6},[8]= 	{2,ID1 + 10,ID2 + 10},
		[9]= 	{10,ID1 + 12,ID2 + 12},[11]=	{0,ID1 + 14,ID2 + 14},[12]=	{5,ID1 + 18,ID2 + 18},[14]=	{2,ID1 + 22,ID2 + 22},[15]=	{9,ID1 + 26,ID2 + 26},
		[17]=	{6,ID1 + 30,ID2 + 30},[18]=	{4,ID1 + 34,ID2 + 34},[20]=	{7,ID1 + 38,ID2 + 38},[21]=	{11,ID1 + 42,ID2 + 42},[23]=	{2,ID1 + 46,ID2 + 46},
		[29]=	{13,ID1 + 46 + 14,ID2 + 46 + 16},[30]=	{12,ID1 + 46 + 16,ID2 + 46 + 16},
	};
	
	local nRoute = GetPlayerRoute();
	if nRoute == 8 or nRoute == 9 or nRoute == 29 or nRoute == 30 then
		nBody = GetBody() - 3;
	else
		nBody = GetBody() - 1;
	end
	
	for k, v in pairs(ID) do
		if nRoute == k then
			local nA = v[1];
			local nID = v[2] + nBody;
			local nNB = v[3] + nBody;
			
			AddItem(0, 103, nID, 1,1,-1,-1,-1,-1,-1,-1,1,15); --Trang Ph�c
			AddItem(0, 101, nID, 1,1,-1,-1,-1,-1,-1,-1,1,15);
			AddItem(0, 100, nID, 1,1,-1,-1,-1,-1,-1,-1,1,15);
			
			AddItem(0, 102, nNB, 1,1,-1,-1,-1,-1,-1,-1,1,15); -- Ng�c
			AddItem(0, 102, nNB + 64, 1,1,-1,-1,-1,-1,-1,-1,1,15);
			AddItem(0, 102, nNB + 64 * 2, 1,1,-1,-1,-1,-1,-1,-1,1,15);
					
			--AddItem(0, nA, nID, 1,1,-1,-1,-1,-1,-1,-1,1,15); --V� Kh�
		end
	end
end

--Get Tong HP SOai
function Get_T_HPS()
	local ID1 = 30375	; --ID Trang b� ��u ti�n
	local ID2 = 30420	; --ID Trang b� ��u ti�n ng�c b�i
	
	ID = {[2] = 	{3, ID1, ID2},[3] = 	{8,ID1 + 2,ID2 + 2},[4] = 	{0,ID1 + 4,ID2 + 4},[6] = 	{1,ID1 + 6,ID2 + 6},[8]= 	{2,ID1 + 10,ID2 + 10},
		[9]= 	{10,ID1 + 12,ID2 + 12},[11]=	{0,ID1 + 14,ID2 + 14},[12]=	{5,ID1 + 18,ID2 + 18},[14]=	{2,ID1 + 22,ID2 + 22},[15]=	{9,ID1 + 26,ID2 + 26},
		[17]=	{6,ID1 + 30,ID2 + 30},[18]=	{4,ID1 + 34,ID2 + 34},[20]=	{7,ID1 + 38,ID2 + 38},[21]=	{11,ID1 + 42,ID2 + 42},[23]=	{2,ID1 + 46,ID2 + 46},
		[29]=	{13,ID1 + 46 + 14,ID2 + 46 + 16},[30]=	{12,ID1 + 46 + 16,ID2 + 46 + 16},
	};
	
	local nRoute = GetPlayerRoute();
	if nRoute == 8 or nRoute == 9 or nRoute == 29 or nRoute == 30 then
		nBody = GetBody() - 3;
	else
		nBody = GetBody() - 1;
	end
	
	for k, v in pairs(ID) do
		if nRoute == k then
			local nA = v[1];
			local nID = v[2] + nBody;
			local nNB = v[3] + nBody;
			
			AddItem(0, 103, nID, 1,1,-1,-1,-1,-1,-1,-1,1,15); --Trang Ph�c
			AddItem(0, 101, nID, 1,1,-1,-1,-1,-1,-1,-1,1,15);
			AddItem(0, 100, nID, 1,1,-1,-1,-1,-1,-1,-1,1,15);
			
			AddItem(0, 102, nNB, 1,1,-1,-1,-1,-1,-1,-1,1,15); -- Ng�c
			AddItem(0, 102, nNB + 64, 1,1,-1,-1,-1,-1,-1,-1,1,15);
			AddItem(0, 102, nNB + 64 * 2, 1,1,-1,-1,-1,-1,-1,-1,1,15);
			AddItem(0, 102, nNB + 64 * 3, 1,1,-1,-1,-1,-1,-1,-1,1,15); --So�i c� 4 Ng�c

			--AddItem(0, nA, nID, 1,1,-1,-1,-1,-1,-1,-1,1,15); --V� Kh�
		end
	end
end

--Get Lieu HP Tuong
function Get_L_HPT()
	local ID1 = 30439; --ID Trang b� ��u ti�n
	local ID2 = 30676; --ID Trang b� ��u ti�n ng�c b�i 
	
	ID = {[2] = 	{3, ID1, ID2},[3] = 	{8,ID1 + 2,ID2 + 2},[4] = 	{0,ID1 + 4,ID2 + 4},[6] = 	{1,ID1 + 6,ID2 + 6},[8]= 	{2,ID1 + 10,ID2 + 10},
		[9]= 	{10,ID1 + 12,ID2 + 12},[11]=	{0,ID1 + 14,ID2 + 14},[12]=	{5,ID1 + 18,ID2 + 18},[14]=	{2,ID1 + 22,ID2 + 22},[15]=	{9,ID1 + 26,ID2 + 26},
		[17]=	{6,ID1 + 30,ID2 + 30},[18]=	{4,ID1 + 34,ID2 + 34},[20]=	{7,ID1 + 38,ID2 + 38},[21]=	{11,ID1 + 42,ID2 + 42},[23]=	{2,ID1 + 46,ID2 + 46},
		[29]=	{13,ID1 + 46 + 14,ID2 + 46 + 16},[30]=	{12,ID1 + 46 + 16,ID2 + 46 + 16},
	};
	
	local nRoute = GetPlayerRoute();
	if nRoute == 8 or nRoute == 9 or nRoute == 29 or nRoute == 30 then
		nBody = GetBody() - 3;
	else
		nBody = GetBody() - 1;
	end
	
	for k, v in pairs(ID) do
		if nRoute == k then
			local nA = v[1];
			local nID = v[2] + nBody;
			local nNB = v[3] + nBody;
			
			AddItem(0, 103, nID, 1,1,-1,-1,-1,-1,-1,-1,1,15); --Trang Ph�c
			AddItem(0, 101, nID, 1,1,-1,-1,-1,-1,-1,-1,1,15);
			AddItem(0, 100, nID, 1,1,-1,-1,-1,-1,-1,-1,1,15);
			AddItem(0, 102, nNB, 1,1,-1,-1,-1,-1,-1,-1,1,15); -- Ng�c
			AddItem(0, 102, nNB + 64, 1,1,-1,-1,-1,-1,-1,-1,1,15);
			AddItem(0, 102, nNB + 64 * 2, 1,1,-1,-1,-1,-1,-1,-1,1,15);	
			--AddItem(0, nA, nID, 1,1,-1,-1,-1,-1,-1,-1,1,15); --V� Kh�
		end
	end
end

--Get Lieu HP Soai
function Get_L_HPS()
	local ID1 = 30503; --ID Trang b� ��u ti�n
	local ID2 = 30868; --ID Trang b� ��u ti�n ng�c b�i
	
	ID = {[2] = 	{3, ID1, ID2},[3] = 	{8,ID1 + 2,ID2 + 2},[4] = 	{0,ID1 + 4,ID2 + 4},[6] = 	{1,ID1 + 6,ID2 + 6},[8]= 	{2,ID1 + 10,ID2 + 10},
		[9]= 	{10,ID1 + 12,ID2 + 12},[11]=	{0,ID1 + 14,ID2 + 14},[12]=	{5,ID1 + 18,ID2 + 18},[14]=	{2,ID1 + 22,ID2 + 22},[15]=	{9,ID1 + 26,ID2 + 26},
		[17]=	{6,ID1 + 30,ID2 + 30},[18]=	{4,ID1 + 34,ID2 + 34},[20]=	{7,ID1 + 38,ID2 + 38},[21]=	{11,ID1 + 42,ID2 + 42},[23]=	{2,ID1 + 46,ID2 + 46},
		[29]=	{13,ID1 + 46 + 14,ID2 + 46 + 16},[30]=	{12,ID1 + 46 + 16,ID2 + 46 + 16},
	};
	
	local nRoute = GetPlayerRoute();
	if nRoute == 8 or nRoute == 9 or nRoute == 29 or nRoute == 30 then
		nBody = GetBody() - 3;
	else
		nBody = GetBody() - 1;
	end
	
	for k, v in pairs(ID) do
		if nRoute == k then
			local nA = v[1];
			local nID = v[2] + nBody;
			local nNB = v[3] + nBody;
			
			AddItem(0, 103, nID, 1,1,-1,-1,-1,-1,-1,-1,1,15); --Trang Ph�c
			AddItem(0, 101, nID, 1,1,-1,-1,-1,-1,-1,-1,1,15);
			AddItem(0, 100, nID, 1,1,-1,-1,-1,-1,-1,-1,1,15);	
			AddItem(0, 102, nNB, 1,1,-1,-1,-1,-1,-1,-1,1,15); -- Ng�c
			AddItem(0, 102, nNB + 64, 1,1,-1,-1,-1,-1,-1,-1,1,15);
			AddItem(0, 102, nNB + 64 * 2, 1,1,-1,-1,-1,-1,-1,-1,1,15);
			AddItem(0, 102, nNB + 64 * 3, 1,1,-1,-1,-1,-1,-1,-1,1,15); --So�i c� 4 Ng�c		
			--AddItem(0, nA, nID, 1,1,-1,-1,-1,-1,-1,-1,1,15); --V� Kh�
		end
	end
end



--TRANG BI TIEU DUNG
function Get_TieuDung()
	local szSay = {
		g_szTitle.."L�a ch�n",
		"Nh�n 10000 v�ng/Get_Money",
		"Nh�n �� Qu�/Get_Gem",
		"Trang b� T�y Kim X�/Get_TKX",
		format("%s/getTianJiaoLing", "Nh�n Thi�n Ki�u L�nh"),
		"Ra kh�i/nothing",
	};
	SelectSay(szSay);	
end

--DA Quy
function Get_Gem()
	if gf_Judge_Room_Weight(4, 100, " ") ~= 1 then
		return 0;
	end
	
	AddItem(2, 22, 101, 100);
	AddItem(2, 22, 102, 100);
	AddItem(2, 22, 103, 100);
	AddItem(2, 22, 104, 100);
	AddItem(2, 22, 107, 100);
	WriteLogEx("Get_Gem","Nh�n �� qu�", 100, "Huy�tTr�chTh�ch Lv7");
	AddItem(2, 22, 201, 100);
	AddItem(2, 22, 202, 100);
	AddItem(2, 22, 203, 100);
	AddItem(2, 22, 204, 100);
	AddItem(2, 22, 207, 100);
	WriteLogEx("Get_Gem","Nh�n �� qu�", 100, "Nguy�tB�chTh�ch Lv7");
	AddItem(2, 22, 301, 100);
	AddItem(2, 22, 302, 100);
	AddItem(2, 22, 303, 100);
	AddItem(2, 22, 304, 100);
	AddItem(2, 22, 307, 100);
	WriteLogEx("Get_Gem","Nh�n �� qu�", 100, "H� Ph�ch Th�ch Lv7");
	AddItem(2, 22, 401, 100);	
	AddItem(2, 22, 402, 100);	
	AddItem(2, 22, 403, 100);	
	AddItem(2, 22, 404, 100);
	AddItem(2, 22, 407, 100);	
	WriteLogEx("Get_Gem","Nh�n �� qu�", 100, "H�c Di�u Th�ch Lv7");
end

function Get_Money()
	Earn(100000000);
end

---Thi�n Khi�u L�nh---
function getTianJiaoLing()
	AddItem(2,97,236,999)
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

---H�i th� l�c----
function getTiLi()
	RestoreStamina()
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end


--CHUC NANG KHAC
--Pet---
function Pet_OP()
	local tSay = {}
	if GetSkillLevel(30149) == 0 then
		tinsert(tSay, format("%s/activePet", "K�ch ho�t ph�c sinh th� c�ng"))
	end
	tinsert(tSay, format("%s/getPetEgg", "Nh�n Tr�ng Th� C�ng"))
	tinsert(tSay, format("%s/getLingLi", "Nh�n �i�m linh l�c"))
	tinsert(tSay, "T�i h� ch� xem qua th�i/nothing");
	Say(g_szTitle.."Ng��i c�n gi�p �� g�?", getn(tSay), tSay);
end

function activePet()
	local nId = 30149
	if GetSkillLevel(nId) == 0 then
		LearnSkill(nId)
		for i = 1,4 do
			LevelUpSkill(nId)
		end
		
		Msg2Player("�� h�c Gi�ng Linh Thu�t c�p 5");
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
	end
end

function getPetEgg()
	AddItem(2,1,30601,10)
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
		Msg2Player(format("Nh�n th�nh c�ng %d linh l�c", nAdd))
	end
end

----Gia nh�p Ph�i----
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
	local tMenu = {
		"Thi�u L�m/join_sl",
		"V� �ang/join_wd",
		"Nga My/join_em",
		"C�i Bang/join_gb",
		"���ng M�n/join_tm",
		"D��ng M�n/join_ym",
		"Ng� ��c/join_wdu",
		"C�n L�n/join_kl",
		"Th�y Y�n/join_cy",
		"Ra kh�i/nothing",
	};
	Say("Ng��i mu�n gia nh�p l�u ph�i g�?", getn(tMenu), tMenu);
end

function join_sl()
	if GetSex() == 2 then
		Say(g_szTitle.."Ph�i Thi�u L�m ch� thu nh�n �� t� nam", 0);
		return
	end

	local szSay = {
		g_szTitle.."Ng��i mu�n gia nh�p l�u ph�i g�?",
		"Thi�u L�m v� t�ng/#enter_mp(4)",
		"Thi�u L�m thi�n t�ng/#enter_mp(3)",
		"Thi�u L�m t�c gia/#enter_mp(2)",
		"Ra kh�i/nothing",
	};

	SelectSay(szSay);
end;

function join_wd()

	local szSay = {
		g_szTitle.."Ng��i mu�n gia nh�p l�u ph�i g�?",
		"V� �ang ��o gia/#enter_mp(14)",
		"V� �ang t�c gia/#enter_mp(15)",
		"Ra kh�i/nothing",
	};

	SelectSay(szSay);
end;

function join_em()

	if GetPlayerFaction() ~= 0 then
		return
	end

	local szSay = {
		g_szTitle.."Ng��i mu�n gia nh�p l�u ph�i g�?",
		"Nga My ph�t gia/#enter_mp(8)",
		"Nga My t�c gia/#enter_mp(9)",
		"Ra kh�i/nothing",
	};

	SelectSay(szSay);
end;

function join_gb()

	local szSay = {
		g_szTitle.."Ng��i mu�n gia nh�p l�u ph�i g�?",
		"C�i Bang T�nh y/#enter_mp(11)",
		"C�i Bang � Y/#enter_mp(12)",
		"Ra kh�i/nothing",
	};
	SelectSay(szSay);
end;

function join_tm()

	local szSay = {
		g_szTitle.."Ng��i mu�n gia nh�p l�u ph�i g�?",
		"���ng M�n/#enter_mp(6)",
		"Ra kh�i/nothing",
	};
	SelectSay(szSay);
end;

function join_ym()

	local szSay = {
		g_szTitle.."Ng��i mu�n gia nh�p l�u ph�i g�?",
		"D��ng M�n th��ng K�/#enter_mp(17)",
		"D��ng M�n Cung K�/#enter_mp(18)",
		"Ra kh�i/nothing",
	};
	SelectSay(szSay);
end;

function join_wdu()

	local szSay = {
		g_szTitle.."Ng��i mu�n gia nh�p l�u ph�i g�?",
		"Hi�p ��c/#enter_mp(20)",
		"T� ��c/#enter_mp(21)",
		"Ra kh�i/nothing",
	};
	SelectSay(szSay);
end;

function join_kl()
	if GetSex()==2 then
		Talk(1,"","C�n L�n kh�ng thu nh�n �� t� n�!");
		return 0
	end

	local szSay = {
		g_szTitle.."Ng��i mu�n gia nh�p l�u ph�i g�?",
		"C�n L�n Thi�n S�/#enter_mp(23)",
		"Ra kh�i/nothing",
	};
	SelectSay(szSay);
end;

function join_cy()
	if GetSex()==1 then
		Talk(1,"","Th�y Y�n kh�ng thu nh�n �� t� nam!");
		return 0
	end

	local szSay = {
		g_szTitle.."Ng��i mu�n gia nh�p l�u ph�i g�?",
		"Th�y Y�n V� Ti�n/#enter_mp(29)",
		"Th�y Y�n Linh N�/#enter_mp(30)",
		"Ra kh�i/nothing",
	};
	SelectSay(szSay);
end;

function enter_mp(nRoute)
	local nBegin = 0;
	local nEnd = 0;
	local nBody = GetBody(); --1=�����У�2=�����У�3=�Ը�Ů��4=��СŮ

	SetPlayerRoute(nRoute);						--��������

	if nRoute == 2 then						--�����׼�
		LearnSkill(3);
		LearnSkill(5);
		LearnSkill(32);
		nBegin = 21;
		nEnd = 31;
	elseif nRoute == 3 then					--������ɮ
		LearnSkill(6);
		LearnSkill(57);
		nBegin = 45;
		nEnd = 56;
	elseif nRoute == 4 then					--������ɮ
		LearnSkill(2);
		LearnSkill(44);
		nBegin = 33;
		nEnd = 43;
	elseif nRoute == 14 then					--�䵱����
		LearnSkill(4);
		LearnSkill(146);
		nBegin = 125;
		nEnd = 145;
	elseif nRoute == 15 then					--�䵱�׼�
		LearnSkill(5);
		LearnSkill(159);
		nBegin = 147;
		nEnd = 158;
	elseif nRoute == 8 then					--���ҷ��
		LearnSkill(4);
		LearnSkill(89);
		nBegin = 75
		nEnd = 88;
	elseif nRoute == 9 then					--�����׼�
		LearnSkill(10);
		LearnSkill(102);
		nBegin = 90
		nEnd = 101;
	elseif nRoute == 11 then					--ؤ�ﾻ��
		LearnSkill(2);
		LearnSkill(113);
		nBegin = 103
		nEnd = 112;
	elseif nRoute == 12 then					--ؤ������
		LearnSkill(5);
		LearnSkill(124);
		nBegin = 114
		nEnd = 123;
	elseif nRoute == 6 then					--����
		LearnSkill(7);
		LearnSkill(74);
		nBegin = 58
		nEnd = 73;
	elseif nRoute == 17 then					--����ǹ��
		LearnSkill(11);
		LearnSkill(732);
		nBegin = 720;
		nEnd = 731;
	elseif nRoute == 18 then					--���Ź���
		LearnSkill(12);
		LearnSkill(745);
		nBegin = 733;
		nEnd = 744;
	elseif nRoute == 20 then					--�嶾а��
		LearnSkill(13);
		LearnSkill(775);
		nBegin = 364;
		nEnd = 377;
	elseif nRoute == 21 then					--�嶾��ʦ
		LearnSkill(14);
		LearnSkill(774);
		nBegin = 347;
		nEnd = 363;
	elseif nRoute == 23 then					--������ʦ
		LearnSkill(4);
		LearnSkill(1032);
		nBegin = 1017 ;
		nEnd = 1031;
	elseif nRoute == 25 then					--����ʥս
		LearnSkill(3);
		LearnSkill(1066);
		nBegin = 1053 ;
		nEnd = 1065;
	elseif nRoute == 26 then					--�������
		LearnSkill(8);
		LearnSkill(1096);
		nBegin = 1083 ;
		nEnd = 1095;
	elseif nRoute == 27 then					--����Ѫ��
		LearnSkill(14);
		LearnSkill(1213);
		nBegin = 1131 ;
		nEnd = 1143;
	elseif nRoute == 29 then					--��������
		LearnSkill(15);
		LearnSkill(1196);
		nBegin = 1165 ;
		nEnd = 1176;
	elseif nRoute == 30 then					--������Ů
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

	----------------------------������ֵ------------
	ModifyReputation(1000000,0);			--Danh v�ng
	SetTask(336, 1000000);  --S� M�n
	SetTask(704, 6)  --Nguy�n So�i
	SetTask(701, 5000000); --C�ng tr�ng
	PlayerReborn(2, random(4));			--Chuy�n sinh
	gf_SetTaskByte(1538, 1, 5) 			--5ת
	SetLevel(99, 1);								--C�p
	ModifyExp(2000000000);
	AddTitle(65,2);
	
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
	Msg2Player("Thao t�c th�nh c�ng, h�y ��ng nh�p l�i")
	Talk(1,"","Thao t�c th�nh c�ng, h�y ��ng nh�p l�i")
end


--Mat Tich
function Get_Book()
	local szSay = {
		g_szTitle.."Nh�n L�u Ph�i Ch�n Quy�n v� Quy�t Y�u!",
		"Nh�n Ch�n Quy�n/Get_Book_ZhenJuan",
		"Nh�n Quy�t Y�u/Get_Book_JueYao",
		"Th�ng c�p m�t t�ch �� trang b�/Get_Book_Update",
		"T�ng ch� s� l�n 250%/Get_250book",
		"Ra kh�i/nothing",
	};
	SelectSay(szSay);
end

function Get_250book()
	CastState("state_add_book_attribute_value", 250, -1, -1);
end

function Get_Book_ZhenJuan()
	if gf_Judge_Room_Weight(7, 1, g_szTitle) ~= 1 then
		return 0;
	end

	local nRoute	= GetPlayerRoute();
	
	if nRoute == 2 then
		AddItem(0, 107, 30018,5)
	end
	
	if nRoute == 3 then
		AddItem(0, 107, 30020,5)
	end
	
	if nRoute == 4 then
		AddItem(0, 107, 30019,5)
	end
	
	if nRoute == 6 then
		AddItem(0, 107, 30021,5)
	end
	
		if nRoute == 8 then
		AddItem(0, 107, 30022,5)
	end
	
		if nRoute == 9 then
		AddItem(0, 107, 30023,5)
	end
	
		if nRoute == 11 then
		AddItem(0, 107, 30024,5)
	end
	
		if nRoute == 12 then
		AddItem(0, 107, 30025,5)
	end
	
		if nRoute == 14 then
		AddItem(0, 107, 30026,5)
	end
	
		if nRoute == 15 then
		AddItem(0, 107, 30027,5)
	end
	
		if nRoute == 17 then
		AddItem(0, 107, 30028,5)
	end
	
		if nRoute == 18 then
		AddItem(0, 107, 30029,5)
	end
	
		if nRoute == 20 then
		AddItem(0, 107, 30030,5)
	end
	
		if nRoute == 21 then
		AddItem(0, 107, 30031,5)
	end
	
	if nRoute == 23 then
		AddItem(0, 107, 30032,5)
	end
	
	if nRoute == 29 then
		AddItem(0, 107, 30033,5)
	end
	
	if nRoute == 30 then
		AddItem(0, 107, 30034,5)
	end
	
	gf_AddItemEx({0, 112, 158,	1, 4}, "L�ng Ba Vi B� to�n t�p");
	gf_AddItemEx({0, 112, 224,	1, 4}, "L�ng Ba Vi B�");

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
		gf_AddItemEx({2, 6, i, 1, 4}, "Quy�t Y�u");
	end
end

function Get_Book_Update()
	for i=1,100 do LevelUpBook() end
	for i=1,100 do LevelUpBook(1) end
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end


--Vat Dung Mon Phai
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


--Pet TYLN
function ling_nv_xiaodiao()
	local szSay = {};
	szSay[getn(szSay) + 1] = "Nh�n Ti�u �i�u/Give_XiaoDiao";
	szSay[getn(szSay) + 1] = "Nu�i Ti�u �i�u/Give_XiaoDiaoFood";
	szSay[getn(szSay) + 1] = "Hu�n luy�n Ti�u �i�u/Feed_XiaoDiao";
	szSay[getn(szSay) + 1] = "Ra kh�i/nothing";
	Say(g_szTitle.."Ti�u �i�u thao t�c.", getn(szSay), szSay)
end

function Give_XiaoDiao()
	if gf_Judge_Room_Weight(1, 1) ~= 1 then
		return 0;
	end
	AddItem(2, 20, 24, 1, 4);
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
		Msg2Player("C�c h� ch�a c� th� c�ng, kh�ng th� ti�n h�nh hu�n luy�n!");
		return
	end;
	local ItemGen, ItemDetail, ItemParticular = GetItemInfoByIndex(nPetItemIndex);
	if (ItemGen == nil or ItemDetail == nil or ItemParticular == nil)
		or (ItemGen ~= 2 or ItemDetail ~= 20)
	then
		Msg2Player("C�c h� ch�a c� th� c�ng, kh�ng th� ti�n h�nh hu�n luy�n!");
		return
	end

	for i = 1, 99 do
		LevelUpPet(nPetItemIndex)
	end
end


--Xoa Kho Do
function ClearBagAllItem(bTag)
	if not bTag or tonumber(bTag) ~= 1 then
		Say(g_szTitle.."Ng��i mu�n thanh l� t�i?", 2, "��ng �/#ClearBagAllItem(1)", "Ra kh�i/nothing")
		return
	end
	ClearItemInPos();
	if GetItemCount(2,1,30644) < 1 and GetFreeItemRoom() > 0 then
		AddItem(2,1,30644,1)
	end
end


--Bang Hoi
function TongOperation()
	local szSay = {
		g_szTitle.."Thao t�c bang h�i",
		"Ta mu�n l�p bang h�i/TongOperation_Create",
		"Ta mu�n th�ng c�p bang h�i/TongOperation_update",
		"Ra kh�i/nothing",
	};
	SelectSay(szSay);
end

function TongOperation_Create()
	if IsTongMember() ~= 0 then
		Talk(1,"","Ng��i �� c� bang h�i");
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


--Kinh Mach
function GetJingMai()
	local szSay = {
		g_szTitle.."Thao th�c kinh m�ch",
		"T�y �i�m kinh m�ch/GetJingMai_Reset",
		format("%s/getZhenqi", "Nh�n ch�n kh�"),
		format("%s/getJingMaiTongRen", "Nh�n Kinh M�ch ��ng Nh�n"),
		"Ra kh�i/nothing",
	};
	if MeridianGetLevel() < 4 then
		tinsert(szSay, 2, "Th�ng c�p c�nh gi�i V� T�n/GetJingMai_Update")
	end
	SelectSay(szSay);
end

function getZhenqi()
	AwardGenuineQi(180000);
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function getJingMaiTongRen()
	AddItem(2, 1,30730, 200)
	AddItem(2, 1,30731, 200)
	AddItem(2, 1,30732, 200)
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function Up6()
	local nLevel = MeridianGetLevel();
	
	if nLevel == 4 then
		MeridianUpdateLevel();
		MeridianUpdateLevel();
		MeridianRestore(-1);
		
		local nNum = 900000 - (MeridianGetDanTian() + MeridianGetQiHai());
		if nNum > 0 then
			AwardGenuineQi(nNum);
			return 0;
		end
	end
	
	Talk(1,"","Hi�n t�i b�n �� ��t ��ng c�p cao nh�t c�a kinh m�ch");
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
		Say(g_szTitle.."Thao th�c kinh m�ch", 2,"��ng �/#GetJingMai_Reset(1)", "H�y b�/nothing")
		return 0;
	end
	MeridianRestore(-1);
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function player_reborn()
	PlayerReborn(2, random(4));			--6ת
	gf_SetTaskByte(1538, 1, 5) 			--5ת
	SetLevel(90, 1);								--���õȼ�
	
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
end
