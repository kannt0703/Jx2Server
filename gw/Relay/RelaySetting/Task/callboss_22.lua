-- 晚上11点出现的BOSS定时器

function TaskShedule()
	TaskName("BOSS ban m");	

	-- 一天一次
	TaskInterval(1440);
	-- 设置触发时间
	TaskTime(22,5);
	-- 执行无限次
	TaskCountLimit(0);

	-- OutputMsg("启动自动滚动公告...");
end

function TaskContent()

    local nBoss = random(1, 3)
    local nPos = random(1, 4)

	-- 执行召唤BOSS脚本
	GlobalExecute(format("dw createNewResBoss(%d,%d)", nBoss, nPos));
end
