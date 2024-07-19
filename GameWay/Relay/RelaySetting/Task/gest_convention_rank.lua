
-- 比武大会资格排名

function TaskShedule()
	-- 任务名字
	TaskName("X誴 h筺g t� c竎h i h閕 t� v�")

	local h = tonumber(date("%H"))
	local m = tonumber(date("%M"))

	-- 60分钟触发一次
	TaskInterval(60)
	TaskTime(23, 30)
	-- 执行无限次
	TaskCountLimit(0)
end;

-- 定时执行的内容
function TaskContent()
	local w = tonumber(date("%w"))
	local h = tonumber(date("%H"))

	-- 星期天23点
	if w == 0 and h == 23 then
		OutputMsg("ng x誴 h筺g t� c竎h i h閕 t� v�...")
		CalcGestConvetionRankJf("calc_point")
	end
end

tPoint = {100, 90, 85, 80, 75, 70, 65, 60, 55, 50}

function calc_point(nLevel, nRank)
	local nRetPoint = 0
	if tPoint[nRank] ~= nil then
		nRetPoint = tPoint[nRank]
	end
	return nRetPoint
end

function GameSvrConnected(GameSvr)
end
