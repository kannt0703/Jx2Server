--[[
    Module: Kü n¨ng sèng - §Şnh nghÜa kü n¨ng
    M« t¶: Module nµy ®Şnh nghÜa d÷ liÖu cho mét kü n¨ng sèng (lifeskill) trong trß ch¬i.
           Kü n¨ng nµy cã vÎ liªn quan ®Õn viÖc chÕ t¹o hoÆc thu thËp tµi nguyªn,
           víi c¸c cÊp ®é kü n¨ng vµ l­îng tµi nguyªn thu thËp ®­îc t­¬ng øng.
]]

-- Bao gåm c¸c hµm hç trî cho kü n¨ng sèng.
Include("\\script\\lifeskill\\lifeskill_functions.lua")

-- B¶ng d÷ liÖu kü n¨ng.
SKILLS = {
    -- M¶ng 1: Cã thÓ lµ c¸c cÊp ®é kinh nghiÖm cÇn thiÕt ®Ó lªn cÊp kü n¨ng.
    {1, 1, 1, 2, 2, 2, 3, 3, 3, 4},

    -- M¶ng 2: Ch­a râ ı nghÜa, cã thÓ lµ mét hÖ sè hoÆc mét thuéc tİnh kh¸c cña kü n¨ng.
    -- Gi¸ trŞ lu«n lµ 1 ë mäi cÊp ®é.
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1},

    -- M¶ng 3: T­¬ng tù nh­ m¶ng 2, gi¸ trŞ lu«n lµ 1 ë mäi cÊp ®é.
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1},

    -- M¶ng 4: Cã thÓ lµ l­îng tµi nguyªn thu thËp ®­îc ë mçi cÊp ®é kü n¨ng.
    {400, 1200, 2400, 4000, 6000, 8800, 11000, 13300, 15000, 0},
}
