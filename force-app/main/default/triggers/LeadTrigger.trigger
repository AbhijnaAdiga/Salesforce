trigger LeadTrigger on Lead (before update) {
    if(Trigger.isBefore && Trigger.isUpdate){
        for(Lead leadrecord: Trigger.new){
            leadrecord.Status = 'Working - Contacted';
            if(leadrecord.Industry == 'Healthcare'){
                leadrecord.leadSource='Purchased List';
                leadrecord.Primary__c  = 'Yes';
                leadrecord.SICCode__c = '12345';
            }
    }
}

}