-- caiyao.lua
--[[
    Module: Kü n¨ng sèng - §Şnh nghÜa kü n¨ng Th¸i D­îc
    M« t¶: Module nµy ®Şnh nghÜa d÷ liÖu cho mét kü n¨ng sèng liªn quan ®Õn viÖc thu thËp
           hoÆc chÕ t¹o th¶o d­îc trong trß ch¬i. Kü n¨ng nµy cã c¸c cÊp ®é kh¸c nhau vµ
           l­îng tµi nguyªn thu thËp ®­îc hoÆc ®iÓm kinh nghiÖm t­¬ng øng.
]]

-- Bao gåm c¸c hµm hç trî cho kü n¨ng sèng.
Include("\\script\\lifeskill\\lifeskill_functions.lua")

-- B¶ng d÷ liÖu kü n¨ng Th¸i D­îc.
SKILLS = {
    -- M¶ng 1: Cã thÓ lµ c¸c cÊp ®é kinh nghiÖm cÇn thiÕt ®Ó lªn cÊp kü n¨ng Th¸i D­îc.
    {1, 1, 1, 2, 2, 2, 3, 3, 3, 4},

    -- M¶ng 2: Ch­a râ ı nghÜa, cã thÓ lµ mét hÖ sè hoÆc mét thuéc tİnh kh¸c cña kü n¨ng.
    -- Gi¸ trŞ lu«n lµ 1 ë mäi cÊp ®é.
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1},

    -- M¶ng 3: T­¬ng tù nh­ m¶ng 2, gi¸ trŞ lu«n lµ 1 ë mäi cÊp ®é.
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1},

    -- M¶ng 4: Cã thÓ lµ l­îng th¶o d­îc thu thËp ®­îc hoÆc ®iÓm kinh nghiÖm nhËn ®­îc ë mçi cÊp ®é kü n¨ng.
    {400, 1200, 2400, 4000, 6000, 8800, 11000, 13300, 15000, 0},
}
