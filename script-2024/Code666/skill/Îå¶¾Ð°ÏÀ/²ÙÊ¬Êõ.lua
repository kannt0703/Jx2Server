--����: ��ʬ��

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
	{"cost_mana_point",{{1,7},{6,12}}},
	{"cost_spirit",{{1,200},{6,200}}}
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
	probability_factor_b={{1,20},{6,20}},
	probability_factor_x={{1,100},{6,100}},
	},
	{magic="imme_summon_life_add",
	damage_factor_a={{1,330},{6,363}},
	damage_factor_c={{1,495},{6,544}},
	damage_factor_z={{1,990},{6,1089}},
	},
	{magic="imme_summon_attack_add",
	damage_factor_a={{1,158},{6,173}},
	damage_factor_c={{1,237},{6,260}},
	damage_factor_z={{1,132},{6,726}},
	damage_factor_f={{1,132},{6,145}},
	},
	{magic="imme_summon_attack_rate_add",
	damage_factor_a={{1,100},{6,100}},
	damage_factor_c={{1,120},{6,120}},
	damage_factor_z={{1,100},{6,200}},
	},
	{magic="imme_summon_dodge_add",
	damage_factor_a={{1,60},{6,60}},
	damage_factor_c={{1,80},{6,80}},
	damage_factor_z={{1,25},{6,100}},
	},
	{magic="imme_summon_physical_defence_add",
	damage_factor_a={{1,20},{6,20}},
	damage_factor_c={{1,30},{6,30}},
	damage_factor_z={{1,100},{6,200}},
	},
	{magic="imme_summon_magic_defence_add",
	damage_factor_a={{1,20},{6,20}},
	damage_factor_c={{1,30},{6,30}},
	damage_factor_z={{1,100},{6,200}},
	},
	{magic="imme_element_all_defend_point_enhance",
	damage_factor_z={{1,70},{6,220}},
	},
	{magic="imme_def_critical_point_enhance",
	damage_factor_z={{1,70},{6,220}},
	},
	},
}
