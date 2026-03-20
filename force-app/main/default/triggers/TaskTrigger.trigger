trigger TaskTrigger on Task (before insert) {
        if(Trigger.isInsert && Trigger.isBefore){
            for(Task taskrecord: Trigger.new){
                taskrecord.Priority = 'High';
            }
        }
}