-- 定时器生成奥运幸运数字

function TaskShedule()
	TaskName("Thi誸 l藀 ch� s� may m緉 ho箃 ng Olympic");

	-- 一天一次
	TaskInterval(1440);
	-- 设置触发时间
	TaskTime(20,58);
	OutputMsg(format("21:00 m鏸 ng祔 s� thi誸 l藀 ch� s� may m緉 Olympic..."));
	-- 执行无限次
	TaskCountLimit(0);

end

function TaskContent()
	-- 执行召唤脚本函数
	GlobalExecute("dw Relay_Generate_LuckNum()")
end