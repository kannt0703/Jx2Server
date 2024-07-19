-- managed_viet_string_id_def_ks.lua
--[[
    Module: §Þnh nghÜa ID chuçi ViÖt hãa (dµnh cho Kingsoft)
    M« t¶: Module nµy ®Þnh nghÜa c¸c ID (sè nhËn d¹ng) cho c¸c chuçi tiÕng ViÖt
           ®­îc sö dông trong trß ch¬i. C¸c ID nµy ®­îc sö dông ®Ó qu¶n lý vµ truy xuÊt
           c¸c chuçi tiÕng ViÖt tõ mét tÖp INI riªng biÖt (managed_viet_string_ks.ini).

    Quy ­íc:
        - ID tõ 1 ®Õn 199999999: Dµnh riªng cho VNG.
        - ID tõ 2000000000 ®Õn 2099999999: Dµnh riªng cho Kingsoft.
]]

-- Bao gåm c¸c hµm hç trî cho xö lý chuçi ViÖt hãa (nÕu cÇn).
Include("\\script\\lib\\no_trans\\managed_viet_string_ks.ini")

-- D¶i ID dµnh riªng cho VNG (®­îc ®Þnh nghÜa trong mét tÖp kh¸c).
-- VIET_STR_ID_VNG_BEGIN = 1
-- VIET_STR_ID_VNG_END = 199999999

-- D¶i ID dµnh riªng cho Kingsoft.
VIET_STR_ID_KINGSOFT_BEGIN = 2000000000

-- ID cô thÓ cho chuçi "Kh«ng ®ñ tiÒn".
VIET_STR_ID_MONEY_NOT_ENOUGH = VIET_STR_ID_KINGSOFT_BEGIN + 0

VIET_STR_ID_KINGSOFT_END = 2099999999
