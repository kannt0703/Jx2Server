-- 中午1点出现的BOSS定时器

function TaskShedule()
	TaskName("BOSS bu鎖 tr璦");	

	-- 一天一次
	TaskInterval(1440);
	-- 设置触发时间
	TaskTime(13,0);
	OutputMsg(format("BOSS xu蕋 hi謓 v祇 l骳 13:00..."));
	-- 执行无限次
	TaskCountLimit(0);

	-- OutputMsg("启动自动滚动公告...");
end

function TaskContent()

    local Random1 = Random(8)
          Random2 = Random(5)
          Random3 = Random(2)
	
	  world1 = Random1+1
	  world2 = Random2+101
	  world3 = Random3+201

          msg="BOSS u ti猲 xu蕋 hi謓 t筰:"..world1..",   BOSS th� 2 xu蕋 hi謓 t筰:"..world2..",   BOSS th� 3 xu蕋 hi謓 t筰:"..world3
	  OutputMsg(format(msg));

	-- 执行召唤BOSS脚本
	GlobalExecute(format("dw createBoss(%d,%d,%d)", world1, world2, world3));
end
