--10月活动玫瑰礼花脚本
--by liubo

Include("\\script\\online_activites\\head\\activity_normal_head.lua")
function OnUse(nItemIndex)
	--时间判断
	local nCurrentTime = GetTime()
	local nInTime = MkTime(2011,10,07,0,0,0)
	local nOutTime = MkTime(2011,11,07,0,0,0)
	if nCurrentTime > nOutTime or nCurrentTime < nInTime then
		Talk(1,"","V藅 ph萴  qu� h筺 s� d鬾g")
		return
	end
	local tbActivity,nItemSeq = gf_VnGetActivityByItemIndex(nItemIndex)
	if tbActivity then
		tbActivity:ItemPrizeOnUse(nItemIndex,nItemSeq)
	end
end