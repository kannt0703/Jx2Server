--[[
    T�p n�y ��nh ngh�a c�c ID nhi�m v� t�m th�i v� nhi�m v� h�ng ng�y ���c s� d�ng trong tr� ch�i.
    C�c ID n�y gi�p theo d�i ti�n tr�nh v� tr�ng th�i c�a c�c nhi�m v� n�y.
]]

-- Kho�ng b�t ��u cho c�c ID nhi�m v� t�m th�i.
_TMP_TASK_ID_VEIT_BEGIN = 256

-- C�c ID nhi�m v� t�m th�i �� theo d�i c�c th�ng s� kh�c nhau trong tr� ch�i.
TMP_TASK_ID_GUANKA_AWARD_EQUIP_COUNT = _TMP_TASK_ID_VEIT_BEGIN + 0  -- ��m s� l��ng trang b� ���c th��ng trong c�a �i. (S� d�ng trong mission_award_base.lua)
TMP_TASK_ID_OLY_COMPOSE_TEMP_INDEX = _TMP_TASK_ID_VEIT_BEGIN + 1    -- Ch� s� t�m th�i cho vi�c gh�p �� trong s� ki�n Olympic. (Th�m v�o sau, ch�a r� m�c ��ch)
TMP_TASK_ID_OLY_MHGL_TEMP_INDEX = _TMP_TASK_ID_VEIT_BEGIN + 2       -- Ch� s� t�m th�i cho vi�c gh�p �� MHGL trong s� ki�n Olympic. (Th�m v�o sau, ch�a r� m�c ��ch)
TMP_TASK_BW_YAJIN_LEITAI = _TMP_TASK_ID_VEIT_BEGIN + 3              -- L�u tr� th�ng tin v� nhi�m v� B�ch V� �m Kim L�i ��i.
TMP_TASK_TRANS_ZHENQI_STATE = _TMP_TASK_ID_VEIT_BEGIN + 4            -- Tr�ng th�i chuy�n ��i ch�n kh�.
TMP_TASK_ID_TAG_101 = _TMP_TASK_ID_VEIT_BEGIN + 5                   -- Tag 101 (d� ph�ng, kh�ng s� d�ng).
TMP_TASK_ID_TAG_106 = _TMP_TASK_ID_VEIT_BEGIN + 6                   -- Tag 106 (d�nh cho nhi�m v� ph�, kh�ng s� d�ng).
TMP_TASK_KF_TIME = _TMP_TASK_ID_VEIT_BEGIN + 7                     -- Th�i gian cho tr�n chi�n bang h�i.
TMP_TASK_KF_KILL_NUM = _TMP_TASK_ID_VEIT_BEGIN + 8                 -- S� l��ng ti�u di�t v� b� ti�u di�t trong tr�n chi�n bang h�i.
TMP_TASK_KF_SCORE = _TMP_TASK_ID_VEIT_BEGIN + 9                    -- �i�m c� nh�n trong tr�n chi�n bang h�i.
TMP_TASK_3V3_IS_DEAD = _TMP_TASK_ID_VEIT_BEGIN + 10                 -- C� ��nh d�u ng��i ch�i �� ch�t trong tr�n 3v3.
TMP_TASK_3V3_KILLED = _TMP_TASK_ID_VEIT_BEGIN + 11                  -- S� l��ng ti�u di�t trong tr�n 3v3.
TMP_TASK_TONG_MELEE_X = _TMP_TASK_ID_VEIT_BEGIN + 12                -- T�a �� X trong TongMelee.
TMP_TASK_TONG_MELEE_Y = _TMP_TASK_ID_VEIT_BEGIN + 13                -- T�a �� Y trong TongMelee.
TMP_TASK_TONG_MELEE_DOUBLESORCE = _TMP_TASK_ID_VEIT_BEGIN + 14      -- C� ��nh d�u t�ng g�p ��i s�t th��ng trong TongMelee.
TMP_TASK_TONG_MELEE_NOTREDUCESORCE = _TMP_TASK_ID_VEIT_BEGIN + 15   -- C� ��nh d�u kh�ng gi�m s�t th��ng trong TongMelee.
TMP_TASK_TAIXU_TAG = _TMP_TASK_ID_VEIT_BEGIN + 16                   -- Tag 16 (d� ph�ng, kh�ng s� d�ng).
TEMP_FIELD_PVP_READ_STATE = _TMP_TASK_ID_VEIT_BEGIN + 17           -- Tr�ng th�i ��c trong PvP.
TEMP_FIELD_PVP_CHOOSE_CAMP = _TMP_TASK_ID_VEIT_BEGIN + 18          -- L�a ch�n phe trong PvP.
TEMP_FIELD_PVP_TREE_TYPE = _TMP_TASK_ID_VEIT_BEGIN + 19             -- Lo�i c�y trong PvP.
TEMP_FIELD_PVP_CHOOSE_GXD = _TMP_TASK_ID_VEIT_BEGIN + 20           -- L�a ch�n GXD trong PvP.
TEMP_FIELD_PVP_WLMCJS_IDX = _TMP_TASK_ID_VEIT_BEGIN + 21           -- Ch? s? WLMCJS trong PvP.


-- Kho�ng k�t th�c cho c�c ID nhi�m v� t�m th�i (c� th� ���c s� d�ng �� ki�m tra t�nh h�p l� c�a ID).
_TMP_TASK_ID_VEIT_END = 511


---------------------------------------------------------------------------------------------------------

-- C�c ID nhi�m v� h�ng ng�y.

DAILY_TASK_ID_DAILY_MERDIAN1 = 1             -- Nhi�m v� kinh m�ch h�ng ng�y 1.
DAILY_TASK_ID_DAILY_MERDIAN2 = 2             -- Nhi�m v� kinh m�ch h�ng ng�y 2.
DAILY_TASK_ID_DAILY_GET_DAIBI = 3            -- Nhi�m v� nh�n ��i b� h�ng ng�y.
DAILY_TASK_ID_TRANS_ZHENQI_LIMIT = 4         -- Gi�i h�n chuy�n ��i ch�n kh� h�ng ng�y.
DAILY_TASK_ID_YINJUAN_LIMT = 5               -- Gi�i h�n thu th�p ng�n phi�u h�ng ng�y.

-- Gi� tr� ��nh d�u k�t th�c c�a c�c ID nhi�m v� h�ng ng�y.
__DAILY_TASK_ID_END__ = 6
