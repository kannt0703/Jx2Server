--mission内帮会大使npc
--分配神兽
--退出mission
Include("\\script\\missions\\tong_melee\\tm_head.lua")
Include("\\script\\lib\\talktmp.lua")

function main()
	local tSay = {
		"\n ph﹏ ph鑙 Th莕 Th�/tm_assign_beast",
		"\n r髏 kh醝 chi課 trng/tm_leave_battle",
		"\n T筰 h� ch� xem qua th玦/nothing",
	}
	Say(TM_TONG_AD_NPC.."Th阨 gian c� h筺, i trng nhanh nhanh ph﹏ ph鑙 th莕 th�, cu閏 chi課 s緋 頲 b総 u!", getn(tSay), tSay);
end