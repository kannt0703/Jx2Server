--create date:07-04-27
--author:yanjun
--describe:南边桥梁Trap点
Include("\\script\\gongcheng\\gongcheng_function.lua");

tReturnPos = {{1114,2944},{1114,2944}};

function main()
	local nPlayerCamp = GCZ_GetPlayerCamp()
	if GetMissionV(MV_MISSION_STATE) == MS_STATE_READY then	--如果是准备阶段都不能通过
		SetPos(tReturnPos[nPlayerCamp][1],tReturnPos[nPlayerCamp][2]);
		Msg2Player(" hi謓 產ng trong giai 畂筺 chu萵 b�, kh玭g th� 甶 qua");
		return 0;
	end;
end;