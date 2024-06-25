-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 凤翔府NPC孙方仁Script
-- By StarryNight
-- 2007/08/04 AM 11:37

-- 周末的天气非常非常之好，o(∩_∩)o...哈哈

-- ======================================================

-- 引用剧情任务头文件
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()


local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);
local nStep_XBTask_02 = GetTask(TASK_XB_ID_02);
	
	---------------------------------- 西北区18分支1_9芷寒烈阳----------------------------------
	--求教孙方仁药人草一事
	if nStep_XBTask_01 == 38 then
		task_018_02_0();
		return
	end
	
	--带回或未带回10篇《千金翼方》残卷
	if nStep_XBTask_01 == 39 then
		task_018_03_0();
		return
	end
	
	--带回或尚未带回烈阳根
	if nStep_XBTask_01 == 40 then
		task_018_06_0();
		return
	end
	
	--还没消灭药人草与孙方仁对话
	if nStep_XBTask_01 == 41 then
		task_018_06_1();
		return
	end
	
	---------------------------------- 西北区19分支1_10付诸东流----------------------------------
	
	--与孙方仁对话让其帮忙伪造药人药方
	if nStep_XBTask_01 == 49 then
		task_019_08_0();
		return
	end
	
	---------------------------------- 西北区20分支1_11兵不厌诈----------------------------------
	
	--并行支线结束，汇总，取得伪造药人药方
	if nStep_XBTask_01 == 50 and nStep_XBTask_02 == 21 then
		task_020_01_0();
		return
	--并行支线未结束未取得伪造药人药方
	elseif nStep_XBTask_01 == 50 then
		task_019_08_1();
		return
	end
	
	--还未将伪造药方交给车轮霸王
	if nStep_XBTask_01 == 51 then
		task_020_01_1();
		return
	end
	
	--赠送炼丹洞门票
	if GetBit(GetTask(GIVE_TICKET_STATE),4) ~= 1 and GetTask(2031) >= 68 then
		give_ticket_01();
		return
	end
	
	--一般情况下的对话
	strTalk = {
		{"Thi猲 M玭 Йng tr� ho b� m竨, M筩h M玭 Йng thanh t﹎ gi秈 kh竧."},
		{"K� L﹏ c莔 m竨, tr� v誸 thng 產o ki誱, Л琻g Quy dng kh� huy誸."},
		}
	local i = random(1,getn(strTalk));

	TalkEx("",strTalk[i]);
	return
	
end;

--赠送门票脚本
function give_ticket_01()

local strTalk = {
	"T玭 Phng Nh﹏: <sex> kh玭g may r錳, trong m閠 m � Dc Vng ng m鋍 y Dc nh﹏ th秓. Ta cho r籲g sau khi Dc Vng b� nh b筰, Dc nh﹏ th秓 v� Dc nh﹏ c騨g ph秈 m蕋 甶 ch�, nghe n鉯 trong Dc Vng ng c� nhi襲 k� hoa d� th秓, kh玭g xem kh玭g 頲, trong ng l筰 v鮝 m鋍 Dc nh﹏ th秓, e r籲g Dc Vng v鮝 v� Dc Vng ng r錳.",
	"Ngi ch琲: L� th藅? Ta  d飊g T輈h Dng th駓 lo筰 b� Dc nh﹏ th秓 trong ng, c� r� c騨g  thi猽 h駓 r錳, sao m閠 m l筰 c� ch�?",
	"T玭 Phng Nh﹏: T鑓  ph竧 tri觧 Dc nh﹏ th秓 tuy ng kinh ng筩, nh璶g T輈h Dng c╪ c� th� kh綾 ph鬰, <sex> lo筰 b� Dc nh﹏ th秓 nh蕋 nh kh玭g sai. C� l� tr猲 ngi Dc Vng c� gi蕌 lo筰 Dc nh﹏ th秓, h緉 ta b� <sex> nh b筰, ch� t筸 th阨 r髏 lui kh醝 Dc Vng ng, ho芻 h緉 v鑞 ch璦 r阨 kh醝 Dc Vng ng, trong ng c遪 c� m藅 ng, ch髇g ta kh玭g bi誸 m� th玦.",
	}
	
	TalkEx("give_ticket_02",strTalk);
	
end

function give_ticket_02()

local strTalk = {
	"Ngi ch琲: Theo nh� l阨 ti猲 sinh, Dc Vng th藅 hung 竎, Dc nh﹏ t鑞 c� i t﹎ huy誸  ch� ra nh璶g l筰 b� h駓 trong ch韕 m総, ng l� s� nh鬰, sao kh玭g h薾 ch�? N誹 Dc Vng tr� th�, ta e r籲g kh� m�  ph遪g.",
	"T玭 Phng Nh﹏: Зy c騨g l� m鑙 lo c馻 ta, ngi n祔 th藅 t竛 t薾 lng t﹎, sao l筰 kh玭g tr� th� ch�? Dc Vng ng l� m閠 n琲 p, th薽 ch� c� Dc th秓 qu�  h駓 di謙, l祄 thu鑓 c� c玭g d鬾g kh雐 t� h錳 sinh. Trc y khi Dc Vng t譵 頲 ng n祔 c騨g k輈h ng nh� v藋, ch� ng ti誧 Dc nh﹏ th秓 r蕋 d� khi課 ngi sa v祇. N誹 gi醝 d飊g Dc th秓 n祔, th� th� gi韎 n祔 s� gi秈 頲 r蕋 nhi襲 b謓h hi觤 ngh蘯.",
	"Ngi ch琲: Ti猲 sinh, chi b籲g ta n Dc Vng ng xem c� th� 畊鎖 Dc Vng ra kh醝 ng kh玭g! Nh璶g Dc Vng tr鑞 � Luy謓 Кn ng, Thi猲 c﹏ i th筩h � c鯽 ng, e r籲g ch� th蕐 ngi gi� ng m韎 m� 頲. L莕 trc ta c秈 trang Dc Vng 甶 m閠 chuy課, c竎h n祔 e r籲g kh玭g d飊g 頲 n鱝.",
	}
	
	TalkEx("give_ticket_03",strTalk);
	
end

function give_ticket_03()

local strTalk = {
	"T玭 Phng Nh﹏:  t� <sex>収u鎖 h緉 ra kh醝 ng l� t鑤 nh蕋, v鮝 c� th� ph遪g tr� h鋋, v鮝 c� th� d飊g Dc th秓  c鴘 ngi. Dc nh﹏ tr玭g coi Luy謓 Кn ng th� t鑤 nh蕋. Ta  t鮪g nghi猲 c鴘 l祄 th� n祇  gi秏 uy l鵦 c馻 Dc nh﹏, ph竧 hi謓 Dc nh﹏ c騨g c� 甶觤 y誹,  ch輓h l� T輈h Dng c╪. Зy l� {T輈h Dng tinh hoa}, Dc nh﹏ c� l頸 h筰 c騨g ph秈 s� v藅 n祔, n誹 ng蕀 ph秈 s� m蕋 甶 c玭g l鵦. Ngi c� th� d飊g v藅 n祔  uy hi誴 ngi tr玭g coi thu鑓, v祇 Luy謓 Кn ng s� d� nh� tr� b祅 tay. C遪 n鱝, n誹 kh玭g th� 畊鎖 Dc Vng, sau n祔 ngi c� 頲 {T輈h Dng tinh hoa}, c騨g d� n Dc Vng ng gi竚 s竧 h祅h ng c馻 n�.",
	"Ngi ch琲: ng l� di謚 k�. Ti猲 sinh y猲 t﹎, ta nh蕋 nh s� b秓 v� c y h鋍 c馻 ti猲 sinh!",
	}
	
	TalkEx("",strTalk);
	AddItem(2,0,1034,1,1);--得到烈阳精华
	SetTask(GIVE_TICKET_STATE, SetBit(GetTask(GIVE_TICKET_STATE),4,1));
	
end