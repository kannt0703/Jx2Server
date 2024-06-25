--File name:waitstop_timer.lua
--Describe:决出第一名后倒计时脚本，在决出第一名的同时启动这个计时器
--Create Date:2006-4-20
--Author:yanjun
Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
function OnTimer()
	if GetMSPlayerCount(MISSION_ID,CAMP_PLAYER) >= LEASTPLAYER then
		local timeleft = GetMissionV(MV_TIMELEFT);
		if timeleft == 0 then
			StopMissionTimer(MISSION_ID,WAITSTOP_TIMER_ID);
			Msg2MSAll(MISSION_ID,"Thi u k誸 th骳, c遪 v礽 ngi ch琲 v蒼 ch璦 v� ch. C玭g b� th� h筺g hi謓 t筰, sau 30 gi﹜ s� t� ng tho竧 ra kh醝 b秐 .");
			StartMissionTimer(MISSION_ID,WAITOUT_TIMER_ID,WAITOUT_TIME);
			SetMissionV(MV_ROOMSTATE,MS_STATE_WAITOUT);
			Report_Result(Get_Rank());
			Give_Award();
		else
			StopMissionTimer(MISSION_ID,WAITSTOP_TIMER_ID);
			StartMissionTimer(MISSION_ID,WAITSTOP_TIMER_ID,WAITSTOP_TIME);
			SetMissionV(MV_TIMELEFT,timeleft-1);
			timeleft = timeleft*WAITSTOP_TIME/18;
			Msg2MSAll(MISSION_ID," c遪 "..timeleft.." gi﹜ tr薾 u k誸 th骳.");		
		end;
	else
		StopMissionTimer(MISSION_ID,WAITSTOP_TIMER_ID);
		Msg2MSAll(MISSION_ID,"Do s� ngi tham gia di"..LEASTPLAYER.." ngi, cu閏 畊a kh玭g th� ti課 h祅h! Sau 30 gi﹜ s� t� ng tho竧 ra kh醝 b秐 .");
		StartMissionTimer(MISSION_ID,WAITOUT_TIMER_ID,WAITOUT_TIME);	--等待传送玩家离场
		SetMissionV(MV_ROOMSTATE,MS_STATE_WAITOUT);
		Report_Result(Get_Rank());
		Give_Award();
	end;
end;
