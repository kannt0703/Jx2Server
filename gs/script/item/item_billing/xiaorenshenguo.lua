-- 小人参果
-- 4小时内提升秘籍修炼速度2倍，时间可累积。单击投入修为按钮弹出提示框提示
-- lizhi 2006-11-2 11:53

TASK_ID = 2506

function OnUse()
	local nLeftTime = GetTask(TASK_ID)
	nLeftTime = floor(nLeftTime / 18 / 60)
	local nHour = floor(nLeftTime / 60)
	local nMin = floor(mod(nLeftTime, 60))
	Say("D飊g ti觰 Nh﹏ s﹎ qu� c� th� nh薾 頲 t鑓 c tu luy謓 m藅 t辌h g蕄 4 l莕 trong 4 gi�, b筺 c遪 "..nHour.."h "..nMin.." ph髏, mu鑞 d飊g kh玭g?",
		2,
		"ng r錳./yes_use",
		"H駓 b�./no_use"
		)
end

function yes_use()
	local nHave = GetItemCount(2,0,552)
	AskClientForNumber("use_cb", 1, tonumber(nHave), "Mu鑞 d飊g m蕐 ti觰 Nh﹏ s﹎ qu�?")
end

function use_cb(nCount)
	local nTaskValue = GetTask(TASK_ID)
	if DelItem(2, 0, 552, nCount) == 1 then
		SetTask(TASK_ID, nTaskValue + 14400 * 18 * nCount)
		local nTime = floor(GetTask(TASK_ID) / 18 / 60)
		local nHour = floor(nTime / 60)
		local nMin = floor(mod(nTime, 60))
		Msg2Player("B筺  d飊g Ti觰 Nh﹏ s﹎ qu�, th阨 gian tu luy謓 m藅 t辌h g蕄 4 l莕 c遪"..nHour.."h "..nMin.." ph髏 ")
	end
end

function no_use()

end
