--[[
    Module: Kü n¨ng sèng - §Þnh nghÜa kü n¨ng Tr¹ng th¸i håi phôc
    M« t¶: Module nµy ®Þnh nghÜa d÷ liÖu cho mét kü n¨ng sèng liªn quan ®Õn viÖc
           håi phôc tr¹ng th¸i (vÝ dô: m¸u, mana, n¨ng l­îng) trong trß ch¬i.
           Kü n¨ng nµy cã c¸c cÊp ®é kh¸c nhau vµ l­îng håi phôc t­¬ng øng.
]]

-- Bao gåm c¸c hµm hç trî cho kü n¨ng sèng.
Include("\\script\\lifeskill\\lifeskill_functions.lua")

-- B¶ng d÷ liÖu kü n¨ng.
SKILLS = {
    -- M¶ng 1: Cã thÓ lµ c¸c cÊp ®é kinh nghiÖm cÇn thiÕt ®Ó lªn cÊp kü n¨ng.
    {2, 3, 5, 6, 8, 9, 11, 12, 14, 15},

    -- M¶ng 2: Ch­a râ ý nghÜa, cã thÓ lµ mét hÖ sè hoÆc mét thuéc tÝnh kh¸c cña kü n¨ng.
    -- Gi¸ trÞ lu«n lµ 1 ë mäi cÊp ®é.
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1},

    -- M¶ng 3: T­¬ng tù nh­ m¶ng 2, gi¸ trÞ lu«n lµ 1 ë mäi cÊp ®é.
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1},

    -- M¶ng 4: Cã thÓ lµ l­îng tr¹ng th¸i ®­îc håi phôc ë mçi cÊp ®é kü n¨ng.
    {400, 1200, 2400, 4000, 6000, 8800, 11000, 13300, 15000, 0},
}
