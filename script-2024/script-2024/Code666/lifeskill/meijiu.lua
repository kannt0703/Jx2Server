-- meijiu.lua
--[[
    Module: K� n�ng s�ng - ��nh ngh�a k� n�ng M� T�u (R��u ngon)
    M� t�: Module n�y ��nh ngh�a d� li�u cho m�t k� n�ng s�ng li�n quan ��n vi�c � r��u
           ho�c s�n xu�t �� u�ng trong tr� ch�i. K� n�ng n�y c� c�c c�p �� kh�c nhau v�
           l��ng s�n ph�m t�o ra ho�c kinh nghi�m nh�n ���c t��ng �ng.
]]

-- Bao g�m c�c h�m h� tr� cho k� n�ng s�ng.
Include("\\script\\lifeskill\\lifeskill_functions.lua")

-- B�ng d� li�u k� n�ng M� T�u.
SKILLS = {
    -- M�ng 1: C� th� l� c�c c�p �� kinh nghi�m c�n thi�t �� l�n c�p k� n�ng M� T�u.
    {1, 1, 1, 2, 2, 2, 3, 3, 3, 4},

    -- M�ng 2: Ch�a r� � ngh�a, c� th� l� m�t h� s� ho�c m�t thu�c t�nh kh�c c�a k� n�ng.
    -- Gi� tr� lu�n l� 1 � m�i c�p ��.
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1},

    -- M�ng 3: T��ng t� nh� m�ng 2, gi� tr� lu�n l� 1 � m�i c�p ��.
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1},

    -- M�ng 4: C� th� l� l��ng r��u ho�c s�n ph�m t�o ra ���c, ho�c �i�m kinh nghi�m nh�n ���c � m�i c�p �� k� n�ng.
    {400, 1200, 2400, 4000, 6000, 8800, 11000, 13300, 15000, 0},
}
