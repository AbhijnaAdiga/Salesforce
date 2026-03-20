trigger OpportunityTrigger on Opportunity (after update) {

    if(Trigger.isUpdate && Trigger.isAfter){
        OpportunityTriggerHandler.handleAfterUpdate(Trigger.NEW);
    }
}