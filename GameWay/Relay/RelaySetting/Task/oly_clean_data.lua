-- 数据清理，登记人数和幸运数字

function TaskShedule()
	TaskName("C藀 nh藅 d� li謚 ho箃 ng Olympic");

	-- 一天一次
	TaskInterval(1440);
	-- 设置触发时间
	TaskTime(23,58);
	OutputMsg(format("22:10 m鏸 ng祔 c藀 nh藅 l筰 d� li謚 ho箃 ng Olympic..."));
	-- 执行无限次
	TaskCountLimit(0);

end

function TaskContent()
	-- 执行召唤脚本函数
	GlobalExecute("dw Relay_Clean_Data()")
end