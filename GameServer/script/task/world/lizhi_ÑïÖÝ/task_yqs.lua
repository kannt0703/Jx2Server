--使用与妻书以后执行的脚本
--created by lizhi
--2005-9-1 16:14

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnUse()
    local szMsg = {
        "H譶h nh� y l� th� c馻 L玦 Th緉g vi誸 cho ngi y猽 nh璶g sao anh ta kh玭g g鰅 甶, trong th� c� nh綾 n ngi y猽 c馻 L玦 Th緉g 產ng � Dng Ch﹗ t猲 Ph飊g уng Nhi. Gi髉 anh ta ho祅 th祅h t﹎ nguy謓 n祔 甶!"
    }
    if GetTask(TASK_YZ_ONE) == 0 then
        TalkEx("task_00_01", szMsg);
    end;
end;

function task_00_01()
    SetTask(TASK_YZ_ONE, 1);
    Msg2Player("m th� cho Ph飊g уng Nhi � Dng Ch﹗");
    TaskTip("m th� cho Ph飊g уng Nhi � Dng Ch﹗");
end;