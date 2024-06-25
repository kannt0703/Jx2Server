-- 世界任务
-- 成都-峨嵋 主线任务
-- 任务起始

-- wq : World Quest
-- id : 4, 54, 61

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("Th玭 d﹏", "green")..":"
quest_title = cf_ox_SetColor("T﹎ b蕋 an", "yellow").."\n"
quest_detail = cf_ox_SetColor("Gi髉 th玭 d﹏ di謙 xong Heo r鮪g, nh薾 頲 nguy猲 li謚 h鋋 ph�", "gray").."\n\n"
quest_description_1 = quest_giver.."L� Heo r鮪g n祔 c� l祄 ta b蕋 an, may m� l莕 n祔 c� ngi ra tay gi髉 . \n Ta c� 1 quy觧 b颽 ch� gi� l筰 c騨g kh玭g d飊g, nay t苙g ngi. N誹 ngi c� h鴑g th� v� v蕁  n祔 c� th� n Ph� s� trong c竎 th祅h th�  h鋍."
quest_confirm = ""
quest_cancel = ""

function wq_ox_obt_001_007()
	-- 以下是触发控制部分
	RemoveTrigger(GetRunningTrigger())		-- 删除当前触发器
	SetTask(111, 8)
	--CreateTrigger(0, 53, 61)

	-- 以下是任务奖励部分
	ModifyExp(200)							-- 获得任务经验奖励
	AddItem(2, 2, 29, 1)					-- 获得任务道具奖励 遁甲书
	
	-- 以下是文字显示部分
	TaskTip("Gi髉 th玭 d﹏ di謙 xong Heo r鮪g, nh薾 頲 nguy猲 li謚 h鋋 ph�")
	Say(quest_title..quest_detail..quest_description_1, 0)
end