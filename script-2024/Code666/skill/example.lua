--[[
    Module: Skill Configuration Module
    Description: ??nh ngh?a c��c thu?c t��nh v�� hi?u ?ng c?a m?t k? n?ng (skill) trong tr�� ch?i.
]]

-- Bao g?m c��c h��m x? ly k? n?ng chung.
Include("\\script\\skill\\skillfunctions.lua")

-- B?ng c?u h��nh k? n?ng.
SKILL = {

    -- Thu?c t��nh li��n quan ??n c?p ?? k? n?ng.
    SKILL_LEVEL_BASE_ATTRIB = {
        -- S? l??ng t��n l?a b?n ra theo c?p ?? k? n?ng.
        {"skill_missle_num", {{1, 1}, {16, 1}, {17, 2}, {18, 2}, {19, 3}, {20, 3}}}, 
    },

    -- Thu?c t��nh ti��u hao li��n quan ??n c?p ?? k? n?ng (v�� d?: mana, n?ng l??ng).
    SKILL_LEVEL_COST_ATTRIB = {},

    -- Thu?c t��nh c?a t��n l?a (??n) li��n quan ??n c?p ?? k? n?ng.
    SKILL_LEVEL_MISSLE_ATTRIB = {},

    -- Thu?c t��nh gay s��t th??ng ph��p thu?t li��n quan ??n c?p ?? k? n?ng.
    SKILL_MAGIC_DAMAGE_ATTRIB = {
        {
            -- Lo?i s��t th??ng ph��p thu?t (? ?ay l�� gi?m m��u).
            magic = "damage_life",        
            -- C��c h? s? s��t th??ng Z theo c?p ?? (c?p 1: 10, c?p 20: 100).
            damage_factor_z = {{1, 10}, {20, 100}}, 
            -- X��c su?t th��nh c?ng c?a k? n?ng theo c?p ?? (c?p 1: 100%, c?p 20: 100%).
            probability_factor_x = {{1, 100}, {20, 100}} 
        }
    },

    -- Thu?c t��nh tr?ng th��i ph��p thu?t li��n quan ??n c?p ?? k? n?ng (v�� d?: buff, debuff).
    SKILL_MAGIC_STATE_ATTRIB = {},

    -- Thu?c t��nh ph��p thu?t k��ch ho?t ngay l?p t?c li��n quan ??n c?p ?? k? n?ng.
    SKILL_MAGIC_IMME_ATTRIB = {},
}

--[[
    C?ng th?c t��nh s��t th??ng:
        - Gi�� tr? thu?c t��nh: S��t th??ng t?n c?ng th??ng * X + (1 + C?p ?? k? n?ng * Y) * (S?c m?nh * A + Th? ch?t * B + Nhanh nh?n * C + N?i c?ng * D + Tinh th?n * E) + ?i?m t?n c?ng v? kh�� * F + Z
        - X��c su?t th��nh c?ng: (Gi�� tr? thu?c t��nh * A + (C?p ?? b?n than - C?p ?? ??i ph??ng) * B + C?p ?? k? n?ng * C) * D + X

    Trong ?��:
        - A, B, C, D, E, F, X, Y, Z l�� c��c h? s? s��t th??ng v�� x��c su?t (th??ng l�� ph?n tr?m).
        - Z l�� m?t gi�� tr? c? ??nh ???c th��m v��o s��t th??ng.
]]
