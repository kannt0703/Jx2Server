-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 五毒教NPC西图Script
-- By StarryNight
-- 2006/02/09 PM 15:19

-- 直面自己的内心吧！

-- ======================================================

-- 入门门任务头文件
Include("\\script\\task\\faction\\faction_main_wp.lua"); 

function main()

local nTaskValue = GetTask(FN_WP);

	if nTaskValue == 5 then
		task_008();
		return
	end
	
	if nTaskValue == 6 then
		Say("Ngi h穣 mau t譵 g苝 <color=yellow>C﹗ S竎h<color>.",0);
	else
		Say("Ch� H竛 th藅 kh� hi觰, h穣 甶 h醝 C﹗ S竎h!",0);
	end
end;
