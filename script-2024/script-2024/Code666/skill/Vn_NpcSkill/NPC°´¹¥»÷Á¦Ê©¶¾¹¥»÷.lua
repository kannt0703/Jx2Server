--[[
    Module: NPC Poison Attack Skill Configuration
    Description: ??nh ngh?a c��c thu?c t��nh v�� hi?u ?ng c?a k? n?ng t?n c?ng b?ng ??c c?a NPC.
]]

-- Bao g?m c��c h��m x? ly k? n?ng chung.
Include("\\script\\skill\\skillfunctions.lua")

-- B?ng c?u h��nh k? n?ng.
SKILL = {

    -- Thu?c t��nh c? b?n li��n quan ??n c?p ?? k? n?ng.
    SKILL_LEVEL_BASE_ATTRIB = {
        -- Th?i gian hi?u ?ng t?n t?i c?a tr?ng th��i ??c sau khi b? t?n c?ng.
        {"skill_effect_persist_time", {{1, 10}, {20, 10}}}, 
    },

    -- Thu?c t��nh ti��u hao li��n quan ??n c?p ?? k? n?ng (v�� d?: mana, n?ng l??ng).
    -- Trong tr??ng h?p n��y, kh?ng c�� thu?c t��nh ti��u hao n��o.
    SKILL_LEVEL_COST_ATTRIB = {},

    -- Thu?c t��nh c?a ??n/t��n l?a li��n quan ??n c?p ?? k? n?ng.
    -- Trong tr??ng h?p n��y, kh?ng c�� thu?c t��nh ??n/t��n l?a n��o.
    SKILL_LEVEL_MISSLE_ATTRIB = {},

    -- Thu?c t��nh gay s��t th??ng ph��p thu?t li��n quan ??n c?p ?? k? n?ng.
    -- Trong tr??ng h?p n��y, kh?ng c�� s��t th??ng ph��p thu?t tr?c ti?p.
    SKILL_MAGIC_DAMAGE_ATTRIB = {},

    -- Thu?c t��nh tr?ng th��i ph��p thu?t li��n quan ??n c?p ?? k? n?ng.
    SKILL_MAGIC_STATE_ATTRIB = {
        {
            -- Lo?i tr?ng th��i ph��p thu?t (? ?ay l�� gay s��t th??ng ??c theo th?i gian).
            magic = "state_poison_damage",  
            -- H? s? s��t th??ng ??c theo c?p ?? (c?p 1: 5%, c?p 20: 100%).
            damage_factor_x = {{1, 5}, {20, 100}}, 
        }
    },

    -- Thu?c t��nh ph��p thu?t k��ch ho?t ngay l?p t?c li��n quan ??n c?p ?? k? n?ng.
    -- Trong tr??ng h?p n��y, kh?ng c�� thu?c t��nh ph��p thu?t k��ch ho?t ngay l?p t?c n��o.
    SKILL_MAGIC_IMME_ATTRIB = {},
}
