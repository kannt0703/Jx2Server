-- ����1����ֵ�BOSS��ʱ��

function TaskShedule()
	TaskName("BOSS bu�i s�ng");	

	-- һ��һ��
	TaskInterval(1440);
	-- ���ô���ʱ��
	TaskTime(9,2);
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
