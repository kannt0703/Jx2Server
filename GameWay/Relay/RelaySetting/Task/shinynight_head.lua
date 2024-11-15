
RELAYGLB_SYSTEM			= 1			-- Relay全局变量：系统
RELAYGLB_MULTIPLE 		= 2			-- Relay全局变量：倍率
RELAYGLB_SHINYNIGHT		= 3			-- Relay全局变量：辉煌之夜是否进行中，1为进行中，0为未进行

SYS_BATTLE				= 1			-- 战场的战功
SYS_COC			 	 	= 2			-- 商会的奖励
SYS_MASTER_RANDOMTASK	= 3			-- 师门随机任务奖励
SYS_MASTER_REPEATTASK	= 4			-- 师门重复任务奖励
SYS_KILLER_TASK			= 5			-- 杀手任务奖励
SYS_DRAGONBOAT			= 6			-- 龙舟积分奖励

TIME_START				= 19		-- 辉煌之夜启动时间
TIME_CLOSE				= 23		-- 辉煌之夜关闭时间

map_multiple = {
	SYS_BATTLE,						-- 战场的战功
	SYS_COC,						-- 商会的奖励
	SYS_MASTER_RANDOMTASK,			-- 师门随机任务奖励
	SYS_MASTER_REPEATTASK,			-- 师门重复任务奖励
	SYS_KILLER_TASK,				-- 杀手任务奖励
	SYS_DRAGONBOAT					-- 龙舟积分奖励
}

-- 周五、六、日没有杀手任务
map_multiple_holiday = {
	SYS_BATTLE,						-- 战场的战功
	SYS_COC,						-- 商会的奖励
	SYS_MASTER_RANDOMTASK,			-- 师门随机任务奖励
	SYS_MASTER_REPEATTASK,			-- 师门重复任务奖励
	SYS_DRAGONBOAT					-- 龙舟积分奖励
}

map_week_systems = {
	[0] = map_multiple_holiday,		-- 周日
	[1] = map_multiple,				-- 周一
	[2] = map_multiple,				-- 周二
	[3] = map_multiple,				-- 周三
	[4] = map_multiple,				-- 周四
	[5] = map_multiple_holiday,		-- 周五
	[6] = map_multiple_holiday		-- 周六
}

map_sysnames = {
	{"Chi課 trng", 			"Chi課 c玭g",		0},
	{"Thng h閕",			"",			0},
	{"Nhi謒 v� s� m玭 - ng蓇 nhi猲",	"",			0},
	{"Nhi謒 v� s� m玭 tu莕 ho祅",	"觤 t輈h l騳",		0},
	{"Nhi謒 v� s竧 th�",		"Kinh nghi謒",		0},
	{"Thuy襫 r錸g",			"觤 t輈h l騳",		0}
}

-- 一周内的倍率排列（需要除以100）
map_week_multiples = {
	[0] = 200,	-- 周日
	[1] = 150,	-- 周一
	[2] = 150,	-- 周二
	[3] = 150,	-- 周三
	[4] = 150,	-- 周四
	[5] = 150,	-- 周五
	[6] = 200	-- 周六
}

-- 随机选择一个系统
function get_random_system()
	local wday = tonumber(date("%w"))
	local map = map_week_systems[wday]

	local yday = tonumber(date("%j"))
	local hour = tonumber(date("%H"))
	local min = tonumber(date("%M"))
	local sec = tonumber(date("%S"))
	local seed = yday * 86400 + hour * 3600 + min * 60 + sec
	randomseed(seed)
	for i=1,yday do
		random(1, 6)
	end

	--local system = random(1, getn(map))	-- 暂时屏蔽战场，Jeep tag
	local system = random(2, getn(map))
	return map[system]
end

-- 选择倍率
function get_multiple()
	local wday = tonumber(date("%w"))
	return map_week_multiples[wday]
end
