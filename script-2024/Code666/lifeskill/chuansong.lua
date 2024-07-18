-- chuansong.lua
--[[
    Module: Kü n¨ng sèng - §Şnh nghÜa kü n¨ng TruyÒn Tèng
    M« t¶: Module nµy ®Şnh nghÜa d÷ liÖu cho mét kü n¨ng sèng liªn quan ®Õn viÖc dŞch chuyÓn tøc thêi
           (truyÒn tèng) trong trß ch¬i. Kü n¨ng nµy cã c¸c cÊp ®é kh¸c nhau víi sè lÇn sö dông vµ
           ®iÓm kinh nghiÖm t­¬ng øng.
]]

-- Bao gåm c¸c hµm hç trî cho kü n¨ng sèng.
Include("\\script\\lifeskill\\lifeskill_functions.lua")

-- B¶ng d÷ liÖu kü n¨ng TruyÒn Tèng.
SKILLS = {
    -- M¶ng 1: Cã thÓ lµ c¸c cÊp ®é kinh nghiÖm cÇn thiÕt ®Ó lªn cÊp kü n¨ng TruyÒn Tèng.
    {0, 0, 1, 1, 1, 1, 2, 2, 2, 3},

    -- M¶ng 2: Cã thÓ lµ sè lÇn dŞch chuyÓn tèi ®a mçi ngµy ë mçi cÊp ®é kü n¨ng.
    {1, 1, 1, 1, 2, 2, 2, 2, 3, 3},

    -- M¶ng 3: Ch­a râ ı nghÜa, cã thÓ lµ mét hÖ sè hoÆc mét thuéc tİnh kh¸c cña kü n¨ng.
    -- Gi¸ trŞ lu«n lµ 1 ë mäi cÊp ®é.
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1},

    -- M¶ng 4: Cã thÓ lµ ®iÓm kinh nghiÖm nhËn ®­îc khi sö dông kü n¨ng TruyÒn Tèng ë mçi cÊp ®é.
    {400, 1200, 2400, 4000, 6000, 8800, 11000, 13300, 15000, 0},
}
