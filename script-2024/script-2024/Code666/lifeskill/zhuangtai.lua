--[[
    Module: K� n�ng s�ng - ��nh ngh�a k� n�ng Tr�ng th�i h�i ph�c
    M� t�: Module n�y ��nh ngh�a d� li�u cho m�t k� n�ng s�ng li�n quan ��n vi�c
           h�i ph�c tr�ng th�i (v� d�: m�u, mana, n�ng l��ng) trong tr� ch�i.
           K� n�ng n�y c� c�c c�p �� kh�c nhau v� l��ng h�i ph�c t��ng �ng.
]]

-- Bao g�m c�c h�m h� tr� cho k� n�ng s�ng.
Include("\\script\\lifeskill\\lifeskill_functions.lua")

-- B�ng d� li�u k� n�ng.
SKILLS = {
    -- M�ng 1: C� th� l� c�c c�p �� kinh nghi�m c�n thi�t �� l�n c�p k� n�ng.
    {2, 3, 5, 6, 8, 9, 11, 12, 14, 15},

    -- M�ng 2: Ch�a r� � ngh�a, c� th� l� m�t h� s� ho�c m�t thu�c t�nh kh�c c�a k� n�ng.
    -- Gi� tr� lu�n l� 1 � m�i c�p ��.
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1},

    -- M�ng 3: T��ng t� nh� m�ng 2, gi� tr� lu�n l� 1 � m�i c�p ��.
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1},

    -- M�ng 4: C� th� l� l��ng tr�ng th�i ���c h�i ph�c � m�i c�p �� k� n�ng.
    {400, 1200, 2400, 4000, 6000, 8800, 11000, 13300, 15000, 0},
}
