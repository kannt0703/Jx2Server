--ÿ��20:00׼ʱˢ��

function TaskShedule()
	TaskName("T�o m�i BOSS Th� Gi�i");	

	-- һ��һ��
	TaskInterval(1440);
	-- ���ô���ʱ��
	TaskTime(20,00);
	OutputMsg(format("BOSS Th� Gi�i s� xu�t hi�n � %s...", "20:00"));
	-- ִ�����޴�
	TaskCountLimit(0);

end

function TaskContent()
	local nDate = tonumber(date("%Y%m%d%H")) + random(10000);
	GlobalExecute(format("dw wb_CreateBoss(%d)", tonumber(nDate)));
end