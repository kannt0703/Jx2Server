--永结同心包
Include("\\script\\结婚\\marriage_head.lua");
function OnUse(nItemIdx)
	if gf_JudgeRoomWeight(17,30) == 0 then
		Talk(1,"","Kho秐g tr鑞g trong h祅h trang kh玭g , s緋 x誴 l筰 r錳 h穣 m� V躰h K誸 уng T﹎ bao");
		return 0;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		local task_date = GetTask(TASK_WEDDING_DATE)
		local task_para = GetTask(TASK_WEDDING_FIELD)
		add_invitation(10,task_date,task_para);
		AddItem(ITEM_LIHUA[1],ITEM_LIHUA[2],ITEM_LIHUA[3],3);
		Msg2Player("B筺 nh薾 頲 3 L� Hoa");
		AddItem(ITEM_XITANG[1],ITEM_XITANG[2],ITEM_XITANG[3],8);
		Msg2Player("B筺 nh薾 頲 8 vi猲 k裲");
		AddItem(2,3,214,6);
		Msg2Player("B筺 nh薾 頲 6 vi猲 ph竜")
		AddItem(ITEM_MTCXB[1],ITEM_MTCXB[2],ITEM_MTCXB[3],1);
		Msg2Player("B筺 nh薾 頲 1 M筺 Thi猲 Th� Ti誸 bao")
		AddItem(ITEM_NOTEBOOK[1],ITEM_NOTEBOOK[2],ITEM_NOTEBOOK[3],1)
		Msg2Player("B筺 nh薾 頲 1 quy觧 thuy誸 minh chi課 a.");
		WriteLog("[K誸 h玭]:"..GetName().."M� V躰h K誸 уng T﹎ bao");
	end
end;