-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 沙漠迷宫NPC幻象统领Script
-- By StarryNight
-- 2007/08/07 AM 11:58

-- 不要欺负人驼背啊！

-- ======================================================

-- 引用剧情任务头文件
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnDeath(index)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();
local nMapId, nX, nY = GetWorldPos();
local nNpcIndex = 0;
local t=0;

	SetNpcLifeTime(index,15);--使得尸体消失
	
	if nMemCount == 0 then -- 玩家未组队
		nNpcIndex = CreateNpc("Hoan Tng (C� Dng Th�)","Tr蕁 M� Th驢oan Tng ",nMapId, nX, nY);
		SetNpcLifeTime(nNpcIndex,1800);
		SetNpcScript(nNpcIndex,"\\script\\西北区\\沙漠迷宫\\npc\\幻象古阳兽.lua");
		TaskTip("Khi  ti猽 di謙 秓 秐h Th鑞g l躰h tng binh m�, Hoan Tng bi課 h鉧 th祅h Tr蕁 M� Th�!");
		Msg2Player("Khi  ti猽 di謙 秓 秐h Th鑞g l躰h tng binh m�, Hoan Tng bi課 h鉧 th祅h Tr蕁 M� Th�!");
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
			if nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then	
				TaskTip("Khi  ti猽 di謙 秓 秐h Th鑞g l躰h tng binh m�, Hoan Tng bi課 h鉧 th祅h Tr蕁 M� Th�!");
				Msg2Player("Khi  ti猽 di謙 秓 秐h Th鑞g l躰h tng binh m�, Hoan Tng bi課 h鉧 th祅h Tr蕁 M� Th�!");
				if t == 0 then
					nNpcIndex = CreateNpc("Hoan Tng (C� Dng Th�)","Tr蕁 M� Th驢oan Tng ",nMapId, nX, nY);
					SetNpcLifeTime(nNpcIndex,1800);
					SetNpcScript(nNpcIndex,"\\script\\西北区\\沙漠迷宫\\npc\\幻象古阳兽.lua");
					t=1;
				end
			end
		end;
	PlayerIndex = nPreservedPlayerIndex; -- 重置之前储存的玩家编号
  end;
end
