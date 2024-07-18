--[[
    Module: HuyÖt vŞ yªu cÇu cÊp ®é huyÖt vŞ kh¸c
    M« t¶: Module nµy chøa c¸c hµm kiÓm tra ®iÒu kiÖn kİch ho¹t cña mét huyÖt vŞ cô thÓ
           trong trß ch¬i. Trong tr­êng hîp nµy, ®Ó kİch ho¹t huyÖt vŞ cã ID lµ 1,
           ng­êi ch¬i cÇn ®¹t ®Õn mét cÊp ®é nhÊt ®Şnh ë mét huyÖt vŞ kh¸c (huyÖt vŞ B¸ch Héi víi ID 13).
]]

-- Hµm lÊy chØ sè cña huyÖt vŞ trong danh s¸ch c¸c huyÖt vŞ cÇn kiÓm tra ®iÒu kiÖn
function _get_this_node_index(nNodeId)
    local nThisIndex = 0
    for i = 1, #t_node_id_list do        -- DuyÖt qua danh s¸ch t_node_id_list
        if t_node_id_list[i] == nNodeId then    -- KiÓm tra xem ID cã khíp víi ID cÇn t×m kh«ng
            nThisIndex = i
            break       -- Tho¸t khái vßng lÆp khi t×m thÊy
        end
    end
    return nThisIndex
end

-- Hµm tİnh to¸n cÊp ®é yªu cÇu cña huyÖt vŞ ®iÒu kiÖn
function _get_require_level(nLevel)
    return nLevel - 1  -- CÊp ®é yªu cÇu lu«n nhá h¬n 1 so víi cÊp ®é cña huyÖt vŞ ®ang kiÓm tra
end

-- Danh s¸ch ID c¸c huyÖt vŞ cÇn kiÓm tra ®iÒu kiÖn
t_node_id_list = {1}    -- ChØ cã huyÖt vŞ ID 1 cÇn kiÓm tra ®iÒu kiÖn trong vİ dô nµy

-- Danh s¸ch c¸c huyÖt vŞ ®iÒu kiÖn vµ hµm tİnh to¸n cÊp ®é yªu cÇu t­¬ng øng
t_require_node_list = {
    {13, "B¸ch Héi", _get_require_level}  -- HuyÖt vŞ ®iÒu kiÖn "B¸ch Héi" (ID 13), hµm tİnh cÊp ®é yªu cÇu lµ _get_require_level
}

--[[
    Hµm: CheckCondition
    Tham sè:
        - nNodeId: ID cña huyÖt vŞ cÇn kiÓm tra.
        - nLevel: CÊp ®é hiÖn t¹i cña huyÖt vŞ cÇn kiÓm tra.
        - bNotify: Cê th«ng b¸o (1: hiÓn thŞ th«ng b¸o lçi, 0: kh«ng hiÓn thŞ).
    M« t¶:
        KiÓm tra xem huyÖt vŞ ®iÒu kiÖn ®· ®¹t cÊp ®é yªu cÇu hay ch­a.
    Tr¶ vÒ:
        - 1: NÕu tÊt c¶ c¸c huyÖt vŞ ®iÒu kiÖn ®Òu ®¹t yªu cÇu.
        - 0: NÕu cã İt nhÊt mét huyÖt vŞ ®iÒu kiÖn ch­a ®¹t yªu cÇu.
]]
function CheckCondition(nNodeId, nLevel, bNotify)
    -- KiÓm tra xem huyÖt vŞ cÇn kiÓm tra cã trong danh s¸ch `t_node_id_list` hay kh«ng
    local nThisIndex = _get_this_node_index(nNodeId)

    if nThisIndex > 0 then
        for i = 1, #t_require_node_list do  -- DuyÖt qua danh s¸ch c¸c huyÖt vŞ ®iÒu kiÖn
            local nRequireLevel = t_require_node_list[i][3](nLevel)  -- Tİnh to¸n cÊp ®é yªu cÇu
            local nCheckNodeId = t_require_node_list[i][1]           -- ID cña huyÖt vŞ ®iÒu kiÖn
            local nCheckNodeLevel = MeridianGetNodeLevel(nCheckNodeId) or 0  -- CÊp ®é hiÖn t¹i cña huyÖt vŞ ®iÒu kiÖn (mÆc ®Şnh lµ 0)

            -- NÕu huyÖt vŞ ®iÒu kiÖn ch­a ®¹t cÊp ®é yªu cÇu
            if nCheckNodeLevel < nRequireLevel then
                if bNotify == 1 then
                    -- HiÓn thŞ th«ng b¸o lçi cho ng­êi ch¬i nÕu cÇn
                    Msg2Player(string.format("%s huyÖt vŞ ch­a ®¹t ®Õn tÇng %d, ®iÓm huyÖt thÊt b¹i", t_require_node_list[i][2], nRequireLevel))
                end
                return 0 -- Tr¶ vÒ thÊt b¹i
            end
        end
    end

    return 1 -- Thµnh c«ng
end

--[[
    Hµm: GetConditionDesc
    Tham sè:
        - nNodeId: ID cña huyÖt vŞ.
        - nLevel: CÊp ®é cña huyÖt vŞ.
    M« t¶:
        LÊy m« t¶ chi tiÕt vÒ ®iÒu kiÖn kİch ho¹t cña huyÖt vŞ.
    Tr¶ vÒ: Chuçi m« t¶ ®iÒu kiÖn.
]]
function GetConditionDesc(nNodeId, nLevel)
    local str = ""
    -- KiÓm tra xem huyÖt vŞ cã trong danh s¸ch `t_node_id_list` hay kh«ng
    if _get_this_node_index(nNodeId) > 0 then
        for i = 1, #t_require_node_list do
            local nRequireLevel = t_require_node_list[i][3](nLevel)
            -- NÕu cÊp ®é yªu cÇu >= 1, th× huyÖt vŞ nµy lµ mét ®iÒu kiÖn
            if nRequireLevel >= 1 then
                local strTemp = string.format("%s huyÖt vŞ ®· ®¹t tÇng %d", t_require_node_list[i][2], nRequireLevel)
                if i == 1 then  -- §iÒu kiÖn ®Çu tiªn
                    str = strTemp
                else
                    str = str .. "\n" .. strTemp  -- Nèi c¸c ®iÒu kiÖn b»ng xuèng dßng
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
