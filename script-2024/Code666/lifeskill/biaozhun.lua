-- biaozhun.lua
--[[
    Module: K? nang s?ng - D?nh nghia k? nang Tieu Chu?n
    Mo t?: Module nay d?nh nghia d? li?u cho m?t k? nang s?ng co b?n ho?c tieu chu?n trong tro choi.
           K? nang nay co cac c?p d? khac nhau va co th? mang l?i di?m kinh nghi?m ho?c hi?u ?ng tuong ?ng.
]]

-- Bao g?m cac ham h? tr? cho k? nang s?ng.
Include("\\script\\lifeskill\\lifeskill_functions.lua")

-- B?ng d? li?u k? nang Tieu Chu?n.
SKILLS = {
    -- M?ng 1: Co th? la cac c?p d? kinh nghi?m c?n thi?t d? len c?p k? nang Tieu Chu?n.
    {6, 8, 10, 12, 13, 14, 15, 16, 17, 18},

    -- M?ng 2: Co th? la s? l?n s? d?ng k? nang Tieu Chu?n t?i da m?i ngay ? m?i c?p d?.
    {3, 3, 3, 3, 3, 3, 3, 3, 3, 3},

    -- M?ng 3: Chua ro y nghia, co th? la m?t h? s? ho?c m?t thu?c tinh khac c?a k? nang.
    -- Gia tr? luon la 1 ? m?i c?p d?.
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1},

    -- M?ng 4: Co th? la di?m kinh nghi?m nh?n du?c ho?c hi?u ?ng c?a k? nang Tieu Chu?n ? m?i c?p d?.
    {400, 1200, 2400, 4000, 6000, 8800, 11000, 13300, 15000, 0},
}
