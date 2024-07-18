-- wotou.lua
--[[
    Module: K? nang s?ng - D?nh nghia k? nang Ng? D?o
    Mo t?: Module nay d?nh nghia d? li?u cho m?t k? nang s?ng lien quan d?n vi?c 
           ng? d?o ho?c linh h?i ki?n th?c trong tro choi. K? nang nay co cac c?p d? 
           khac nhau, nhung khong co s? thay d?i v? tai nguyen thu th?p ho?c tieu hao.
]]

-- Bao g?m cac ham h? tr? cho k? nang s?ng.
Include("\\script\\lifeskill\\lifeskill_functions.lua")

-- B?ng d? li?u k? nang Ng? D?o.
SKILLS = {
    -- M?ng 1: Co th? la cac c?p d? kinh nghi?m c?n thi?t d? len c?p k? nang Ng? D?o.
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, 

    -- M?ng 2: Chua ro y nghia, co th? la m?t h? s? ho?c m?t thu?c tinh khac c?a k? nang.
    -- Gia tr? luon la 1 ? m?i c?p d?.
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, 

    -- M?ng 3: Co th? la th?i gian c?n thi?t d? hoan thanh m?t l?n ng? d?o ? m?i c?p d?.
    -- Gia tr? luon la 35 ? m?i c?p d?, co th? tinh b?ng giay, phut ho?c m?t don v? th?i gian khac trong game.
    {35, 35, 35, 35, 35, 35, 35, 35, 35, 35}, 

    -- M?ng 4: Co th? la lu?ng tai nguyen thu th?p du?c ho?c hi?u ?ng c?a k? nang Ng? D?o ? m?i c?p d?.
    -- Gia tr? luon la 0, co th? ng? y r?ng k? nang nay khong tr?c ti?p mang l?i tai nguyen ho?c hi?u ?ng c? th?.
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
}
