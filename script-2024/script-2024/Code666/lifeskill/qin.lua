-- qin.lua
--[[
    Module: Kü n¨ng sèng - §Şnh nghÜa kü n¨ng CÇm
    M« t¶: Module nµy ®Şnh nghÜa d÷ liÖu cho mét kü n¨ng sèng liªn quan ®Õn viÖc ch¬i ®µn
           (cÇm) trong trß ch¬i. Kü n¨ng nµy cã c¸c cÊp ®é kh¸c nhau vµ cã thÓ mang l¹i
           l­îng tµi nguyªn hoÆc ®iÓm kinh nghiÖm t­¬ng øng.
]]

-- Bao gåm c¸c hµm hç trî cho kü n¨ng sèng.
Include("\\script\\lifeskill\\lifeskill_functions.lua")

-- B¶ng d÷ liÖu kü n¨ng CÇm.
SKILLS = {
    -- M¶ng 1: Cã thÓ lµ c¸c cÊp ®é kinh nghiÖm cÇn thiÕt ®Ó lªn cÊp kü n¨ng CÇm.
    {4, 5, 6, 7, 8, 9, 10, 11, 12, 13},

    -- M¶ng 2: Cã thÓ lµ sè lÇn ch¬i ®µn tèi ®a mçi ngµy ë mçi cÊp ®é kü n¨ng.
    {3, 3, 3, 3, 3, 3, 3, 3, 3, 3},

    -- M¶ng 3: Ch­a râ ı nghÜa, cã thÓ lµ mét hÖ sè hoÆc mét thuéc tİnh kh¸c cña kü n¨ng.
    -- Gi¸ trŞ lu«n lµ 1 ë mäi cÊp ®é.
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1},

    -- M¶ng 4: Cã thÓ lµ l­îng tµi nguyªn thu thËp ®­îc hoÆc ®iÓm kinh nghiÖm nhËn ®­îc ë mçi cÊp ®é kü n¨ng.
    {400, 1200, 2400, 4000, 6000, 8800, 11000, 13300, 15000, 0},
}
