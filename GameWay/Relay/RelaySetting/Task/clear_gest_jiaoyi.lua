
-- 比武大会资格排名
g_nBWBeginTime = MkTime(2014,5,12,0,0,0); --2009年12月7号（周一）开始新赛季 1260115200
g_nBWWeeks = 4;  --12周为一赛季
bCopy = 0;

function TaskShedule()
	-- 任务名字
	TaskName("X鉧 b� h筺g t� v�")

	-- 设置触发时间
	local h = tonumber(date("%H"))
	local m = tonumber(date("%M"))

	-- 60分钟触发一次
	TaskInterval(60)

	TaskTime(h, m)

--	OutputMsg("将于"..h..":"..m.."清除较艺排名数据...")
	-- 执行一次
	TaskCountLimit(0)
end;

-- 定时执行的内容
function TaskContent()

	local nDate = tonumber(date("%Y%m%d"));
	local nCurWeek = tonumber(date("%w"));

	local nCurTime = GetTime();
	local nWeek = ceil((nCurTime-g_nBWBeginTime)/(7*24*3600));
	local nCurSeason = ceil(nWeek/g_nBWWeeks); --第几赛季
	local nSeasonWeek = mod(nWeek,g_nBWWeeks); --当前赛季的第几周
	if nSeasonWeek == 0 then
		nSeasonWeek = g_nBWWeeks;
	end
	
	print("check clear_share_bw:",nCurSeason, nSeasonWeek, nCurWeek, tonumber(date("%H")))

	if false and nDate >= 20140601 and nDate <= 20140630 then
		clear_share_bw();
	elseif nCurSeason > 1 and nSeasonWeek == 1 and nCurWeek == 1 then
		clear_share_bw();
	end
end

function clear_share_bw()
	local nHour = tonumber(date("%H"));
	local nRouteMax = 32;
	if nHour > 0 and nHour < 10 then
		if bCopy ~= 1 then
			print("clear_share_bw")
			OutputMsg("ng x鉧 b� s� li謚 h筺g t� v�...")
			for i = 0, 1 do
				for j = 0, nRouteMax do
					CopyOneShareDBRecord("GestConvention_Zige", i, j, "GestConvention_Zige_Last")
					ClearOneShareDBRecord("GestConvention_Jiaoyi", i, j)
--					ClearOneShareDBRecord("GestConvention_Jiaoyi_w", i, j)
					ClearOneShareDBRecord("GestConvention_Change", i, j)
					ClearOneShareDBRecord("GestConvention_Zige", i, j)
					bCopy = 1;
				end
			end
		end
	end
end

function GameSvrConnected(GameSvr)
end
