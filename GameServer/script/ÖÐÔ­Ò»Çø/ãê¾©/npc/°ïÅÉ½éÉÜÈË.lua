Include("\\script\\online\\viet_event\\vng_task_control.lua");
---------------------------------------------------------
--	帮会介绍人
--	帮会的接口人 - Jeep tag
---------------------------------------------------------

function main()
	local nDate = tonumber(date("%Y%m%d"))
	-- Gioi han tinh nang Bang hoi
	if nDate < 20121124 and GetGlbValue(GLB_TSK_SERVER_ID) == 74 then
		Talk(1,"","Ch璦 n th阨 gian m� t輓h n╪g Bang H閕, ngi h穣 quay l筰 sau nha!!!");				
		do	return	end
	end
	local bWantCreateTong = GetTask(297)
	local bWantDestoryTong = GetTask(295)
	
	local bIsTongMember = IsTongMember()	-- 是帮会成员的话，就把建立帮会的条件干掉，不让他搞了！！！
	if (bIsTongMember == 1) then
		bWantCreateTong = 0;
		SetTask(297, 0)
	end
	
	-- <bWantDestoryTong == 1>表示玩家已经到帮会介绍人处申请解散帮会，来这里申请
	-- <bWantDestoryTong == 2>表示玩家已经在这里申请过解散帮会，又来骚扰金山掌门人了
	-- <bWantDestoryTong == 3>表示金山掌门人已经答应了解散帮会的申请
	
	-- <bWantCreateTong == 1>表示玩家已经到帮会介绍人处申请建立帮会，来这里申请
	-- <bWantCreateTong == 2>表示玩家已经获得了金山掌门人的认可，得到了(会盟令牌)
	
-- 解散帮会的部分分割线 -- 开始 ------------------------------------------------------------------------------
	if ((bWantDestoryTong == 1) or (bWantDestoryTong == 2)) then	-- 已经申请了解散帮会，但是还没有得到金山掌门人的最后确认
		Say("L阨 th豱h c莡 gi秈 t竛 bang h閕 c馻 b籲g h鱱  頲 ti誴 nh薾! ьi Minh Ch� Kim S琻 ng �, B籲g h鱱 c� th� ti課 h祅h gi秈 t竛 bang h閕!", 0)
		return
	end
	
	if (bWantDestoryTong == 3) then		-- 金山掌门人已经同意了解散帮会呢
		SetTask(295, 0)
		SetTask(296, 0)
		SetTask(297, 0)
		Talk(1,"","Ph鬾g l謓h Minh Ch� Kim S琻,  ch輓h th鴆 gi秈 t竛 bang h閕 c馻 b籲g h鱱!")
		DestroyTong()
		return
	end
	
-- 解散帮会的部分分割线 -- 结束 ------------------------------------------------------------------------------

-- 建立帮会的部分分割线 -- 开始 ------------------------------------------------------------------------------	
	if (bWantCreateTong == 1) then		-- 已经申请了建立帮会，还没有得到掌门人的最后同意
		Talk(1,"","Mu鑞 x﹜ d鵱g bang h閕 ph秈 頲 Minh Ch� Kim S琻 ng �. B籲g h鱱 c莕 giao n閜 <color=yellow>H閕 Minh l謓h b礽<color> Minh Ch� Kim S琻 xem x衪, 頲 chng m玭 ch蕄 nh薾 m韎 c� th� ch輓h th鴆 x﹜ d鵱g bang h閕. H穣 n Tng Dng t譵 Minh Ch� Kim S琻!")
		return
	end
	
	if (bWantCreateTong == 2) then		-- 已经搞到了会盟令牌
		Say("Ngi th藅 xu蕋 s綾! Minh Ch� Kim S琻  ng � cho ngi x﹜ d鵱g bang h閕!",
		    1,
		    "Xin 產 t�! Mong gi髉 t筰 h� ti課 h祅h x﹜ d鵱g bang h閕!/create_tong_formally")
		return
	end
-- 建立帮会的部分分割线 -- 结束 ------------------------------------------------------------------------------


	--闲聊
	Say("Ta ph鬾g l謓h V� l﹎ minh ch� x� l� chuy謓 bang h閕! B籲g h鱱 c� chuy謓 g� kh玭g???",
	    6,
	    "X﹜ d鵱g bang h閕 y猽 c莡 nh鱪g 甶襲 ki謓 g�?/introduce_about_create_tong",
	    "C� ph秈 nh﹏ kh� bang h閕 cao c� th� nh薾 頲 ph莕 thng c bi謙?/introduce_about_population",
	    "Ta mu鑞 s竛g l藀 bang ph竔, tri謚 t藀 anh h飊g thi猲 h�!/apply_create_tong_normal",
	    "Ta mu鑞 t╪g c蕄, khu誧h trng th� l鵦 bang h閕 ta!/apply_level_up_tong",
	    "Ta mu鑞 gi秈 t竛 bang h閕, lui v� ch鑞 s琻 l﹎!/apply_destroy_tong_normal",
	    "Kh玭g c� g�! Ch� ti謓 th� h醝 th╩ th玦!/chat_xxx")
end;



-- 真的可以建立帮会了，收了钱，有令牌就马上帮你办手续
function create_tong_formally()
	local bCardIsExist = GetItemCount(2,0,125)  -- 是否有会盟令牌
	if (bCardIsExist < 1) then
		Say("B籲g h鱱 ph秈 chu萵 b� <color=yellow>H閕 Minh l謓h b礽<color>  x﹜ d鵱g bang h閕!", 0)
		return
	end
        if GetItemCount(2, 0, 555) < 1 then
            Say("<color=green>S� gi� bang h閕<color>: L藀 bang c莕 <color=yellow>C祅 Kh玭 Ph�<color>, i hi謕 n猲 mang theo o c� n祔 khi l藀 bang nh�!", 0);
            return
        end

	local nMoney = GetCash()	--获得身上的钱
	if (nMoney < 5000000) then	-- 够钱
		Talk(1,"","<color=green>S� gi� bang h閕<color>: L藀 bang c遪 c莕 500 lng v祅g, quy猲 g鉷 cho v� l﹎ minh ch�  gi髉 b� t輓h thi猲 h�. Hi謓 t筰 i hi謕 v蒼 ch璦  ti襫  l藀 bang!")
		return
	end
        if GetReputation() < 1000 then
            Say("<color=green>S� gi� bang h閕<color>: Ki課 l藀 bang h閕 c莕 <color=yellow>1000 danh v鋘g<color>, i hi謕 luy謓 th猰 th阨 gian n鱝 r錳 h絥g l藀 bang h閕!", 0);
            return
        end
	
	CreateTongDialog()
end;

-- 介绍建立帮会所需要的条件
function introduce_about_create_tong()
	Talk(1,"","<color=green>S� gi� bang h閕<color>: 襲 ki謓 l藀 bang c莕 nh﹏ v藅 <color=yellow>c蕄 50<color> tr� l猲 v� ph秈 mang <color=yellow>500 v祅g <color> v韎 <color=yellow>Minh H閕 L謓h B礽<color> v�<color=yellow>c祅 kh玭 ph�<color>")
end;

-- 介绍帮会人气排名的作用
function introduce_about_population()
	Talk(1,"","B籲g h鱱 qu� nhi猲 b総 tin nhanh nh箉. M鏸 ng祔 ch髇g ta u ph竔 c竎 truy襫 nh﹏ n緈 b総 t譶h h譶h nh﹏ kh� c馻 m鏸 bang h閕. N誹 s� huynh  trong bang c祅g nhi襲, v� ngh� cao cng ho芻 th阨 gian g緉 b� trong bang d礽 u c� c鑞g hi課 l韓 cho nh﹏ kh� c馻 bang h閕. C竎 h筺g u trong b秐g x誴 h筺g nh﹏ kh� bang h閕 u nh薾 頲 ph莕 thng c bi謙 c馻 Minh Ch� Kim S琻!")
end;

-- 想要尝试建立帮会
function apply_create_tong_normal()
	local bIsTongMember = IsTongMember()
	if (bIsTongMember == 1) then
		Talk(1,"","B籲g h鱱  l� ngi c馻 bang h閕 kh玭g th� khai s竛g bang h閕!")
		return
	end

	local nCurPlayerLevel = GetLevel()
	if (nCurPlayerLevel < 50) then
		Talk(1,"","B籲g h鱱 ch璦 n c蕄 50! C� g緉g kh� luy謓 th猰 r錳 h穣 n!")
	else
		SetTask(297, 1)
		Talk(1,"","Mu鑞 x﹜ d鵱g bang h閕 ph秈 頲 Minh Ch� Kim S琻 ng �. B籲g h鱱 c莕 giao n閜 <color=yellow>H閕 Minh l謓h b礽<color> Minh Ch� Kim S琻 xem x衪, 頲 chng m玭 ch蕄 nh薾 m韎 c� th� ch輓h th鴆 x﹜ d鵱g bang h閕. H穣 n Tng Dng t譵 Minh Ch� Kim S琻!")
	end
end;

-- 申请解散帮会，之后就被打发到金山掌门人那里去了
function apply_destroy_tong_normal()
	local bIsTongMaster = IsTongMaster()
	if (bIsTongMaster == 0)	then	-- 不是帮主
		Talk(1,"","B籲g h鱱 kh玭g ph秈 bang ch� c馻 bang n祇, sao l筰 c� th� gi秈 t竛 bang h閕 ch�!")
		return
	end
	
	SetTask(295, 1)
	Talk(1,"","L阨 th豱h c莡 gi秈 t竛 bang h閕 c馻 b籲g h鱱  頲 ti誴 nh薾! ьi Minh Ch� Kim S琻 ng �, B籲g h鱱 c� th� ti課 h祅h gi秈 t竛 bang h閕!")
end;

-- 正宗闲聊，不用花钱，包你满意
function chat_xxx()
	Talk(1,""," t� b籲g h鱱 quan t﹎! Nh璶g g莕 y c玭g vi謈 qu� nhi襲, i l骳 r秐h r鏸 s� tr� chuy謓 v韎 b籲g h鱱!")
end;

-- 申请升级帮会等级
function apply_level_up_tong()
	local bIsTongMaster = IsTongMaster()
	if (bIsTongMaster == 0)	then	-- 不是帮主
		Talk(1,"","B籲g h鱱 kh玭g ph秈 bang ch�! Mu鑞 t╪g c蕄 bang h閕, y猽 c莡 bang ch� c馻 ngi ch th﹏ n!")
		return
	end
	
	local nTongLevel = GetTongLevel()
	if (nTongLevel >= 5) then		-- 帮会现在只能升级到 5 级，以后的要等帮会建设功能出了再向上面升级
		Talk(1,"","Ti襫 ch� c� th� t╪g c蕄 bang h閕 n c蕄 5. N誹 mu鑞 ti誴 t鬰 t╪g c蕄 c莕 ph秈 ki課 thi誸 bang h閕 m韎 c� th� ti誴 t鬰 t╪g c蕄, nh璶g ch鴆 n╪g n祔 t筸 th阨 ch璦 m�. Xin c竎 bang ch� ch� i th玭g b竜 m韎 c馻 Minh Ch� Kim S琻!")
		return
	end
	
	if (nTongLevel == 0) then		-- 临时帮会，直接打发走，TMD！！
		Talk(1,"","Bang h閕 t筸 th阨 c馻 b籲g h鱱 hi謓 ch璦  s� ngi, c莕 thu nh薾 th猰! ьi n khi x﹜ d鵱g bang h閕 ch輓h th鴆 h穣 n t譵 ta!")
		return
	end
	
	-- 以下开始是1-4级帮会的升级功能，我是想要每一级别讲的话都不同啦
	local strTalk = {
			"Bang h閕 hi謓 t筰 c馻 b籲g h鱱 ch� l� bang h閕 c蕄 th蕄! C莕 t╪g c蕄 bang h閕  ph竧 dng danh ti課g trong giang h�, c� th� thu nh薾 頲 nhi襲 huynh . Bang h閕 khi t╪g c蕄 c� th� m� r閚g quy m� nh璶g c莕 b� ra <color=yellow>170 ti襫 v祅g<color>. B籲g h鱱 b籲g l遪g giao n筽 ti襫 t╪g c蕄 kh玭g?",
			"Bang h閕 c馻 ngi tr� tr猲 giang h�  l﹗ nh璶g c莕 t╪g c蕄 n <color=yellow>bang h閕 c蕄 3<color> v� 頲 tri襲 nh th鮝 nh薾  ti謓 tri謚 t藀 huynh  c馻 qu� bang khi Qu鑓 gia h鱱 s�. C莕 n閜 <color=yellow>400 ti襫 v祅g<color> ng k� v韎 tri襲 nh, bang ch� c� mang  ti襫 kh玭g?",
			"Bu鎖 u x﹜ d鵱g bang h閕, c莕 ph秈 v� thi猲 h� b� t竛h. N筺 d﹏ � Giang T﹏ th玭 tr玦 d箃 kh緋 n琲. Minh Ch� Kim S琻 產ng d鑓 s鴆 tr� gi髉 h�,  n l骳 ch髇g ta ph秈 g鉷 s鴆. в t╪g c蕄 bang h閕 m譶h, h穣 quy猲 g鉷 ch髏 ti襫 c鴘  b� t竛h. Theo quy m� c馻 bang h閕, c莕 quy猲 g鉷 <color=yellow>800 ti襫 v祅g<color>!",
			"Bang h閕 c馻 ngi tuy ph竧 tri觧 nhanh ch鉵g nh璶g c莕 th╪g l猲 <color=yellow>bang h閕 c蕄 5<color> nh璶g ngi hi謓 ch璦  danh ti課g giang h�. H穣 tri謚 t藀 i h閕 v� l﹎ li猲 minh, m阨 bang ch� c馻 c竎 bang h閕 l韓 v� anh h飊g h祇 ki謙 c飊g tham gia  n﹏g cao danh ti課g v� ph竧 dng th� l鵦 c馻 bang h閕 nh璶g c莕 ti猽 t鑞 n <color=yellow>1400 ti襫 v祅g<color>. Ngi th蕐 th� n祇?",
			}
	
	Say(strTalk[nTongLevel], 
	    2,
	    "Hay l緈! Huynh  n鉯 th藅 c� l�! Ta s� giao ti襫, chuy謓 c遪 l筰 b籲g h鱱 t� lo li謚!/agree_add_tong_level",
	    "Зy kh玭g ph秈 s� ti襫 nh�. T筰 h� ph秈 v� b祅 b筩 v韎 c竎 huynh  trong bang!/disagree_add_tong_level")
end;

function agree_add_tong_level()
	local nNeedMoney = {1700000, 4000000, 8000000, 14000000}
		
	local nCurTongLevel = GetTongLevel()
	local nCurHaveMoney = GetCash()
	
	if (nCurHaveMoney < nNeedMoney[nCurTongLevel]) then		-- 钱不够，格老子的骗人！！
		Say("Hi謓 ngi kh玭g c�  ti襫. C� ti襫  r錳 ta b祅 ti誴!", 0)
		return
	end
	
	Pay(nNeedMoney[nCurTongLevel])
	AddTongLevel()
	Talk(1,"","Ch骳 m鮪g bang h閕 c馻 b籲g h鱱 頲 t╪g c蕄! B籲g h鱱 h穣 quay v� ch蕁 h璶g bang h閕, nh蕋 nh th祅h t鵸 s� vt tr閕 tr猲 ch鑞 giang h�!")
end;

function disagree_add_tong_level()
	Talk(1,"","Hay l緈! B籲g h鱱 qu� nhi猲 c� t� ch蕋 bang ch�! Quy誸 nh xong c� th� quay l筰 t譵 ta!")
end;

