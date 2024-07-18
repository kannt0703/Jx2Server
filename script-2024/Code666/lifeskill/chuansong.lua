-- chuansong.lua
--[[
    Module: K� n�ng s�ng - ��nh ngh�a k� n�ng Truy�n T�ng
    M� t�: Module n�y ��nh ngh�a d� li�u cho m�t k� n�ng s�ng li�n quan ��n vi�c d�ch chuy�n t�c th�i
           (truy�n t�ng) trong tr� ch�i. K� n�ng n�y c� c�c c�p �� kh�c nhau v�i s� l�n s� d�ng v�
           �i�m kinh nghi�m t��ng �ng.
]]

-- Bao g�m c�c h�m h� tr� cho k� n�ng s�ng.
Include("\\script\\lifeskill\\lifeskill_functions.lua")

-- B�ng d� li�u k� n�ng Truy�n T�ng.
SKILLS = {
    -- M�ng 1: C� th� l� c�c c�p �� kinh nghi�m c�n thi�t �� l�n c�p k� n�ng Truy�n T�ng.
    {0, 0, 1, 1, 1, 1, 2, 2, 2, 3},

    -- M�ng 2: C� th� l� s� l�n d�ch chuy�n t�i �a m�i ng�y � m�i c�p �� k� n�ng.
    {1, 1, 1, 1, 2, 2, 2, 2, 3, 3},

    -- M�ng 3: Ch�a r� � ngh�a, c� th� l� m�t h� s� ho�c m�t thu�c t�nh kh�c c�a k� n�ng.
    -- Gi� tr� lu�n l� 1 � m�i c�p ��.
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1},

    -- M�ng 4: C� th� l� �i�m kinh nghi�m nh�n ���c khi s� d�ng k� n�ng Truy�n T�ng � m�i c�p ��.
    {400, 1200, 2400, 4000, 6000, 8800, 11000, 13300, 15000, 0},
}
