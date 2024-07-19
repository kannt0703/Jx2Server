--技能: 泥鳅功(招)

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--技能属性

	SKILL_LEVEL_BASE_ATTRIB	  =	--技能等级相关基本属性
	{
	{"skill_effect_persist_time",{{1,180},{8,180}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--技能等级相关消耗属性
	{
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--技能等级相关子弹属性
	{
	},

	--魔法属性

	--属性值:	普通攻击力 * X + (1 + 技能等级 * Y) * (力量 * A + 根骨 * B + 身法 * C + 内功 * D + 洞察 * E)
	--			+ 武器外功攻击点 * F + Z
	--			(其中,A,B,C,D,E,F,X,Y,Z为伤害因素.除Z外,其余各伤害因素为百分比数.)

	--成功几率:	(属性值 * A + (自身等级 - 对方等级) * B + 技能等级 * C) * D + X
	--			(其中,A,B,C,D,X为几率因素.除X外,其余各几率因素为百分比数.)

	SKILL_MAGIC_DAMAGE_ATTRIB =	--技能等级相关伤害魔法属性
	{
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--技能等级相关状态魔法属性
	{
	{magic="state_no_affect_per_move_speed",
	damage_factor_c={{1,1},{4,2},{7,2},{8,2}},
	damage_factor_e={{1,2},{4,3},{7,3},{8,3}},
	damage_factor_m={{1,75},{8,75}},
	damage_factor_z={{1,5},{2,5},{3,10},{4,10},{5,10},{6,15},{7,15},{8,19}},
	},
	{magic="state_no_affect_per_att_speed",
	damage_factor_c={{1,1},{4,2},{7,2},{8,2}},
	damage_factor_e={{1,2},{4,3},{7,3},{8,3}},
	damage_factor_m={{1,75},{8,75}},
	damage_factor_z={{1,5},{2,10},{3,10},{4,10},{5,15},{6,15},{7,15},{8,24}},
	},
	{magic="state_accuracy_percent_adjust",
	damage_factor_z={{1,5},{8,5}},
	},
	{magic="state_dodge_percent_adjust",
	damage_factor_z={{1,5},{8,5}},
	}
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--技能等级相关立即魔法属性
	{
	},
}
