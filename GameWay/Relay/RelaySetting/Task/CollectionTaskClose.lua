-- 龙舟比赛定时器

-- INTERVAL_TIME = 120	-- 每小时触发
INTERVAL_TIME = 90	-- 每小时触发

function GetNextTime()
    -- local hour = tonumber(date("%H"));
    -- if (hour == 23) then
    -- 	hour = 0;
    -- else
    -- 	hour = hour + 1;
    -- end
    -- return hour, 5;
    local hour = tonumber(date("%H"));
    local min = tonumber(date("%M"));
    local add = 40;
    if (min + add >= 60) then
        min = min + add - 60
        hour = hour + 1
        if (hour >= 24) then
            hour = 0
        end
    else
        min = min + add
    end
    return hour, min;
end

function TaskShedule()
	TaskName("Thi u thuy襫 r錸g");	

	-- 60分钟一次
	TaskInterval(INTERVAL_TIME);
	-- 设置触发时间
	local h, m = GetNextTime();
	TaskTime(h, m);
	OutputMsg(format("Nhi謒 v� thu th藀 v藅 ph萴 k誸 th骳 v祇 l骳 %d:%d...", h, m));
	-- 执行无限次
	TaskCountLimit(0);

	-- OutputMsg("启动自动滚动公告...");
end

function TaskContent()
	OutputMsg("сng nhi謒 v� thu th藀 v藅 ph萴...");
	-- 触发GameServer上的脚本
	-- GlobalExecute("dw LoadScript([[\\settings\\trigger_collectionclose.lua]])");
	GlobalExecute(format("dw closeDataCall(%d)", 0));
end
