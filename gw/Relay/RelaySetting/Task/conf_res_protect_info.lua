function TaskShedule()
	TaskName("Nhi�m v� b�o h� t�i nguy�n");		
	TaskInterval(1440);	
	TaskTime(19,0);	
	TaskCountLimit(0);
end

function TaskContent()		
	GlobalExecute(format("dw conf_res_protect_info()"))
end
