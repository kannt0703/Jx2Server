function TaskShedule()
	TaskName("H�i Ng� Cao Th�");		
	TaskInterval(1440);	
	TaskTime(16,3);	
	TaskCountLimit(0);
end

function TaskContent()	
	local nPos = random(1,2)
	GlobalExecute(format("dw call_faction_boss(%d)", 2))
end
