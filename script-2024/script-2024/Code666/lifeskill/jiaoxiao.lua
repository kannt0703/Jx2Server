-- jiaoxiao.lua
--[[
    Module: K� n�ng s�ng - ��nh ngh�a k� n�ng Giao Ti�u An Th�n
    M� t�: Module n�y ��nh ngh�a d� li�u cho m�t k� n�ng s�ng li�n quan ��n vi�c giao ti�p
           v� an �i ng��i kh�c trong tr� ch�i, c� th� gi�p h�i ph�c tr�ng th�i tinh th�n
           ho�c t�ng c��ng m�i quan h�. K� n�ng n�y c� c�c c�p �� kh�c nhau v� c� th�
           mang l�i l��ng �i�m kinh nghi�m ho�c hi�u �ng t��ng �ng.
]]

-- Bao g�m c�c h�m h� tr� cho k� n�ng s�ng.
Include("\\script\\lifeskill\\lifeskill_functions.lua")

-- B�ng d� li�u k� n�ng Giao Ti�u An Th�n.
SKILLS = {
    -- M�ng 1: C� th� l� c�c c�p �� kinh nghi�m c�n thi�t �� l�n c�p k� n�ng Giao Ti�u An Th�n.
    {6, 8, 10, 12, 13, 14, 15, 16, 17, 18},

    -- M�ng 2: C� th� l� s� l�n s� d�ng k� n�ng Giao Ti�u An Th�n t�i �a m�i ng�y � m�i c�p ��.
    {3, 3, 3, 3, 3, 3, 3, 3, 3, 3},

    -- M�ng 3: Ch�a r� � ngh�a, c� th� l� m�t h� s� ho�c m�t thu�c t�nh kh�c c�a k� n�ng.
    -- Gi� tr� lu�n l� 1 � m�i c�p ��.
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1},

    -- M�ng 4: C� th� l� �i�m kinh nghi�m nh�n ���c ho�c hi�u �ng c�a k� n�ng Giao Ti�u An Th�n � m�i c�p ��.
    {400, 1200, 2400, 4000, 6000, 8800, 11000, 13300, 15000, 0},
}
