-- 中午1点出现的BOSS定时器

function TaskShedule()
	TaskName("H裯 gi� ng m�");	

	-- 一天一次
	TaskInterval(14400);
	-- 设置触发时间
	TaskTime(23,59);
	-- 执行无限次
	TaskCountLimit(0);
end

function TaskContent()
	GlobalExecute(format("dw OpenPunishFlag(%d)", 1));
end
