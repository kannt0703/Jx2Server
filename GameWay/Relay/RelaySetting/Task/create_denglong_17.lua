

function TaskShedule()
	TaskName("��n L�ng");	

	-- һ��һ��
	TaskInterval(1440);
	-- ���ô���ʱ��
	TaskTime(17,1);
	-- ִ�����޴�
	TaskCountLimit(0);

end

function TaskContent()
	local nDay = tonumber(date("%w"));
	GlobalExecute(format("dw create_npcs(%d)", nDay))
end
