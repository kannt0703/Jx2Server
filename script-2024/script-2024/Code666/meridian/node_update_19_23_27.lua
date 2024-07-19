--[[
    Module: Kinh m¹ch nhiÖm vô hµng ngµy
    M« t¶: Module nµy chøa c¸c hµm liªn quan ®Õn viÖc kiÓm tra ®iÒu kiÖn vµ cËp nhËt nhiÖm vô hµng ngµy
    liªn quan ®Õn hÖ thèng kinh m¹ch trong trß ch¬i.

    C¸c hµm chİnh:
        - CheckCondition(nNodeId, nLevel, bNotify): KiÓm tra xem ®iÒu kiÖn ®Ó hoµn thµnh nhiÖm vô hµng ngµy cã ®¹t hay kh«ng.
        - GetConditionDesc(nNodeId, nLevel): LÊy m« t¶ vÒ ®iÒu kiÖn cÇn ®Ó hoµn thµnh nhiÖm vô.
        - DoLevelUpdateCallBack(nNodeId, nNewLevel): Thùc hiÖn c¸c hµnh ®éng cÇn thiÕt sau khi cÊp ®é kinh m¹ch ®­îc cËp nhËt.
]]

-- Danh s¸ch c¸c ID nót kinh m¹ch liªn quan ®Õn nhiÖm vô.
t_node_id_list = {19, 23, 27}

--[[
    Hµm: CheckCondition
    Tham sè:
        - nNodeId: ID cña nót kinh m¹ch hiÖn t¹i.
        - nLevel: CÊp ®é kinh m¹ch hiÖn t¹i.
        - bNotify: Cê x¸c ®Şnh cã hiÓn thŞ th«ng b¸o cho ng­êi ch¬i hay kh«ng (1: hiÓn thŞ, 0: kh«ng hiÓn thŞ).
    M« t¶:
        KiÓm tra xem ng­êi ch¬i cã thÓ thùc hiÖn nhiÖm vô hµng ngµy hay kh«ng dùa trªn c¸c ®iÒu kiÖn sau:
        1. T×m nót hiÖn t¹i trong danh s¸ch c¸c nót liªn quan ®Õn nhiÖm vô.
        2. DuyÖt qua danh s¸ch, kiÓm tra xem cã nót nµo kh¸c ®· ®­îc kİch ho¹t vµ cã cÊp ®é lín h¬n 0 hay kh«ng.
        3. NÕu cã, hiÓn thŞ th«ng b¸o (nÕu bNotify = 1) vµ tr¶ vÒ 0 (thÊt b¹i).
        4. NÕu kh«ng cã nót nµo kh¸c ®­îc kİch ho¹t, tr¶ vÒ 1 (thµnh c«ng).
    Tr¶ vÒ: 1 nÕu ®iÒu kiÖn tháa m·n, 0 nÕu kh«ng.
]]
function CheckCondition(nNodeId, nLevel, bNotify)
    -- T×m chØ sè cña nót hiÖn t¹i trong danh s¸ch
    local nThisIndex = 0
    for i = 1, #t_node_id_list do
        if t_node_id_list[i] == nNodeId then
            nThisIndex = i
            break
        end
    end

    -- NÕu t×m thÊy nót hiÖn t¹i, kiÓm tra c¸c nót kh¸c
    if nThisIndex > 0 then
        for i = 1, #t_node_id_list do
            local nCheckNodeId = t_node_id_list[i]
            local nCheckNodeLevel = MeridianGetNodeLevel(nCheckNodeId) or 0  -- LÊy cÊp ®é cña nót kiÓm tra
            if nCheckNodeLevel > 0 and nCheckNodeId ~= nNodeId then  -- KiÓm tra nót kh¸c cã ®­îc kİch ho¹t hay kh«ng
                if bNotify == 1 then
                    -- HiÓn thŞ th«ng b¸o lçi nÕu cã nót kh¸c ®­îc kİch ho¹t
                    Talk(1, "", "HuyÒn Khu, Chİ D­¬ng, Th©n Trô 3 huyÖt vŞ t­¬ng xung, ®iÓm huyÖt thÊt b¹i")
                end
                return 0 -- ThÊt b¹i
            end
        end
    end

    return 1 -- Thµnh c«ng
end

--[[
    Hµm: GetConditionDesc
    Tham sè:
        - nNodeId: ID cña nót kinh m¹ch.
        - nLevel: CÊp ®é kinh m¹ch.
    M« t¶:
        LÊy m« t¶ ®iÒu kiÖn cÇn ®Ó hoµn thµnh nhiÖm vô.
    Tr¶ vÒ: Chuçi m« t¶ ®iÒu kiÖn.
]]
function GetConditionDesc(nNodeId, nLevel)
    return "HuyÒn Khu, Chİ D­¬ng, Th©n Trô 3 huyÖt t­¬ng xung"
end

--[[
    Hµm: DoLevelUpdateCallBack
    Tham sè:
        - nNodeId: ID cña nót kinh m¹ch ®­îc cËp nhËt.
        - nNewLevel: CÊp ®é míi cña nót kinh m¹ch.
    M« t¶:
        Thùc hiÖn c¸c hµnh ®éng cÇn thiÕt sau khi cÊp ®é kinh m¹ch ®­îc cËp nhËt.
    Tr¶ vÒ: 1 nÕu thµnh c«ng, 0 nÕu thÊt b¹i.
]]
function DoLevelUpdateCallBack(nNodeId, nNewLevel)
    -- Ch­a cã hµnh ®éng cô thÓ nµo ®­îc thùc hiÖn ë ®©y.
    return 1  -- Tr¶ vÒ thµnh c«ng mÆc ®Şnh
end
