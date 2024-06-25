Include("\\RelaySetting\\Task\\shinynight_head.lua");

INTERVAL_TIME = 1440	-- 每24小时触发

function TaskShedule()
	TaskName("сng Иm Huy Ho祅g kinh nghi謒 nh﹏ i");	

	TaskInterval(INTERVAL_TIME);
	-- 设置触发时间
	local hour = TIME_CLOSE
	local min = 15
	TaskTime(hour, min);
	OutputMsg(format("сng Иm Huy Ho祅g kinh nghi謒 nh﹏ i, nhi謒 v� s� 頲 kh雐 ng v祇 %d:%d...", hour, min));
	-- 执行无限次
	TaskCountLimit(0);
end

function TaskContent()
	-- 辉煌之夜结束
	SetGlbInt(RELAYGLB_SHINYNIGHT, 0)

	local msg = "Ho箃 ng Иm Huy Ho祅g  k誸 th骳, m阨 m鋓 ngi ng祔 mai tham gia ng ."
	GlobalExecute(format("dw AddGlobalNews([[%s]])", msg))
	GlobalExecute("dw ShinyNight_Close()")
end
