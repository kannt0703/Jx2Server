-------黑无常之猛毒刀配方学习脚本--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,3)
	if nGene==1 and nSKIllId==3 and nLevel>=70 then
		AddRecipe(995)
		AddRecipe(996)
		AddRecipe(997)
		AddRecipe(998)
		Msg2Player("B筺 h鋍 頲: M穘h чc 產o")
		DelItem(2,1,1084,1)
		else
			Msg2Player("C莕 k� n╪g c t筼 binh kh� ng緉 c蕄 70 tr� l猲 m韎 c� th� h鋍, 甶襲 ki謓 c馻 b筺 kh玭g !")	
	end
end