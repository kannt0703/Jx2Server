-- ����11����ֵ�BOSS��ʱ��

function TaskShedule()
	TaskName("BOSS ban ��m");	

	-- һ��һ��
	TaskInterval(1440);
	-- ���ô���ʱ��
	TaskTime(22,5);
	-- ִ�����޴�
	TaskCountLimit(0);

	-- OutputMsg("�����Զ���������...");
end

function TaskContent()

    local nBoss = random(1, 3)
    local nPos = random(1, 4)

	-- ִ���ٻ�BOSS�ű�
	GlobalExecute(format("dw createNewResBoss(%d,%d)", nBoss, nPos));
end
