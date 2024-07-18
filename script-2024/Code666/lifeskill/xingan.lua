-- xingan.lua
--[[
    Module: K� n�ng s�ng - ��nh ngh�a k� n�ng An Th�n
    M� t�: Module n�y ��nh ngh�a d� li�u cho m�t k� n�ng s�ng li�n quan ��n vi�c
           an th�n ho�c thu th�p t�i nguy�n trong tr� ch�i. K� n�ng n�y c� c�c c�p ��
           kh�c nhau v� l��ng t�i nguy�n thu th�p ���c t��ng �ng.
]]

-- Bao g�m c�c h�m h� tr� cho k� n�ng s�ng.
Include("\\script\\lifeskill\\lifeskill_functions.lua")

-- B�ng d� li�u k� n�ng An Th�n.
SKILLS = {
    -- M�ng 1: C� th� l� c�c c�p �� kinh nghi�m c�n thi�t �� l�n c�p k� n�ng An Th�n.
    {6, 8, 10, 12, 13, 14, 15, 16, 17, 18},

    -- M�ng 2: C� th� l� s� l�n s� d�ng k� n�ng An Th�n t�i �a m�i ng�y � m�i c�p ��.
    {3, 3, 3, 3, 3, 3, 3, 3, 3, 3},

    -- M�ng 3: Ch�a r� � ngh�a, c� th� l� m�t h� s� ho�c m�t thu�c t�nh kh�c c�a k� n�ng.
    -- Gi� tr� lu�n l� 1 � m�i c�p ��.
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1},

    -- M�ng 4: C� th� l� l��ng t�i nguy�n thu th�p ���c ho�c hi�u �ng c�a k� n�ng An Th�n � m�i c�p ��.
    {400, 1200, 2400, 4000, 6000, 8800, 11000, 13300, 15000, 0},
}
