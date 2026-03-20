trigger CaseTrigger on Case (before insert) {
    if(Trigger.isBefore && Trigger.isInsert){
        for(Case caserecord: Trigger.new){
            if(caserecord.Origin == 'Phone'){
                caserecord.Priority = 'High';
            }else{
            caserecord.Priority = 'Low';
        }
        }
    }

}