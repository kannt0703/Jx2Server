function TaskShedule()
	TaskName("H�i Ng� Cao Th�");		
	TaskInterval(1440);
	TaskTime(22,30);	
	TaskCountLimit(0);
end

function TaskContent()		
	GlobalExecute(format("dw call_faction_boss(%d)", 3))
end
