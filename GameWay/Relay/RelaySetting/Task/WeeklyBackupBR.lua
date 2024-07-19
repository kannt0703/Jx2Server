-- 一周一次备份战场排行

function TaskShedule()
	TaskName("WeeklyBackupBR");

	local h = tonumber(date("%H"))

	-- 60分钟触发一次
	TaskInterval(60)
	TaskTime(21, 1)
	-- 执行无限次
	TaskCountLimit(0)
end

function TaskContent()

	local w = tonumber(date("%w"))
	local h = tonumber(date("%H"))

	if w == 6 and h == 21 then

		CalcHonorPoint(5)
		OutputMsg("ng th鑞g k� x誴 h筺g chi課 trng!...")
	end
end