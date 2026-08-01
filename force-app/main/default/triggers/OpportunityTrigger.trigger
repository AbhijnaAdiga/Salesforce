trigger OpportunityTrigger on Opportunity (after update,before update,before Insert) {
	
    /* if(Trigger.isUpdate && Trigger.isbefore){
        OpportunityTriggerHandler.handlebeforeUpdate(Trigger.NEW,Trigger.oldMap);
    }*/
   if(Trigger.isInsert && Trigger.isbefore){
        OpportunityTriggerHandler.handlebeforeInsert(Trigger.NEW);
   }
   if(Trigger.isUpdate && Trigger.isafter){
        OpportunityTriggerHandler.NotifyUser(Trigger.NEW,Trigger.oldMap);
    }
}