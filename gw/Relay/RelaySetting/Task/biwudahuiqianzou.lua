-- =====================================================
-- 每半小时触发一次的比武大会前奏的玩家配对
-- =====================================================
g_nInterValTime = 1;	--触发的间隔时间
-- 定时设定
function TaskShedule()
	-- 任务名字
	TaskName("Gh衟 i trc i h閕 t� v�")

	-- 15分钟触发一次
	TaskInterval(g_nInterValTime)

	-- 设置触发时间
	local nHour = tonumber(date("%H"))
	local nMin = tonumber(date("%M"))
	nMin = mod((floor(nMin/g_nInterValTime)+1)*g_nInterValTime,60)
	if nMin == 0 then
		nHour = nHour + 1; --如果在x点48分启动的话，那么就在x+1点0分创建NPC
	end;
	--Relay启动后下一个quarter执行
	TaskTime(nHour, nMin)

	-- 重复执行无限次数
	TaskCountLimit(0)

	local msg = "Gh衟 i l筰 th祅h c玭g, th阨 gian gh衟 i l莕 u l� "..nHour.." 甶觤"..nMin.." Ph髏 "
	OutputMsg(format(msg))
end;

-- 定时执行的内容
function TaskContent()
	GlobalExecute("dw biwudahuiqianzou_init()")
end;

function GameSvrConnected(GameSvr)
end
