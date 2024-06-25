-- 越南2008 51 活动
-- 宝石

Include("\\script\\online\\viet_2008_51\\viet_51_function.lua");

function OnUse(nItemIdx)
	local nDate = tonumber(date("%Y%m%d"));
	if nDate >= DATE_2008_51_START_GEM and nDate <= DATE_2008_51_ITEM_END then
		Say("S� d鬾g b秓 th竎h s� nh薾 頲 1 甶觤 kinh nghi謒, c� mu鑞 s� d鬾g kh玭g?\nTh阨 h筺 s� d鬾g: <color=red>24h00 31-05-2008<color>",
			2,
			format("Л頲/#OnOpen(%d)", nItemIdx),
			"Kh玭g c莕 u/nothing");
	end
end

function OnOpen(nItemIdx)
	local nItem = 0                                 
	if GetLevel() < 20 then
		Say("ьi n c蕄 20 h穣 gh� l筰..", 0);
		return
	end
	if DelItemByIndex(nItemIdx,1) == 1 then
		gf_SetLogCaption("viet_2008_51_gem");
		gf_Modify("Exp", 1);
		gf_SetLogCaption("");
	end
end
