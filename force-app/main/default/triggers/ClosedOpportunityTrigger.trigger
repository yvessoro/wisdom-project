trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
	List<Task> taskList=new List<Task>();
    for(Opportunity opp: Trigger.new){
        if(opp.StageName=='Closed won'){
            Task newTask= new Task(Subject='Follow Up Test Task', WhatId=opp.Id);
            taskList.add(newTask);
        }
    }
    
    if(taskList?.size()>0){
        insert taskList;
    }
}