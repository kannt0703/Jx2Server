--每天20:00准时刷新

function TaskShedule()
	TaskName("T筼 m韎 BOSS Th� Gi韎");	

	-- 一天一次
	TaskInterval(1440);
	-- 设置触发时间
	TaskTime(20,00);
	OutputMsg(format("BOSS Th� Gi韎 s� xu蕋 hi謓 � %s...", "20:00"));
	-- 执行无限次
	TaskCountLimit(0);

end

function TaskContent()
	local nDate = tonumber(date("%Y%m%d%H")) + random(10000);
	GlobalExecute(format("dw wb_CreateBoss(%d)", tonumber(nDate)));
end