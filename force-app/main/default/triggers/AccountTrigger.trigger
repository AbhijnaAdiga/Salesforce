trigger AccountTrigger on Account (after update,before Insert,before update,after Insert) {
    if(Trigger.isAfter && Trigger.isUpdate){
        AccountTriggerHandler.HandleAfterUpdate(Trigger.New,Trigger.oldMap);
        AccountTriggerHandler.HandleAfterUpdateActivities(Trigger.New,Trigger.oldMap);
        AccountTriggerHandler.AfterUpdateOpportunity(Trigger.New);
    }
    if(Trigger.isbefore && (Trigger.isUpdate || Trigger.isInsert)){
        AccountTriggerHandler.BeforeInsertUpdate(Trigger.New);
        
    }
    if(Trigger.isAfter && (Trigger.isUpdate || Trigger.isInsert)){
        AccountTriggerHandler.AfterInsertUpdate(Trigger.New,Trigger.oldMap);
    }
     if(Trigger.isbefore && Trigger.isUpdate){
        AccountTriggerHandler.AfterBeforeUpdate(Trigger.New,Trigger.oldMap);
    }
}