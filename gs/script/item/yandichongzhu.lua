--脚本名称：炎帝重造图纸使用脚本
--脚本功能：给玩家显示重铸需要的材料
--策划人：小天天
--代码开发人：村长
--代码开发时间：2007-07-02
Tb_refound_mertiral = {
	{2,1,504,4,"N� Oa Tinh Th筩h"},
	{2,0,555,2,"C祅 Kh玭 ph�"},
	{2,1,503,5,"V� Ng蕁 Th駓"},
	{2,1,1009,100,"Thi猲 Th筩h Tinh Th筩h"},
}
function OnUse()
	local mertiral_need_dia = "Trong b鴆 tranh b筺 ph竧 hi謓 b筺 ph竧 hi謓 mu鑞 c <color=red>b� Vi猰 д<color> c莕 c� c竎 nguy猲 li謚 sau"
	for i = 1, getn(Tb_refound_mertiral) do
		local num_color = "<color=red>"
		local mertiral_num = GetItemCount(Tb_refound_mertiral[i][1],Tb_refound_mertiral[i][2],Tb_refound_mertiral[i][3])
		if mertiral_num >= Tb_refound_mertiral[i][4] then
			num_color = "<color=green>"
		end
		mertiral_need_dia = mertiral_need_dia .."\n    <color=yellow>"..Tb_refound_mertiral[i][5]..Tb_refound_mertiral[i][4].."<color>, hi謓 b筺 c�"..num_color..mertiral_num.."<color>;"
	end
	Talk(1,"",mertiral_need_dia)
end
