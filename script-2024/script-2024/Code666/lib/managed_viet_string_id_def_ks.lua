-- managed_viet_string_id_def_ks.lua
--[[
    Module: ��nh ngh�a ID chu�i Vi�t h�a (d�nh cho Kingsoft)
    M� t�: Module n�y ��nh ngh�a c�c ID (s� nh�n d�ng) cho c�c chu�i ti�ng Vi�t
           ���c s� d�ng trong tr� ch�i. C�c ID n�y ���c s� d�ng �� qu�n l� v� truy xu�t
           c�c chu�i ti�ng Vi�t t� m�t t�p INI ri�ng bi�t (managed_viet_string_ks.ini).

    Quy ��c:
        - ID t� 1 ��n 199999999: D�nh ri�ng cho VNG.
        - ID t� 2000000000 ��n 2099999999: D�nh ri�ng cho Kingsoft.
]]

-- Bao g�m c�c h�m h� tr� cho x� l� chu�i Vi�t h�a (n�u c�n).
Include("\\script\\lib\\no_trans\\managed_viet_string_ks.ini")

-- D�i ID d�nh ri�ng cho VNG (���c ��nh ngh�a trong m�t t�p kh�c).
-- VIET_STR_ID_VNG_BEGIN = 1
-- VIET_STR_ID_VNG_END = 199999999

-- D�i ID d�nh ri�ng cho Kingsoft.
VIET_STR_ID_KINGSOFT_BEGIN = 2000000000

-- ID c� th� cho chu�i "Kh�ng �� ti�n".
VIET_STR_ID_MONEY_NOT_ENOUGH = VIET_STR_ID_KINGSOFT_BEGIN + 0

VIET_STR_ID_KINGSOFT_END = 2099999999
