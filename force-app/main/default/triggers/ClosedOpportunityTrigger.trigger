trigger ClosedOpportunityTrigger on Opportunity (after update, after insert) {
    List<Task> newtasklist = new List<Task>();
    for(Opportunity everyopportunity : Trigger.new){
    if(everyopportunity.StageName == 'Closed Won'){
        Task tasktobeadded = new Task(
            Subject = 'Follow Up Test Task',
            WhatId = everyopportunity.Id,
            Status = 'In Progress',
            Priority = 'High'
        );
        newtasklist.add(tasktobeadded);
    }
}
insert newtasklist;

}