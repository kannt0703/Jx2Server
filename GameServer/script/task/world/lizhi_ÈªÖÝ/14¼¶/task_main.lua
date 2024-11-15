
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 泉洲 14 级任务主体脚本
-- Edited by lizhi
-- 2005-8-4 10:38
-- ======================================================

-- 剧情任务文件
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\lizhi_泉州\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

function can_not_accept_task()
    local szTalk = {
        "Canh g竎 nghi猰 ng苩 v藋 sao m蕋 tr閙 頲?"
    };
    TalkEx("", szTalk);
end;

function task_000_00()

    local szTalk = {
        "Nghe n鉯 kho b竨 c馻 i nh﹏ b� tr閙, ta 產ng 甶襲 tra chuy謓 n祔, xin n鉯 r� h琻 頲 kh玭g?",
        "H玬 , khi ta th鴆 d藋, g鋓 c� n鯽 ng祔 m� kh玭g th蕐 L璾 qu秐 gia u, n ph遪g 玭g ta th� th蕐  c  d鋘 甶.",
        "R錳 sao n鱝?",
        "V鮝 l骳 , a ho祅 Ti襫 Tng h鑤 ho秐g ch箉 n b竜 c鯽 kh� ph遪g  b� m�, n琲  ch� c� ta m韎 c� ch譨 kh鉧 ra v祇.",
        "Chung quy l� m蕋 nh鱪g th� g�? C� ph秈 L璾 qu秐 gia l蕐 c緋 kh玭g?"
    };
    
    TalkEx("task_001_00", szTalk);
end;

function task_001_00()
    local szMsg = {
        "Th藅 ng ti誧! chuy課 h祅g b籲g ng鋍 m蕋 h誸. Ta ch� ph竧 hi謓 b鴆 th� trong ph遪g c馻 L璾 qu秐 gia, ch綾 trong l骳 g蕄 g竝 玭g ta  qu猲. Ch� trong th�  m� do d輓h nc, ngi th� mang 甶 甶襲 tra xem.",
        "L祄 sao  c 頲 c竎 ch� n祔?",
        "Ngi th� n t譵 Chu B﹏ C� (162.185), bi誸 u kh玦 ph鬰 頲 b鴆 th�."
    };
    
    TalkEx("", szMsg);

	Msg2Player("дn ph� Tuy襫 Ch﹗ t譵 Chu B﹏ C�");
	TaskTip("дn ph� Tuy襫 Ch﹗ t譵 Chu B﹏ C�");
	
	AddItem(2, 0, 38, 1);   --模糊的字条
	
	SetTask(TASK_LEV_14_ID, 1);
	SetTask(TASK_LEV_12_ID, GetTask(TASK_LEV_12_ID) + 1);   --消除任务面板
end;


function task_001_01()

    local szTalk = {
        "Ngi th� n t譵 Chu B﹏ C� (162.185), bi誸 u kh玦 ph鬰 頲 b鴆 th�."
    };

    TalkEx("", szTalk);
end;

function task_001_02()

    local szTalk = {
        "T筰 h� c� b鴆 th� kh玭g may th蕀 nc kh玭g bi誸 i nh﹏ gi髉 kh玦 ph鬰 l筰 頲 kh玭g?",
        "Vi謈 n祔 kh玭g kh�, nh璶g c莕 c�: 1 Linh ph� ch�, 1 Chu sa, 1 D� Tr� mao.",
        "в ta 甶 t譵."
    };
    
    TalkEx("task_002_00",szTalk);
end;

function task_002_00()

    Msg2Player("T譵 Linh ph� ch�, Chu sa v� D� Tr� mao cho Chu B﹏ C�");
    TaskTip("T譵 Linh ph� ch�, Chu sa v� D� Tr� mao cho Chu B﹏ C�");
    CreateTrigger(0, 194, 84);  --杀死野猪
    SetTask(TASK_LEV_14_ID, 2);
end;

function task_002_01()
    
    local szNotFinished = {
        "Ta nh綾 l筰 l莕 n鱝! Nguy猲 li謚 c莕 t譵 l�: 1 Linh ph� ch�, 1 Chu sa, 1 D� Tr� mao!"
    };
    local szMaleFinished = {
        "ng r錳! ьi ta m閠 l竧!",
        "�.",
        "B鴆 th�  頲 kh玦 ph鬰. Hihi匓鴆 th� n祔 ch綾 c玭g t� vi誸 cho v� h錸g nhan n祇 y? Trong  ghi Ph� t﹜ Tuy襫 Ch﹗, g苝 � ch� c�. Th阨 gian kh玭g c遪 s韒, c玭g t� mau 甶 k蝟 b� l� c� h閕."
    };
    local szFemaleFinished = {
        "ng r錳! ьi ta m閠 l竧!",
        "�.",
        "B鴆 th�  頲 kh玦 ph鬰. Hihi匓鴆 th� n祔 ch綾 c玭g t� vi誸 cho v� h錸g nhan n祇 y? Trong  ghi Ph� t﹜ Tuy襫 Ch﹗, g苝 � ch� c�. Th阨 gian kh玭g c遪 s韒, c玭g t� mau 甶 k蝟 b� l� c� h閕."
    };
        
    local nPen = 0;
    local nPaper = 0;
    local nHair = 0;
    
    nPen = GetItemCount(2, 2, 65);     --灵符纸
    nPaper = GetItemCount(2, 2, 30);  --朱砂
    nHair = GetItemCount(2, 0, 39);     --极细的野猪毛
    
    if ((nPen >= 1) and (nPaper >= 1) and (nHair >= 1)) then
        if (GetSex() == 1) then
            TalkEx("task_003_00", szMaleFinished);
        elseif (GetSex() == 2) then
            TalkEx("task_003_00", szFemaleFinished);
        end;
    else
        TalkEx("task_003_10", szNotFinished);
    end;
end;

function task_003_10()
    if GetTrigger(84) == 0 then
        CreateTrigger(0, 194, 84);  --杀死野猪
    end;
end;

function task_003_00()

    GivePlayerAward("Level_14", "easy");    --奖励
	GivePlayerExp(SkeyQZWangyewei,"jiayouneizei1")		--家有内贼1
    SetTask(TASK_LEV_14_ID, 3);
    
    DelItem(2,2,65,1);
    DelItem(2,2,30,1);
    DelItem(2,0,39,1);
    DelItem(2, 0, 38, 1);   --模糊的字条
    RemoveTrigger(GetTrigger(84));

end;

function task_003_01()
    
    local szTalk = {
        "Ph� t﹜ Tuy襫 Ch﹗, ch� g苝 c�, ngi c遪 kh玭g mau 甶!"
    };
    TalkEx("", szTalk);

end;

function task_003_02()
    
    local szTalk = {
        "L璾 qu秐 gia! Tng l蕐 c緋  xong tho竧 頲 �? Khai mau chuy課 h祅g c馻 Чi Ch� Cng  u? Ai sai ngi l祄?",
        "Чi nh﹏, xin tha m筺g! в ta n鉯!",
        "N鉯 mau!",
        "L祬.th� r蘮 Chung Ph鉵g � ph� Tuy襫 Ch﹗ b秓 ta l蕐 c緋, h緉 n鉯 l骳 trc l祄 ch譨 kh鉧 cho ыi l穙 gia l衝 l髏 l祄 th猰 m閠 ch譨, n鉯 sau khi th祅h c玭g s� chia cho ta nhi襲 h琻. Hi謓 h緉 mang chuy課 h祅g  甶 r錳, ngi t譵 h緉 h醝 xem, xin tha m筺g!",
        "H玬 nay ta t筸 tha cho ngi!"
    };
    TalkEx("task_004_00", szTalk);
end;

function task_004_00()

    GivePlayerAward("Level_14", "hard", "weapon", "Level_16");    --奖励
	GivePlayerExp(SkeyQZWangyewei,"jiayouneizei2")		--家有内贼2
    SetTask(TASK_LEV_14_ID, 4);
    SetTask(TASK_LEV_18_ID, 100);   --泉州钟放任务开启
end;

function task_004_01()
    
    local szTalk = {
        "T蕋 c� l� do Chung Ph鉵g ch� th�, ngi t譵 h緉 h醝 xem, xin tha m筺g!"
    };
    TalkEx("", szTalk);
end;