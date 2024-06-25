--脚本名称：太虚任务创建刘铁匠调用脚本
--脚本功能：由relay发指令创建调用创建刘铁匠的脚本
--策划人：铁羊
--代码编写人：村长
--代码编写时间：2007-03-04
--代码修改记录：
function TaskShedule()
	-- 任务名字
	TaskName("Th╪ c蕄 nhi謒 v� Trang s鴆 Th竔 H�")
	-- 24个小时一次
	TaskInterval(1440)
	-- 设置触发时间
	local random_time_m = random(0,30)
	-- 重复执行无限次数
	TaskTime(21,random_time_m)
	TaskCountLimit(0)
	OutputMsg("Nhi謒 v� t╪g c蕄 trang s鴆 Th竔 H�: Th� r蘮 L璾 ch� t筼 th祅h c玭g!")
end
-- 定时执行的内容
function TaskContent()
	GlobalExecute("dw taixujwl_liu_crt()")
end
