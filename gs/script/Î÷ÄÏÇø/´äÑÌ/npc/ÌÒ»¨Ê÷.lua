--脚本功能：翠烟桃花树对话脚本
--功能设计：曾庆祥
--功能开发：村长
--开发时间：2009-3-16

Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	--2011新手改进:入门任务
	local nGet = tGtCondition:check_taskid(369, 2);
	if nGet ~= nil and gf_GetTaskBit(3378, 1) ~= 1 then
		Talk(1, "", "T譵 頲 m閠 b礽 th� 萵 tr猲 v� Уo Hoa Th鬨n<color=yellow>    Уo hoa t飊g trung o hoa am,\n    Уo hoa am h藆 o hoa s琻.\n    Th� nh﹏ giai th竛 o hoa di詍,\n    B蕋 ki課 th� h� o hoa t祅.<color>\n         --<color=green>Th玭 trng<color>");
		AddItem(2,0,778,1);
		gf_SetTaskBit(3378, 1, 1);
		return
	end

	--2011新手改进之前

	if GetTask(1019) == 2 and BigGetItemCount(2,0,778) == 0 then
		AddItem(2,0,778,1)
	else
		if random(1000) == 137 then
			Talk(1,"","T譵 頲 m閠 b礽 th� 萵 tr猲 v� Уo Hoa Th鬨n<color=yellow>    Уo hoa t飊g trung o hoa am,\n    Уo hoa am h藆 o hoa s琻.\n    Th� nh﹏ giai th竛 o hoa di詍,\n    B蕋 ki課 th� h� o hoa t祅.<color>\n         --<color=green>Th玭 trng<color>")
		end
	end
end
