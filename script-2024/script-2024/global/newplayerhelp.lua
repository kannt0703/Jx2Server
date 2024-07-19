-- file: rescue.lua
-- by: Xsjcs
-- CreateDate: 2005-4-22

-- GetWorldTempTask(0)  L�y th�i gian hi�n t�i (gi�) c�a server
-- GetWorldTempTask(1)  L�y s� l��ng v�t ph�m �� ���c nh�n (trong ng�y)
-- GetTask(250)        Ki�m tra xem ng��i ch�i �� nh�n v�t ph�m trong gi� hi�n t�i ch�a

-- H�m h� tr� ng��i ch�i m�i
function newplayer_help()
    if GetLevel() >= 20 then -- Ki�m tra c�p �� c�a ng��i ch�i
        Say("Ta ph�ng m�nh Ho�ng th��ng, ph�t l��ng th�c v� ti�n b�c c�u t� n�n d�n! Ai t� c�p 20 tr� l�n ��u c� th� ��n nh�n", 0)
        -- N�u c�p �� ��, th�ng b�o ng��i ch�i c� th� nh�n c�u t�
    else
        Say("Ta ch� ���c ph�p c�u t� cho nh�ng t�n th� ��t c�p 20 m� th�i! Ng��i �� �� t� c�ch, c� mu�n nh�n kh�ng?", 3,
            "Hay qu�! Ta �ang kh�n kh� ��y! Ho�ng th��ng anh minh!/present", -- L�a ch�n nh�n c�u t�
            "Xin ch� gi�o, l�m sao �� ���c nh�n c�u t�?!/abouthelpgoods", -- L�a ch�n t�m hi�u th�m
            "Ta ��y m� ph�i �i nh�n c�u t� �!?/no") -- L�a ch�n t� ch�i
    end
end

-- H�m gi�i th�ch v� c�ch nh�n c�u t�
function abouthelpgoods()
    Say("Ta ph�ng m�nh Ho�ng th��ng, m�i ng�y �i ph�t c�u t� cho c�c t�n th� c�p 20 � Th�nh ��, Bi�n Kinh, Tuy�n Ch�u. C� c�ch m�i gi� ph�t 1 l�n. M�i ng�y ch� c� 100 ph�n, ai nhanh ch�n th� ���c!", 0)
end

-- H�m x� l� vi�c t�ng qu� c�u t�
function present()
    local nNowTime = GetWorldTempTask(0) -- L�y th�i gian hi�n t�i (gi�) c�a server
    local nQuantity = GetWorldTempTask(1) -- L�y s� l��ng v�t ph�m �� ���c nh�n (trong ng�y)
    local Utask250 = GetTask(250)        -- Ki�m tra xem ng��i ch�i �� nh�n v�t ph�m trong gi� hi�n t�i ch�a
    local nHour = tonumber(date("%m%d%H")) -- L�y ng�y v� gi� hi�n t�i (��nh d�ng mmddHH)

    -- N�u gi� hi�n t�i kh�c v�i gi� �� l�u, reset l�i s� l��ng v� th�i gian
    if nNowTime ~= nHour then
        SetWorldTempTask(0, nHour) -- C�p nh�t gi� hi�n t�i
        SetWorldTempTask(1, 0)    -- Reset s� l��ng v�t ph�m �� nh�n
        AddLocalNews("* * *Kh�m Sai ��i th�n �ang ph�t c�u t�, c�c t�n th� ��t c�p 20 h�y nhanh ch�n ��n Th�nh ��, Bi�n Kinh, Tuy�n Ch�u �� nh�n!* * *")
        -- Th�ng b�o s� ki�n c�u t�
    end

    nNowTime = GetWorldTempTask(0)
    nQuantity = GetWorldTempTask(1)

    -- N�u ng��i ch�i ch�a nh�n v�t ph�m trong gi� n�y v� s� l��ng ch�a ��t gi�i h�n
    if Utask250 ~= nNowTime and nQuantity < 100 then
        onTake() -- G�i h�m onTake (ch�a ���c ��nh ngh�a trong �o�n m� n�y) �� th�c hi�n vi�c t�ng qu�
        SetWorldTempTask(1, nQuantity + 1) -- T�ng s� l��ng v�t ph�m �� nh�n
        SetTask(250, nNowTime)              -- ��nh d�u ng��i ch�i �� nh�n trong gi� n�y
    elseif Utask250 == nNowTime then -- N�u ng��i ch�i �� nh�n r�i
        Say("Ng��i �� nh�n ph�n c�a m�nh r�i! H�y nh��ng cho ng��i kh�c nh�!", 0)
    else -- N�u s� l��ng �� ��t gi�i h�n
        Say("�i! Ng��i ngh�o � ��u m� nhi�u th�! Ng��i ��n ch�m ch�n r�i! M�t gi� sau h�y quay l�i nh�!", 0)
    end
end

-- H�m x� l� vi�c ng��i ch�i nh�n qu� c�u t�
function onTake()
    -- Ch�n ng�u nhi�n m�t s� t� 1 ��n 54
    local i = math.random(1, 54)

    -- T�ng qu� d�a tr�n s� ng�u nhi�n
    if i == 1 then
        Earn(10) -- T�ng 10 ��ng
        Msg2Player("B�n nh�n ���c 10 ��ng xu c�u t�!")
    elseif i == 2 then
        Earn(50) -- T�ng 50 ��ng
        Msg2Player("B�n nh�n ���c 50 ��ng xu c�u t�!")
    elseif i == 3 then
        Earn(100) -- T�ng 1 l��ng b�c
        Msg2Player("B�n nh�n ���c 1 l��ng b�c c�u t�!")
    elseif i == 4 then
        Earn(200) -- T�ng 2 l��ng b�c
        Msg2Player("B�n nh�n ���c 2 l��ng b�c c�u t�!")
    elseif i == 5 then
        AddItem(1, 2, 1, 2) -- T�ng 2 T�ng H�ng hoa
        Msg2Player("B�n nh�n ���c 2 T�ng H�ng hoa")
    elseif i == 6 then
        AddItem(1, 2, 2, 2) -- T�ng 2 C�t c�nh
        Msg2Player("B�n nh�n ���c 2 C�t c�nh")
    elseif i == 7 then
        AddItem(1, 2, 3, 2) -- T�ng 2 Ho�ng li�n
        Msg2Player("B�n nh�n ���c 2 Ho�ng li�n")
    elseif i == 8 then
        AddItem(1, 2, 8, 2) -- T�ng 2 Ba ��u
        Msg2Player("B�n nh�n ���c 2 Ba ��u!")
    elseif i == 9 then
        AddItem(1, 2, 9, 2) -- T�ng 2 X�c ve
        Msg2Player("B�n nh�n ���c 2 X�c ve")
    elseif i == 10 then
        AddItem(2, 2, 1, 2) -- T�ng 2 Tinh thi�t
        Msg2Player("B�n nh�n ���c 2 Tinh thi�t")
    elseif i == 11 then
        AddItem(2, 2, 2, 2) -- T�ng 2 B�ch luy�n cang
        Msg2Player("B�n nh�n ���c 2 B�ch luy�n cang")
    elseif i == 12 then
        AddItem(1, 2, 1, 2) -- T�ng 2 T�ng H�ng hoa
        Msg2Player("B�n nh�n ���c 2 T�ng H�ng hoa")
    elseif i == 13 then
        AddItem(2, 2, 9, 2) -- T�ng 2 Tr�ng M�c
        Msg2Player("B�n nh�n ���c 2 Tr�ng M�c!")
    elseif i == 14 then
        AddItem(2, 2, 10, 2) -- T�ng 2 Thi�t Ch��ng M�c
        Msg2Player("B�n nh�n ���c 2 Thi�t Ch��ng M�c")
	elseif ( i == 15 ) then
		AddItem(2,2,15,2)
		Msg2Player("B�n nh�n ���c 2 Da s�i")
	elseif ( i == 16 ) then
		AddItem(2,2,16,2)
		Msg2Player("B�n nh�n ���c 2 Da h�")
	elseif ( i == 17 ) then
		AddItem(2,2,21,2)
		Msg2Player("B�n nh�n ���c 2 H�c c�m")
	elseif ( i == 18 ) then
		AddItem(2,2,22,2)
		Msg2Player("B�n nh�n ���c 2 Ch�c c�m")
	elseif ( i == 19 ) then
		AddItem(1,3,1,2)
		Msg2Player("B�n nh�n ���c 2 Th�t th�")
	elseif ( i == 20 ) then
		AddItem(1,3,2,2)
		Msg2Player("B�n nh�n ���c 2 Th�t g�")
	elseif ( i == 21 ) then
		AddItem(1,3,9,2)
		Msg2Player("B�n nh�n ���c 2 Quang Th�ng ma")
	elseif ( i == 22 ) then
		AddItem(1,3,10,2)
		Msg2Player("B�n nh�n ���c 2 ��u Khuynh")
	elseif ( i == 23 ) then
		AddItem(1,0,1,2)
		Msg2Player("B�n nh�n ���c 2 cu�n b�ng")
	elseif ( i == 24 ) then
		AddItem(1,0,2,2)
		Msg2Player("B�n nh�n ���c 2 Kim S�ng t�n")
	elseif ( i == 25 ) then
		AddItem(1,0,3,2)
		Msg2Player("B�n nh�n ���c 2 Ch� Huy�t t�n")
	elseif ( i == 26 ) then
		AddItem(1,0,7,2)
		Msg2Player("B�n nh�n ���c 2 Ti�u Ho�n ��n")
	elseif ( i == 27 ) then
		AddItem(1,0,12,2)
		Msg2Player("B�n nh�n ���c 2 Thanh T�m t�n")
	elseif ( i == 28 ) then
		AddItem(1,1,1,2)
		Msg2Player("B�n nh�n ���c 2 B�nh ng�")
	elseif ( i == 29 ) then
		AddItem(1,1,2,2)
		Msg2Player("B�n nh�n ���c 2 C�m n�m")
	elseif ( i == 30 ) then
		AddItem(2,5,1,2)
		Msg2Player("B�n nh�n ���c 2 Gi�m ��nh ph�!")
	elseif ( i == 31 ) then
		AddItem(2,5,2,2)
		Msg2Player("B�n nh�n ���c 2 Gi�m ��nh ph�!")
	elseif ( i == 32 ) then
		AddItem(2,4,1,1)
		Msg2Player("B�n nh�n ���c 1 �m H�o Th�ch!")
	elseif ( i == 33 ) then
		AddItem(2,4,8,1)
		Msg2Player("B�n nh�n ���c 1 D��ng H�o Th�ch!")
	elseif ( i == 34 ) then
		AddItem(1,5,1,2)
		Msg2Player("B�n nh�n ���c 2 H�i ph� Bi�n Kinh")
	elseif ( i == 35 ) then
		AddItem(1,5,2,2)
		Msg2Player("B�n nh�n ���c 2 H�i ph� Th�nh ��")
	elseif ( i == 36 ) then
		AddItem(0,107,31,1)
		Msg2Player("B�n nh�n ���c 1 Tr��ng Quy�n Ph�!")
	elseif ( i == 37 ) then
		AddItem(0,2,14,1)
		Msg2Player("B�n nh�n ���c 1 Hi�p Thi�u Ki�m!")
	elseif ( i == 38 ) then
		AddItem(0,2,15,1)
		Msg2Player("B�n nh�n ���c 1 T�ng V�n Ki�m!")
	elseif ( i == 39 ) then
		AddItem(0,5,27,1)
		Msg2Player("B�n nh�n ���c 1 Hi�p Thi�u C�n!")
	elseif ( i == 40 ) then
		AddItem(0,5,28,1)
		Msg2Player("B�n nh�n ���c 1 T� Mi C�n!")
	elseif ( i == 41 ) then
		AddItem(0,1,40,1)
		Msg2Player("B�n nh�n ���c 1 Hi�p Thi�u �m kh�!")
	elseif ( i == 42 ) then
		AddItem(0,1,41,1)
		Msg2Player("B�n nh�n ���c 1 Ng� Quang th�ch!")
	elseif ( i == 43 ) then
		AddItem(0,3,53,1)
		Msg2Player("B�n nh�n ���c 1 Gi�i �ao!")
	elseif ( i == 44 ) then
		AddItem(0,10,64,1)
		Msg2Player("B�n nh�n ���c 1 Ng�c V�n C�m")
	elseif ( i == 45 ) then
		AddItem(0,9,75,1)
		Msg2Player("B�n nh�n ���c 1 Ph�n Quan b�t")
	elseif ( i == 46 ) then
		AddItem(0,8,86,1)
		Msg2Player("B�n nh�n ���c 1 T�ch tr��ng")
	elseif ( i == 47 ) then
		AddItem(0,100,1,1)
		Msg2Player("B�n nh�n ���c 1 Hi�pThi�u B� y!")
	elseif ( i == 48 ) then
		AddItem(0,100,2,1)
		Msg2Player("B�n nh�n ���c 1 H�c C�m B� Y")
	elseif ( i == 49 ) then
		AddItem(0,100,19,1)
		Msg2Player("B�n nh�n ���c 1 Hi�pThi�u Y!")
	elseif ( i == 50 ) then
		AddItem(0,100,20,1)
		Msg2Player("B�n nh�n ���c 1 Thi�t H� Uy�n")
	elseif ( i == 51 ) then
		AddItem(0,100,37,1)
		Msg2Player("B�n nh�n ���c 1 Th�i Th��ng")
	elseif ( i == 52 ) then
		AddItem(0,100,38,1)
		Msg2Player("B�n nh�n ���c 1 T� L�ng Th��ng")
	elseif ( i == 53 ) then
		AddItem(0,100,55,1)
		Msg2Player("B�n nh�n ���c 1 V� Th��ng")
	else
		AddItem(0,100,56,1)
		Msg2Player("B�n nh�n ���c 1 H�ng V�n Th��ng")
	end
end

-- H�m x� l� khi ng��i ch�i t� ch�i nh�n qu�
function no()
    Say("Th�y ng��i c� ch� kh� nh� v�y, b�n quan v� c�ng kh�m ph�c!", 0)
end