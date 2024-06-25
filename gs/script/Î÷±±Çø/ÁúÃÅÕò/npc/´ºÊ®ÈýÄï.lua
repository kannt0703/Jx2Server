-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 西北任务NPC春十三娘死亡Script
-- By StarryNight
-- 2007/06/7 PM 5:00

--相爱很难 

-- ======================================================

-- 引用剧情任务头文件
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnDeath(index)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();
local nMapId, nX, nY = GetWorldPos();
local strTalk = {
	"Xin c� nng cho mn v藅 t飝 th﹏  c鴘 ngi, 產 t�.",
	"Ngi c鴘 ai li猲 quan g� n ta? Ngi d鵤 v祇 g�  mn  ta ch�? ьi y ngi d竚 v� l� v韎 b� �.",
	"Xin c t閕 v韎 c� nng.",
	}

	--SetNpcLifeTime(index,15);--使得尸体消失
	
	if nMemCount == 0 then -- 玩家未组队
		if GetTask(TASK_XB_ID) == 12 then
			AddItem(2,0,690,1,1);--打倒春十三娘得到一个肚兜
			TalkEx("",strTalk);
			SetTask(TASK_XB_ID,13);
			TaskTip("Mau 甧m y誱 giao cho T玭 Nh� Li謒  gi秈 n鏸 s莡 tng t�.");
			Msg2Player("Mau 甧m y誱 giao cho T玭 Nh� Li謒  gi秈 n鏸 s莡 tng t�.");
		end;
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
			if GetTask(TASK_XB_ID) == 12 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
				AddItem(2,0,690,1,1);--打倒春十三娘得到一个肚兜
				TalkEx("",strTalk); 
				SetTask(TASK_XB_ID,13);
				TaskTip("Mau 甧m y誱 giao cho T玭 Nh� Li謒  gi秈 n鏸 s莡 tng t�.");
				Msg2Player("Mau 甧m y誱 giao cho T玭 Nh� Li謒  gi秈 n鏸 s莡 tng t�.");
			end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- 重置之前储存的玩家编号
  end;
end
