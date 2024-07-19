--[[
    Module: Skill Data Format and Utility Functions
    Description:
        - ??nh ngh?a ??nh d?ng d? li?u chung cho c¨¢c k? n?ng trong tr¨° ch?i.
        - Cung c?p c¨¢c h¨¤m ti?n ¨ªch ?? x? ly d? li?u k? n?ng.
]]

-- Ch¨² th¨ªch: C¨¢c thu?c t¨ªnh c?a k? n?ng ???c bi?u di?n d??i d?ng c¨¢c ???ng cong (curves)
-- M?i ???ng cong ???c x¨¢c ??nh b?i m?t t?p h?p c¨¢c ?i?m (x, y)
-- x: C?p ?? k? n?ng
-- y: Gi¨¢ tr? c?a thu?c t¨ªnh t?i c?p ?? k? n?ng ?¨®
-- F: H¨¤m n?i suy (interpolation function) ?? t¨ªnh gi¨¢ tr? thu?c t¨ªnh t?i c¨¢c c?p ?? k? n?ng kh?ng c¨® trong t?p h?p ?i?m

-- ??nh d?ng d? li?u k? n?ng:
-- SKILL = {
--     SKILL_LEVEL_BASE_ATTRIB = { -- Thu?c t¨ªnh c? b?n theo c?p ?? k? n?ng
--         {"t¨ºn_thu?c_t¨ªnh", {{c?p_1, gi¨¢_tr?_1}, {c?p_2, gi¨¢_tr?_2}, ...}},
--         ...
--     },
--     SKILL_LEVEL_COST_ATTRIB = { -- Thu?c t¨ªnh ti¨ºu hao theo c?p ?? k? n?ng
--         ...
--     },
--     SKILL_LEVEL_MISSLE_ATTRIB = { -- Thu?c t¨ªnh ??n/t¨ºn l?a theo c?p ?? k? n?ng
--         ...
--     },
--     SKILL_MAGIC_DAMAGE_ATTRIB = { -- Thu?c t¨ªnh s¨¢t th??ng ph¨¦p thu?t theo c?p ?? k? n?ng
--         {
--             magic = "lo?i_s¨¢t_th??ng",
--             damage_factor_a = {{c?p_1, gi¨¢_tr?_1}, {c?p_2, gi¨¢_tr?_2}, ...},
--             ...
--             damage_factor_z = {{c?p_1, gi¨¢_tr?_1}, {c?p_2, gi¨¢_tr?_2}, ...},
--             probability_factor_a = {{c?p_1, gi¨¢_tr?_1}, {c?p_2, gi¨¢_tr?_2}, ...},
--             ...
--             probability_factor_x = {{c?p_1, gi¨¢_tr?_1}, {c?p_2, gi¨¢_tr?_2}, ...},
--         },
--         ...
--     },
--     SKILL_MAGIC_STATE_ATTRIB = { -- Thu?c t¨ªnh tr?ng th¨¢i ph¨¦p thu?t theo c?p ?? k? n?ng
--         ...
--     },
--     SKILL_MAGIC_IMME_ATTRIB = { -- Thu?c t¨ªnh ph¨¦p thu?t k¨ªch ho?t t?c th¨¬ theo c?p ?? k? n?ng
--         ...
--     },
-- }

-- C¨¢c h¨¤m ti?n ¨ªch ?? x? ly d? li?u k? n?ng

-- H¨¤m n?i suy tuy?n t¨ªnh (linear interpolation)
function Line(x, x1, y1, x2, y2)
    if y1 == y2 then
        return y2
    end
    return (y2 - y1) * (x - x1) / (x2 - x1) + y1
end

-- H¨¤m n?i suy ???ng cong b?c hai (quadratic interpolation)
function Conic(x, x1, y1, x2, y2)
    if x1 < 0 or x2 < 0 then
        return 0
    end
    if y1 == y2 then
        return y2
    end
    return x * x * (y1 - y2) / (x1 * x1 - x2 * x2) + y1 - (y1 - y2) * x1 * x1 / (x1 * x1 - x2 * x2)
end

-- H¨¤m l?y gi¨¢ tr? thu?c t¨ªnh t?i m?t c?p ?? k? n?ng c? th?
function Link(x, points)
    local num = #points
    if num < 2 then
        return -1
    end

    -- N?u kh?ng ch? ??nh h¨¤m n?i suy, s? d?ng n?i suy tuy?n t¨ªnh m?c ??nh
    for i = 1, num do
        if points[i][3] == nil then
            points[i][3] = Line
        end
    end

    -- X? ly gi¨¢ tr? bi¨ºn
    if x < points[1][1] then
        return points[1][3](x, points[1][1], points[1][2], points[2][1], points[2][2])
    elseif x > points[num][1] then
        return points[num][3](x, points[num - 1][1], points[num - 1][2], points[num][1], points[num][2])
    end

    -- T¨¬m ?o?n ???ng cong ch?a c?p ?? k? n?ng x
    for i = 2, num do
        if x >= points[i - 1][1] and x <= points[i][1] then
            return points[i][3](x, points[i - 1][1], points[i - 1][2], points[i][1], points[i][2])
        end
    end
end

-- H¨¤m n?i hai tham s? th¨¤nh m?t chu?i, ng?n c¨¢ch b?i d?u ph?y
function Param2String(param1, param2)
    return param1 .. "," .. param2
end

-- H¨¤m l?y d? li?u k? n?ng theo lo?i, ch? s? v¨¤ c?p ??
function GetSkillLevelData(sType, nIndex, nLevel)
    if sType == "SKILL_LEVEL_BASE_ATTRIB" or
       sType == "SKILL_LEVEL_COST_ATTRIB" or
       sType == "SKILL_LEVEL_MISSLE_ATTRIB" then
        -- X? ly thu?c t¨ªnh c? b?n, ti¨ºu hao v¨¤ ??n/t¨ºn l?a
        if SKILL[sType][nIndex] == nil then
            return -1 -- Kh?ng t¨¬m th?y thu?c t¨ªnh
        end
        local value = math.floor(Link(nLevel, SKILL[sType][nIndex][2]))
        return Param2String(SKILL[sType][nIndex][1], value)
    else
        -- X? ly thu?c t¨ªnh ph¨¦p thu?t
        if SKILL[sType][nIndex] == nil then
            return -1 -- Kh?ng t¨¬m th?y thu?c t¨ªnh
        end

        -- Danh s¨¢ch c¨¢c h? s? s¨¢t th??ng v¨¤ x¨¢c su?t
        local MAGIC_FACTORS = {
            {"damage_factor_a", 0},
            {"damage_factor_b", 0},
            {"damage_factor_c", 0},
            {"damage_factor_d", 0},
            {"damage_factor_e", 0},
            {"damage_factor_f", 0},
            {"damage_factor_m", 0},
            {"damage_factor_x", 0},
            {"damage_factor_y", 0},
            {"damage_factor_z", 0},
            {"damage_factor_h", 0},
            {"probability_factor_a", 0},
            {"probability_factor_b", 0},
            {"probability_factor_c", 0},
            {"probability_factor_d", 100},
            {"probability_factor_x", 100},
        }

        local resultString = SKILL[sType][nIndex]["magic"]

        for i = 1, #MAGIC_FACTORS do
            local factorName = MAGIC_FACTORS[i][1]
            if SKILL[sType][nIndex][factorName] == nil then
                resultString = Param2String(resultString, MAGIC_FACTORS[i][2]) -- Gi¨¢ tr? m?c ??nh l¨¤ 0
            else
                local value = math.floor(Link(nLevel, SKILL[sType][nIndex][factorName]))
                resultString = Param2String(resultString, value)
            end
        end

        return resultString
    end
end
