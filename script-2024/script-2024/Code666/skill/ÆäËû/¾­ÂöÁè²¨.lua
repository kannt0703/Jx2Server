--技能: 凌波微步

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--技能属性

	SKILL_LEVEL_BASE_ATTRIB	  =	--技能等级相关基本属性
	{
	{"skill_display_persist_time",{{1,200},{6,300},{20,300}}},
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
	{magic="state_accelerate",
	damage_factor_z={{1,15},{2,15},{3,15},{4,15},{5,20},{20,20}},
	},
	{magic="state_accelerate_limit",
	damage_factor_z={{1,37},{2,37},{3,40},{4,40},{5,43},{20,43}},
	},
	{magic="state_accelerate_interval",
	damage_factor_z={{1,36},{20,36}},
	},
	{magic="state_shadow_run",
	damage_factor_z={{1,0},{2,0},{3,1605},{4,1605},{5,1610},{20,1610}},
	},
	{magic="state_del_skill_magic_when_stamina_exhaust",
	damage_factor_z={{1,30122},{6,30122},{20,30122}},
	},
	{magic="state_lost_stamina_per18",
	damage_factor_z={{1,2},{10,2},{20,2}},
	},
    {magic="state_dodge_point_increase",
	damage_factor_z={{1,20},{2,40},{3,40},{4,60},{5,60},{6,80},{20,360}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--技能等级相关立即魔法属性
	{
	},
}
