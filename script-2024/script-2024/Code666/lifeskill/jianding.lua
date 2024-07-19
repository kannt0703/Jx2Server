-- jianding.lua
--[[
    Module: K� n�ng s�ng - ��nh ngh�a k� n�ng Gi�m ��nh
    M� t�: Module n�y ��nh ngh�a d� li�u cho m�t k� n�ng s�ng li�n quan ��n vi�c gi�m ��nh
           ho�c th�m ��nh c�c v�t ph�m trong tr� ch�i. K� n�ng n�y c� c�c c�p �� kh�c nhau v�
           c� th� mang l�i �i�m kinh nghi�m ho�c hi�u �ng t��ng �ng.
]]

-- Bao g�m c�c h�m h� tr� cho k� n�ng s�ng.
Include("\\script\\lifeskill\\lifeskill_functions.lua")

-- B�ng d� li�u k� n�ng Gi�m ��nh.
SKILLS = {
    -- M�ng 1: C� th� l� c�c c�p �� kinh nghi�m c�n thi�t �� l�n c�p k� n�ng Gi�m ��nh.
    {2, 3, 3, 4, 4, 5, 5, 6, 6, 7},

    -- M�ng 2: Ch�a r� � ngh�a, c� th� l� m�t h� s� ho�c m�t thu�c t�nh kh�c c�a k� n�ng.
    -- Gi� tr� lu�n l� 1 � m�i c�p ��.
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1},

    -- M�ng 3: T��ng t� nh� m�ng 2, gi� tr� lu�n l� 1 � m�i c�p ��.
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1},

    -- M�ng 4: C� th� l� �i�m kinh nghi�m nh�n ���c ho�c hi�u �ng c�a k� n�ng Gi�m ��nh � m�i c�p ��.
    {400, 1200, 2400, 4000, 6000, 8800, 11000, 13300, 15000, 0},
}
