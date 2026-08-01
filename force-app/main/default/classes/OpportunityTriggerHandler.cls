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
    public static void handlebeforeInsert(List<Opportunity> newRec){
        Set<Id> AccountIdset = new Set<Id>();
        for(Opportunity opp : newRec){
            if(opp.AccountId != null){
                AccountIdset.add(opp.AccountId);
            }
        }
        Map<Id,Account> AccountMap = new Map<Id,Account>([Select Id,Description,Name,OwnerId FROM Account Where Id IN : AccountIdset]);
        
        for (Opportunity opprec : newRec){
            Account acc = AccountMap.get(opprec.AccountId);
            opprec.Description = acc.Description;
            opprec.Name = acc.Name;
            opprec.OwnerId = acc.OwnerId;
        }
    }
    public static void UpdateDesc(List<Opportunity> newRec){
        for(Opportunity opp:newRec){
            if(opp.Amount != null && opp.Amount >= 10000 && opp.Amount <= 50000){
                opp.Description='Hot Opportunity';
            }
        }
    }
    public static void AmountValidation(List<Opportunity> newRec){
        for(Opportunity opp:newRec){
            if(opp.Amount == null ){
                opp.addError('Please Enter Amount!');
            }
        }
    }
    public static void AmountValidation(List<Opportunity> newRec,Map<Id,Opportunity> oldMap){
        Set<Id> accId = new Set<Id>();
        for(Opportunity oppList:newRec){
            if(oldMap.get(oppList.Id).StageName != oppList.StageName){
                accId.add(oppList.AccountId);
            }
        }
        Map<Id,Opportunity> OppMap = new Map<Id,Opportunity>();
        List<Opportunity> Opplist = [Select Id,AccountId,StageName FROM Opportunity where AccountId IN:accId];
        for(Opportunity opp:Opplist){
            
        }
    }
    public static void NotifyUser(List<Opportunity> newRec,Map<Id,Opportunity> oldMap){
        CustomNotificationType notifType = [SELECT Id FROM CustomNotificationType WHERE DeveloperName = 'Opportunity_Stage'];
        for(Opportunity oppList:newRec){
            if(oldMap.get(oppList.Id).StageName != oppList.StageName){
                Messaging.CustomNotification notification = new Messaging.CustomNotification();
                notification.setTitle('Opportunity Stage Changed');
                notification.setBody('Opportunity stage has been updated.');
                notification.setTargetId(oppList.Id);
                notification.setNotificationTypeId(notifType.Id);
                Set<String> recipients = new Set<String>();
                recipients.add(oppList.OwnerId);
                notification.send(recipients);
            }
    }
}
}