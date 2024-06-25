-- ====================== 文件信息 ====================== 
                                                          
-- 剑侠情缘onlineII 通缉任务传信烟火文件                 
-- Edited by starry night                                 
-- 2005/11/28 PM 17:40                                    
                                                          
-- ======================================================

--引用通缉任务头文件
Include("\\script\\task\\killer\\killer_head.lua");

function OnUse() 

	local nMapID = GetWorldPos();
	
	if GetPKEnmityState() > 0 then
		Talk(1,"end_dialog"," � tr筺g th竔 so t礽 kh玭g cho ph衟 d飊g v藅 ph萴 n祔!")
		return
	end	

	if GetFightState() == 1 and nMapID < 700 then
		Say("B筺 x竎 nh薾 mu鑞 g鋓 1 Nh蕋 Ph萴 Л阯g s竧 th� ra gi髉 s鴆 cho b筺?",
				2,
				"Л頲/yes",
				"Kh玭g c莕/no")
	else
		Talk(1,"","B筺 ch� c� th� s� d鬾g v藅 ph萴 n祔 � ngo礽 th祅h!");
	
	end;
end;

function yes()
	if GetPKEnmityState() > 0 then
		Talk(1,"end_dialog"," � tr筺g th竔 so t礽 kh玭g cho ph衟 d飊g v藅 ph萴 n祔!")
		return
	end	
	if GetFightState() ~= 1 then
		Talk(1,"","B筺 ch� c� th� s� d鬾g v藅 ph萴 n祔 � ngo礽 th祅h!");
		return
	end

	local nLastUseTime = GetTask(TASK_USEYANHUO_TIME);
	local nNowTime = GetTime();
	local nTime = nNowTime - nLastUseTime;
	local nRemainTime = nTime;
	local strTime = "";
		
		nTime = 900 - nTime;
		
		if nTime < 0 then
			nTime = 0;
		end;
		
		strTime = TurnTime(nTime);
		
		if nRemainTime < 900 then
			Say("Kh玭g th� li猲 t鬰 s� d鬾g v藅 ph萴 n祔 trong <color=yellow>15<color> ph髏. (Th阨 gian s� d鬾g c遪"..strTime..")",0);
			return
		end;
	
	local nDelOk = DelItem(2,1,203,1,1);
	
		if nDelOk ~=1 then 
			return
		end;
		
		DoFireworks(808,1);--烟花效果
	
	local nTopKillerName,nTopKillerMode = GetTopKillerData();
	local nMapID,nWx,nWy = GetWorldPos(); 
	local nTopKillerIndex = CreateNpc(nTopKillerMode,nTopKillerName,nMapID,nWx,nWy,-1,1,1,100);
	
		SetTask(TASK_USEYANHUO_TIME,nNowTime);
		
		--设置在该地图生成杀手生存时间为一小时	
		SetNpcLifeTime(nTopKillerIndex,3600);  

		--设置顶级杀手脚本
		SetNpcScript(nTopKillerIndex,"\\script\\task\\killer\\killer_talk_top.lua");
		
		TaskTip("Ph秈 h� g鬰 t猲 s竧 th� u m鬰 n祔 trong v遪g 60 ph髏!"); 
	
end;

function no()

end;