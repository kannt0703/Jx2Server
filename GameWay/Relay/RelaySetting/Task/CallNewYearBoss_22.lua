-- 中午1点出现的BOSS定时器

function TaskShedule()
	TaskName("Цnh Ni猲 th�");	

	-- 一天一次
	TaskInterval(1440);
	-- 设置触发时间
	TaskTime(22,0);
	OutputMsg(format("Чi Ni猲 th� xu蕋 hi謓 v祇 l骳 22:00..."));
	-- 执行无限次
	TaskCountLimit(0);

	-- OutputMsg("启动自动滚动公告...");
end

function TaskContent()
	-- 执行召唤年兽的脚本函数
	local index = random(11,18)
	GlobalExecute(format("dw createNewYearBoss(%d)",index))
end
