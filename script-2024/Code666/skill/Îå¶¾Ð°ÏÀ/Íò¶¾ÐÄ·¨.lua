--技能: 万毒心法

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--技能属性

	SKILL_LEVEL_BASE_ATTRIB	  =	--技能等级相关基本属性
	{
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
	{magic="state_life_restore_per10s",
	damage_factor_z={{1,15},{10,60}},
	},
	{magic="state_physicalwound_per_add",
	damage_factor_z={{1,0},{2,0},{3,5},{9,20},{10,25}},
	},
	{magic="state_weapon_limit",
	damage_factor_z={{1,128},{10,128}},
	},
	{magic="state_physical_parmor_per_dec_no_ignore",
	damage_factor_z={{1,15},{10,15}},
	},
	{magic="state_magic_parmor_per_dec_no_ignore",
	damage_factor_z={{1,15},{10,15}},
	},
	{magic="state_medica_neili_effect_add",
	damage_factor_z={{1,200},{10,200}},
	},
	{magic="state_perfect_dodge_rate",
	damage_factor_z={{1,9},{10,9}},
	},
	{magic="state_desterity_physical_atk_increase",
	damage_factor_z={{1,100},{10,100}},
	},
	{magic="state_level_2_max_life_rate",
	damage_factor_z={{1,420},{10,420}},
	},	
	{magic="state_trans_2_max_life_rate",
	damage_factor_z={{1,4200},{10,4200}},
	},
	{magic="state_destiny_armor_point_add",
	damage_factor_z={{1,150},{10,150}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--技能等级相关立即魔法属性
	{
	{magic="imme_evil_spirit",
	damage_factor_c={{1,63},{10,63}},
	damage_factor_d={{1,20},{10,20}},
	damage_factor_z={{1,200},{4,200},{5,300},{8,300},{9,400},{10,400}},
	damage_factor_m={{1,800},{10,800}},
	},
	},
}
