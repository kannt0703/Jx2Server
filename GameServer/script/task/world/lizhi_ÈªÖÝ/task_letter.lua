--  文件说明
--  使用章伟刚的秘函以后触发的脚本文件
--  Created by lizhi
--  2005-8-4 21:13

Include("\\script\\task\\world\\lizhi_长歌门\\task_head.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnUse()

    local szMsg = {
        "Nh薾 nhi謒 v�: Th玭g b竜 cho H� H莡 C莔",
        "Trong m藅 h祄 ghi {Х chuy觧 n n琲 an to祅! H� H莡 C莔 � Dng Ch﹗ l� m閠 trong 4 ngi C莔, K�, Thi, H鋋 c馻 Trng Ca M玭, ph� tr竎h v飊g Giang Nam, ph秈 tr� kh� nhanh!}. Chng V� Cng tr譶h.",
        "Nghe n鉯 Trng Ca M玭 c� t� th阨 nh� T鑞g do nhi襲 m玭 ph竔 h頿 l筰  ch鑞g ngo筰 t閏 x﹎ chi誱. Mau 甧m b鴆 th� n {Dng Ch﹗} giao cho {H� H莡 C莔}."
    };
    local nStep;
    
    nStep = GetTask(TASK_THREE);
    if (nStep == 0) then
        Msg2Player("m m藅 h祄 giao cho H� H莡 C莔");
        TaskTip("m m藅 h祄 giao cho H� H莡 C莔");
        SetTask(TASK_THREE, 1);
        TalkEx("", szMsg);
    elseif nStep == 1 then
        Msg2Player("m m藅 h祄 giao cho H� H莡 C莔");
        TaskTip("m m藅 h祄 giao cho H� H莡 C莔");
    end;

end;