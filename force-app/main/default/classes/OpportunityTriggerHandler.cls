public class OpportunityTriggerHandler {
    public static void handleAfterUpdate(List<Opportunity> newRec){
        String Status = 'Not Started';
        String Subject ='Split Revenue';
        List<Task> taslistInsert = new List<Task>();
        for(Opportunity OppRec : newRec){
            if(OppRec.StageName == 'Closed Won'){
                Task taskRec = new Task();
                taskRec.Priority='High';
                taskRec.OwnerId=OppRec.OwnerId;
                taskRec.Description='Please Split Revenue';
                taskRec.Status = Status;
                taskRec.Subject = Subject;
                taskRec.WhatId = OppRec.Id;
                taslistInsert.add(taskRec);
            }
        }
        if(!taslistInsert.isEmpty()){
            insert taslistInsert;
        }
    }
}