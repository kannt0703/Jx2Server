-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 西北区任务物品 罗庚 Script
-- By StarryNight
-- 2007/07/02 AM 11:11

-- 幸福，其实就是那些不经意间被遗忘的片段。

-- ======================================================

-- 引用剧情任务头文件
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_head.lua");

function OnUse()

local nMapDataID = 0;
local nXpos,nYpos = 0,0;
local strTalk = {};
local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);
local Mapid,nxpos,nypos = GetWorldPos();

	--判断任务步骤
	if nStep_XBTask_01 == 24 then
	
		if Mapid == 513 then
		
			--已经破坏了一个风水穴或还没获得风水穴坐标
			if GetTask(FENGSHUIXUE_ID) == 0 then
				
				nMapDataID = random(1,getn(Fengshuixue_MapData));
				SetTask(FENGSHUIXUE_ID,nMapDataID);
				
			end
				
			nMapDataID = GetTask(FENGSHUIXUE_ID);
			nXpos = Fengshuixue_MapData[nMapDataID][3];
			nYpos = Fengshuixue_MapData[nMapDataID][4];
			
			strTalk = {
				"La Canh cho th蕐, "..nXpos.."},{"..nYpos.." � y c� d� thng, ch綾  ch輓h l� Phong Th駓 Huy謙."
				}	
		
		else
			
			strTalk = {
				"Li評 T飊g V﹏ ti襫 b鑙 t鮪g n鉯 La Canh c莕 頲 t � t莕g 1 Ho祅g L╪g m� th蕋 c� ph竧 huy t竎 d鬾g, s� d鬾g � y s� kh玭g cho k誸 qu� g� u."
				}
		
		end		
		
	elseif nStep_XBTask_01 == 25 then
		
		strTalk = {
			"Х ph� h駓 phong th駓 trong m�,  n l骳 ti誴 t鬰 n c鯽 v祇 t莕g 2 t譵 ngi Tr蕁 M� v� ti猽 di謙 Tr蕁 M� linh th�  ti課 v祇 t莕g 2 Ho祅g L╪g m� th蕋.",
			}
			
	elseif nStep_XBTask_01 == 21 then
	
		strTalk = {
			"La Canh n祔 ch綾 s� c� 輈h trong vi謈 甶 v祇 L╪g m�, ta ph秈 n t譵 Li評 ti襫 b鑙 h醝 cho r� m韎 頲.",
			}
			
	elseif nStep_XBTask_01 == 22 then
	
		 strTalk = {
			"Theo l阨 Li評 T飊g V﹏ ti襫 b鑙, La Canh ph秈 k誸 h頿 v韎 Ph� phong ch飝 m韎 s� d鬾g 頲, gi� Ph� phong ch飝  b� Tr秓 vng cp m蕋, ph秈 n ch� Th竎 B箃 Ho籲g t譵 hi觰 ng t躰h c馻 Nh蕋 Ph萴 Л阯g m韎 頲.",
			}
			
	elseif nStep_XBTask_01 == 23 then
	
		 strTalk = {
			"Tr秓 vng  l蕐 頲 Ph� phong ch飝 甶 v祇 t莕g 1 l╪g m�, chuy謓 kh玭g th� ch薽 tr�, ph秈 nhanh ch鉵g 畂箃 l筰 Ph� phong ch飝 ngay.",
			}

	else
		strTalk = {
			"V藅 n祔 dng nh�  kh玭g c遪 t竎 d鬾g n鱝.",
			}
			
		DelItem(2,0,714,1)
		
	end
	
	TalkEx("",strTalk);
	
end