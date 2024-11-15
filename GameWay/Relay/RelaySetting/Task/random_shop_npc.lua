-- =====================================================
-- 定时把商会任务的商店npc放到随机位置的脚本
-- Tony(Jizheng)
-- =====================================================

-- 定时设定
function TaskShedule()
	-- 任务名字
	TaskName("NPC nhi謒 v� Thng H閕 s� thay i c竎 v� tr� xu蕋 hi謓")
	
	-- 半个小时一次
	TaskInterval(30)
	
	-- 设置触发时间
	local nHour = tonumber(date("%H"))
	local nMinute = tonumber(date("%M"))
	
	if (nMinute >= 50) then
		nMinute = nMinute - 50
		if (nHour + 1 == 24) then
			nHour = 0
		else
			nHour = nHour + 1
		end
	else
		nMinute = nMinute + 10
	end
	
	-- 当前relay启动后10分钟就加载起来
	TaskTime(nHour, nMinute)

	-- 重复执行无限次数
	TaskCountLimit(0)
	
	local msg = "NPC thng h閕"..nHour.." gi� "..nMinute.."ph髏 xu蕋 hi謓!"
	OutputMsg(format(msg))
end;

-- 定时执行的内容
function TaskContent()

	--    城市地点：
	local strMapName = 	{"Tuy襫 Ch﹗", "Bi謓 Kinh", "Th祅h Й", "Tng Dng", "Dng Ch﹗", "Чi L�"}
	local nMapID 	 =	{100,  	 200,    300,    350,    150,    400}
	local nMapX 	 =	{1499,   1439,   1794,   1497,   1653,   1428}
	local nMapY 	 =	{3059,   2956,   3608,   2882,   3109,   3005}
	
	local nIndex = random(1, 6)
	local msg="NPC thng h閕 s� xu蕋 hi謓 �:"..strMapName[nIndex].."!"
	OutputMsg(format(msg))

	-- 执行召唤随机商会npc的脚本
	GlobalExecute(format("dw random_shop(%d,%d,%d)", nMapID[nIndex], nMapX[nIndex], nMapY[nIndex]))
end;

