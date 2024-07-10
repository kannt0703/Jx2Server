--技能: 土牢阵(阵旗招)

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--技能属性

	SKILL_LEVEL_BASE_ATTRIB	  =	--技能等级相关基本属性
	{
	{"skill_effect_persist_time",{{1,3},{17,3}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--技能等级相关消耗属性
	{
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--技能等级相关子弹属性
	{
	{"missle_vanish_after_collide",{{1,1},{17,1}}},
	{"missle_damage_interval",{{1,18},{17,18}}},
	{"missle_damage_range_w",{{1,23},{17,23}}},
	{"missle_damage_range_h",{{1,23},{17,23}}},
	{"missle_collide_range_w",{{1,23},{17,23}}},
	{"missle_collide_range_h",{{1,23},{17,23}}},
	},

	--魔法属性

	--属性值:	普通攻击力 * X + (1 + 技能等级 * Y) * (力量 * A + 根骨 * B + 身法 * C + 内功 * D + 洞察 * E)
	--			+ 武器外功攻击点 * F + Z
	--			(其中,A,B,C,D,E,F,X,Y,Z为伤害因素.除Z外,其余各伤害因素为百分比数.)

	--成功几率:	(属性值 * A + (自身等级 - 对方等级) * B + 技能等级 * C) * D + X
	--			(其中,A,B,C,D,X为几率因素.除X外,其余各几率因素为百分比数.)

	SKILL_MAGIC_DAMAGE_ATTRIB =	--技能等级相关伤害魔法属性
	{
	{magic="damage_life",
	damage_factor_x={{1,120},{7,180},{17,216}},
	damage_factor_e={{1,10},{7,100},{17,120}},
	damage_factor_c={{1,10},{7,100},{17,120}},
	}
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--技能等级相关状态魔法属性
	{
	{magic="state_slow",
	damage_factor_z={{1,20},{7,60},{17,80}},
	damage_factor_m={{1,80},{17,80}},
	},
	{magic="state_dodge_rate_point_add",
	damage_factor_z={{1,-200},{17,-200}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--技能等级相关立即魔法属性
	{
	},
}
