-------行者服配方学习脚本--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,5)
	if nGene==1 and nSKIllId==5 and nLevel>=90 then
		AddRecipe(1069)
		AddRecipe(1070)
		AddRecipe(1071)
		AddRecipe(1072)
		Msg2Player("B筺 h鋍 頲 ph鑙 phng: ti猽 chu萵 nam y c蕄 9")
		Msg2Player("B筺 h鋍 頲 ph鑙 phng: kh玦 ng� nam y c蕄 9")
		Msg2Player("B筺 h鋍 頲 ph鑙 phng: y ph鬰 g頸 c秏 c蕄 9")		
		Msg2Player("B筺 h鋍 頲 ph鑙 phng: n閕 y quy課 r� c蕄 9")
		DelItem(2,1,3048,1)
		else
			Msg2Player("K� n╪g ch� t筼 h� gi竝 tr猲 c蕄 90 m韎 c� th� h鋍 頲 ph鑙 phng n祔, b筺 kh玭g  甶襲 ki謓!")	
	end
end