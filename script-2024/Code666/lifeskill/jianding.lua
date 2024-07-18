-- jianding.lua
--[[
    Module: Kü n¨ng sèng - §Şnh nghÜa kü n¨ng Gi¸m §Şnh
    M« t¶: Module nµy ®Şnh nghÜa d÷ liÖu cho mét kü n¨ng sèng liªn quan ®Õn viÖc gi¸m ®Şnh
           hoÆc thÈm ®Şnh c¸c vËt phÈm trong trß ch¬i. Kü n¨ng nµy cã c¸c cÊp ®é kh¸c nhau vµ
           cã thÓ mang l¹i ®iÓm kinh nghiÖm hoÆc hiÖu øng t­¬ng øng.
]]

-- Bao gåm c¸c hµm hç trî cho kü n¨ng sèng.
Include("\\script\\lifeskill\\lifeskill_functions.lua")

-- B¶ng d÷ liÖu kü n¨ng Gi¸m §Şnh.
SKILLS = {
    -- M¶ng 1: Cã thÓ lµ c¸c cÊp ®é kinh nghiÖm cÇn thiÕt ®Ó lªn cÊp kü n¨ng Gi¸m §Şnh.
    {2, 3, 3, 4, 4, 5, 5, 6, 6, 7},

    -- M¶ng 2: Ch­a râ ı nghÜa, cã thÓ lµ mét hÖ sè hoÆc mét thuéc tİnh kh¸c cña kü n¨ng.
    -- Gi¸ trŞ lu«n lµ 1 ë mäi cÊp ®é.
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1},

    -- M¶ng 3: T­¬ng tù nh­ m¶ng 2, gi¸ trŞ lu«n lµ 1 ë mäi cÊp ®é.
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1},

    -- M¶ng 4: Cã thÓ lµ ®iÓm kinh nghiÖm nhËn ®­îc hoÆc hiÖu øng cña kü n¨ng Gi¸m §Şnh ë mçi cÊp ®é.
    {400, 1200, 2400, 4000, 6000, 8800, 11000, 13300, 15000, 0},
}
