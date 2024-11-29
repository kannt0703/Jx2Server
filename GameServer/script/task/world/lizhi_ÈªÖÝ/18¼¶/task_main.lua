
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 泉洲 18 级任务主体脚本
-- Edited by lizhi
-- 2005-8-4 16:36
-- ======================================================

-- 剧情任务文件
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\lizhi_泉州\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");
Include("\\script\\task\\world\\lizhi_长歌门\\task_head.lua");

function can_not_accept_task()
    local szTalk = {
        "Th阨 gian ng緉 v藋 sao ta l祄 h誸 頲 s� 產o n祔?"
    };
    TalkEx("", szTalk);
end;

function task_000_00()
    local szTalk = {
        "Nghe n鉯 ngi l� ch� m璾 c馻 v� l蕐 tr閙 nh� Чi Ch� Cng.",
        "Ta c騨g kh玭g mu鑞 nh璶g v� con b� t猲 h綾 y nh﹏ b総 甶, h緉 b秓 c莕 chuy課 h祅g ng鋍 c馻 Чi Ch� Cng m韎 th� v� con v�.",
        "Sao ngi l蕐 頲 ch譨 kh鉧 kho b竨 c馻 Чi Ch� Cng? Theo ta bi誸 ch譨 kh鉧  ch� c� m閠 c竔.",
        "Ch譨 kh鉧 nh� Чi Ch� Cng l� do ta l祄, s� th輈h c馻 ta l� khi l祄 ch譨 cho ngi kh竎 thng l祄 th猰 m閠 c竔. T猲 h綾 y nh﹏ b総 ta ph秈 甧m  ng鋍 v� b籲g kh玭g v� con g苝 nguy hi觤.",
        "Ngi bi誸 ngi  l� ai, � u kh玭g?",
        "Nghe u h緉 t猲 Chng V� Cng, ti觰 u m鬰 c馻 Xi H醓 gi竜. ng � B綾 Tuy襫 Ch﹗.",
        "в ta 甶 t譵 h緉."
    };
    
    TalkEx("task_001_00", szTalk);
    
end;
    
function task_001_00()

    Msg2Player("дn B綾 Tuy襫 Ch﹗ t譵 Chng V� Cng (179.180)");
    TaskTip("дn B綾 Tuy襫 Ch﹗ t譵 Chng V� Cng (179.180)");
    --CreateTrigger(0, 195, 85);  --杀死章伟刚
    KillFollower();
    SetTask(TASK_LEV_18_ID, 1);
    SetTask(TASK_LEV_14_ID, GetTask(TASK_LEV_14_ID) + 1);   --消除任务面板
    
end;

function task_001_01()
    local szTalk = {
        "Chng V� Cng g� ? Nghe u l祄 ti觰 u m鬰 c馻 Xi H醓 gi竜, hi謓 產ng � B綾 Tuy襫 Ch﹗."
    };
    TalkEx("task_001_02", szTalk);
end;

function task_001_02()
--    if GetTrigger(85) == 0 then
--        CreateTrigger(0, 195, 85);  --杀死章伟刚
--    end;
	KillFollower();
end;

function task_002_00()
    local szTalk = {
        " t� ﹏ nh﹏! Phu th� ta  頲 畂祅 t�!"
    };
    TalkEx("task_003_00", szTalk);
end;

function task_003_00()
    KillFollower();
    RemoveTrigger(GetTrigger(86));
    RemoveTrigger(GetTrigger(87));
    GivePlayerAward("Level_18", "hell", "chest", "Level_19");    --奖励
	GivePlayerExp(SkeyQZWangyewei,"zongfangdekunao")		--钟放的苦恼
    SetTask(TASK_LEV_18_ID, 3);
end;

function task_003_01()
    local szTalk = {
        "Чi nh﹏ r秐h r鏸 n Tuy襫 Ch﹗ thng ngo筺 m閠 chuy課!"
    };
    TalkEx("task_001_02", szTalk);
end;
