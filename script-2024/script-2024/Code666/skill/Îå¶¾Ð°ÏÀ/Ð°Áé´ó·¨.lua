--����: а���

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_effect_persist_time",{{1,259200},{6,259200}}},
	{"skill_display_persist_time",{{1,259200},{6,259200}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	{"cost_mana_point",{{1,20},{6,30}}},
	{"cost_spirit",{{1,500},{6,500}}}
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--���ܵȼ�����ӵ�����
	{
	},

	--ħ������

	--����ֵ:	��ͨ������ * X + (1 + ���ܵȼ� * Y) * (���� * A + ���� * B + �� * C + �ڹ� * D + ���� * E)
	--			+ �����⹦������ * F + Z
	--			(����,A,B,C,D,E,F,X,Y,ZΪ�˺�����.��Z��,������˺�����Ϊ�ٷֱ���.)

	--�ɹ�����:	(����ֵ * A + (����ȼ� - �Է��ȼ�) * B + ���ܵȼ� * C) * D + X
	--			(����,A,B,C,D,XΪ��������.��X��,�������������Ϊ�ٷֱ���.)

	SKILL_MAGIC_DAMAGE_ATTRIB =	--���ܵȼ�����˺�ħ������
	{
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--���ܵȼ����״̬ħ������
	{
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	{magic="imme_npc_corpse_revival",
	damage_factor_z={{1,149},{6,149}},
	probability_factor_b={{1,20},{6,20}},
	probability_factor_x={{1,100},{6,100}},
	},
	{magic="imme_summon_life_add",
	damage_factor_a={{1,110},{6,121}},
	damage_factor_c={{1,198},{6,217}},
	damage_factor_z={{1,110},{6,484}},
	},
	{magic="imme_summon_attack_add",
	damage_factor_a={{1,158},{6,173}},
	damage_factor_c={{1,237},{6,260}},
	damage_factor_z={{1,264},{6,871}},
	damage_factor_f={{1,132},{6,145}},
	},
	{magic="imme_summon_attack_rate_add",
	damage_factor_a={{1,100},{6,100}},
	damage_factor_c={{1,120},{6,120}},
	damage_factor_z={{1,100},{6,300}},
	},
	{magic="imme_summon_dodge_add",
	damage_factor_a={{1,60},{6,60}},
	damage_factor_c={{1,100},{6,100}},
	damage_factor_z={{1,50},{6,200}},
	},
	{magic="imme_summon_physical_defence_add",
	damage_factor_a={{1,20},{6,20}},
	damage_factor_c={{1,30},{6,30}},
	damage_factor_z={{1,25},{6,150}},
	},
	{magic="imme_summon_magic_defence_add",
	damage_factor_a={{1,20},{6,20}},
	damage_factor_c={{1,30},{6,30}},
	damage_factor_z={{1,25},{6,150}},
	},
	{magic="imme_element_all_defend_point_enhance",
	damage_factor_z={{1,70},{6,220}},
	},
	{magic="imme_def_critical_point_enhance",
	damage_factor_z={{1,70},{6,220}},
	},
	},
}
