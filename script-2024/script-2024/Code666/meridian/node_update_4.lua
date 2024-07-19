--[[
    Module: HuyÖt vŞ yªu cÇu cÊp ®é huyÖt vŞ kh¸c
    M« t¶: Module nµy chøa c¸c hµm kiÓm tra xem ng­êi ch¬i ®· ®¸p øng ®iÒu kiÖn
           ®Ó kİch ho¹t mét huyÖt vŞ cô thÓ hay ch­a. §iÒu kiÖn dùa trªn viÖc
           ®¹t ®Õn mét cÊp ®é yªu cÇu ë mét sè huyÖt vŞ kh¸c.
]]

-- Hµm lÊy chØ sè cña mét huyÖt vŞ trong danh s¸ch
function _get_this_node_index(nNodeId)
    local nThisIndex = 0
    for i = 1, #t_node_id_list do
        if t_node_id_list[i] == nNodeId then
            nThisIndex = i
            break
        end
    end
    return nThisIndex
end

-- Hµm tİnh to¸n cÊp ®é yªu cÇu cña huyÖt vŞ ®iÒu kiÖn
function _get_require_level(nLevel)
    return nLevel - 1
end

-- Danh s¸ch ID c¸c huyÖt vŞ cÇn kiÓm tra ®iÒu kiÖn
t_node_id_list = {4}  -- Trong vİ dô nµy, chØ cã huyÖt vŞ cã ID lµ 4 cÇn kiÓm tra ®iÒu kiÖn

-- Danh s¸ch c¸c huyÖt vŞ ®iÒu kiÖn vµ cÊp ®é yªu cÇu t­¬ng øng
t_require_node_list = {
    {65, "Khİ Xung", _get_require_level}, -- HuyÖt vŞ Khİ Xung, cÊp ®é yªu cÇu = cÊp ®é hiÖn t¹i cña huyÖt vŞ cÇn kiÓm tra - 1
    -- Cã thÓ thªm nhiÒu huyÖt vŞ ®iÒu kiÖn kh¸c vµo ®©y
}

--[[
    Hµm: CheckCondition
    Tham sè:
        - nNodeId: ID cña huyÖt vŞ cÇn kiÓm tra.
        - nLevel: CÊp ®é hiÖn t¹i cña huyÖt vŞ cÇn kiÓm tra.
        - bNotify: Cê th«ng b¸o (1: hiÓn thŞ th«ng b¸o lçi, 0: kh«ng hiÓn thŞ).
    M« t¶:
        KiÓm tra xem c¸c huyÖt vŞ ®iÒu kiÖn ®· ®¹t cÊp ®é yªu cÇu hay ch­a.
        - DuyÖt qua danh s¸ch t_require_node_list ®Ó kiÓm tra tõng huyÖt vŞ ®iÒu kiÖn.
        - NÕu bÊt kú huyÖt vŞ ®iÒu kiÖn nµo kh«ng ®¹t cÊp ®é yªu cÇu, tr¶ vÒ 0 (thÊt b¹i)
          vµ hiÓn thŞ th«ng b¸o lçi nÕu bNotify = 1.
    Tr¶ vÒ: 1 nÕu tÊt c¶ c¸c huyÖt vŞ ®iÒu kiÖn ®Òu ®¹t yªu cÇu, 0 nÕu kh«ng.
]]
function CheckCondition(nNodeId, nLevel, bNotify)
    -- NÕu nNodeId cã trong t_node_id_list th× míi cÇn kiÓm tra ®iÒu kiÖn
    local nThisIndex = _get_this_node_index(nNodeId)
    if nThisIndex > 0 then
        for i = 1, #t_require_node_list do
            -- Tİnh to¸n cÊp ®é yªu cÇu cña huyÖt vŞ ®iÒu kiÖn
            local nRequireLevel = t_require_node_list[i][3](nLevel)
            local nCheckNodeId = t_require_node_list[i][1]
            -- LÊy cÊp ®é hiÖn t¹i cña huyÖt vŞ ®iÒu kiÖn, mÆc ®Şnh lµ 0 nÕu ch­a ®­îc kİch ho¹t
            local nCheckNodeLevel = MeridianGetNodeLevel(nCheckNodeId) or 0
            -- NÕu cÊp ®é hiÖn t¹i ch­a ®ñ, tr¶ vÒ 0 (thÊt b¹i)
            if nCheckNodeLevel < nRequireLevel then
                if bNotify == 1 then
                    Msg2Player(string.format("%s huyÖt vŞ ch­a ®¹t ®Õn tÇng %d, ®iÓm huyÖt thÊt b¹i", t_require_node_list[i][2], nRequireLevel))
                end
                return 0
            end
        end
    end

    return 1  -- Thµnh c«ng
end

--[[
    Hµm: GetConditionDesc
    Tham sè:
        - nNodeId: ID cña huyÖt vŞ.
        - nLevel: CÊp ®é cña huyÖt vŞ.
    M« t¶:
        LÊy m« t¶ c¸c ®iÒu kiÖn cÇn thiÕt ®Ó kİch ho¹t huyÖt vŞ (nÕu cã).
    Tr¶ vÒ: Chuçi m« t¶ ®iÒu kiÖn.
]]
function GetConditionDesc(nNodeId, nLevel)
    local str = ""
    -- NÕu nNodeId cã trong t_node_id_list th× míi cÇn lÊy m« t¶ ®iÒu kiÖn
    if _get_this_node_index(nNodeId) > 0 then
        for i = 1, #t_require_node_list do
            local nRequireLevel = t_require_node_list[i][3](nLevel)
            if nRequireLevel >= 1 then
                local strTemp = string.format("%s huyÖt vŞ ®· ®¹t tÇng %d", t_require_node_list[i][2], nRequireLevel)
                if i == 1 then -- §iÒu kiÖn ®Çu tiªn
                    str = strTemp
                else
                    str = str .. "\n" .. strTemp -- Nèi c¸c ®iÒu kiÖn b»ng xuèng dßng
                end
            end
        end
    end
    return str
end

--[[
    Hµm: DoLevelUpdateCallBack
    Tham sè:
        - nNodeId: ID cña huyÖt vŞ ®­îc cËp nhËt.
        - nNewLevel: CÊp ®é míi cña huyÖt vŞ.
    M« t¶:
        Hµm gäi l¹i sau khi cÊp ®é huyÖt vŞ ®­îc cËp nhËt.
        HiÖn t¹i kh«ng cã hµnh ®éng cô thÓ nµo ®­îc thùc hiÖn.
    Tr¶ vÒ: 1 (lu«n thµnh c«ng).
]]
function DoLevelUpdateCallBack(nNodeId, nNewLevel)
    return 1
end
