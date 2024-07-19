-- jiaoxiao.lua
--[[
    Module: Kü n¨ng sèng - §Şnh nghÜa kü n¨ng Giao TiÕu An ThÇn
    M« t¶: Module nµy ®Şnh nghÜa d÷ liÖu cho mét kü n¨ng sèng liªn quan ®Õn viÖc giao tiÕp
           vµ an ñi ng­êi kh¸c trong trß ch¬i, cã thÓ gióp håi phôc tr¹ng th¸i tinh thÇn
           hoÆc t¨ng c­êng mèi quan hÖ. Kü n¨ng nµy cã c¸c cÊp ®é kh¸c nhau vµ cã thÓ
           mang l¹i l­îng ®iÓm kinh nghiÖm hoÆc hiÖu øng t­¬ng øng.
]]

-- Bao gåm c¸c hµm hç trî cho kü n¨ng sèng.
Include("\\script\\lifeskill\\lifeskill_functions.lua")

-- B¶ng d÷ liÖu kü n¨ng Giao TiÕu An ThÇn.
SKILLS = {
    -- M¶ng 1: Cã thÓ lµ c¸c cÊp ®é kinh nghiÖm cÇn thiÕt ®Ó lªn cÊp kü n¨ng Giao TiÕu An ThÇn.
    {6, 8, 10, 12, 13, 14, 15, 16, 17, 18},

    -- M¶ng 2: Cã thÓ lµ sè lÇn sö dông kü n¨ng Giao TiÕu An ThÇn tèi ®a mçi ngµy ë mçi cÊp ®é.
    {3, 3, 3, 3, 3, 3, 3, 3, 3, 3},

    -- M¶ng 3: Ch­a râ ı nghÜa, cã thÓ lµ mét hÖ sè hoÆc mét thuéc tİnh kh¸c cña kü n¨ng.
    -- Gi¸ trŞ lu«n lµ 1 ë mäi cÊp ®é.
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1},

    -- M¶ng 4: Cã thÓ lµ ®iÓm kinh nghiÖm nhËn ®­îc hoÆc hiÖu øng cña kü n¨ng Giao TiÕu An ThÇn ë mçi cÊp ®é.
    {400, 1200, 2400, 4000, 6000, 8800, 11000, 13300, 15000, 0},
}
