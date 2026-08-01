public class AccountTriggerHandler {
    public static void handleAfterInsert(List<Account> newrecords){
        List<Contact> conList = new List<Contact>();
        for(Account acc:newrecords){
            if(acc.CreateNContatcs__c != null){
                for(Integer i=0;i<acc.CreateNContatcs__c;i++){
                Contact con = new Contact();
                con.LastName  = acc.Name+i;
                con.AccountId = acc.Id;
                    
                conList.add(con);
                    System.debug(conList);
                }
            }
        }
        if(!conList.isEmpty()){
            insert conList;
        }
    }
    public static void HandleAfterUpdate(List<Account> newrecords,Map<Id,Account> oldMap){
        Map<Id,String> AcctoWebsiteMap = new Map<Id,String>();
        for(Account acc:newrecords){
            if(acc.Website != oldMap.get(acc.Id).Website){
                accTowebsiteMap.put(acc.Id,acc.Website);
            }
        }
        if(accTowebsiteMap.keySet().size()>0){
            List<Contact> ContoUpdate = new List<Contact>();
            List<Contact> Conrecords = [Select Id,Name,Website__c,AccountId FROM Contact where AccountId IN :accTowebsiteMap.keySet()];
            for(Contact con :Conrecords){
                con.Website__c = accTowebsiteMap.get(con.AccountId);
                ContoUpdate.add(con);
            }
            if(ContoUpdate.size()>0){
                update ContoUpdate;
            }
        }
    }
    public static void HandleAfterUpdateActivities(List<Account> newrecords,Map<Id,Account> oldMap){
        Set<Id> accId = new Set<Id>();
        for(Account acc : newrecords){
            if(acc.Type != oldMap.get(acc.Id).Type){
                accId.add(acc.Id);
            }
        }
        List<Contact> Conlist = [Select Id,Email,AccountId FROM Contact where AccountId IN : accId];
        List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();
        for (Contact con:Conlist){
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setTargetObjectId(con.Id);
            mail.setSenderDisplayName('System Administrator');
            mail.SetSubject('Account Update Info');
            mail.setPlainTextBody('Hey! Account Type has been updated Successfully!');
            mail.toAddresses= new String[]{con.Email};
            emailList.add(mail);
            }
        Messaging.sendEmail(emailList);
    }
    public static void AfterUpdateOpportunity(List<Account> newrecords){
        Set<Id> accId = new Set<Id>();
        for(Account acc : newrecords){
			accId.add(acc.Id);
    }
        if(!accId.isEmpty()){
            Date Day30 = date.today()-30;
            List<Opportunity> opplst = new List<Opportunity>();
            List<Opportunity> opplist = [SELECT Id, AccountId, TestCreatedDate__c,CloseDate,StageName FROM Opportunity where AccountId IN:accId];
            for(Opportunity opp:opplist){
                if(opp.TestCreatedDate__c<Day30 && opp.StageName != 'Closed Won'){
                    opp.StageName='Closed Lost';
                    opp.CloseDate=date.today();
                    opplst.add(opp);
                }
            }
             update opplst;
        }   
}
    public static void BeforeInsertUpdate(List<Account> newrecords){
        Set<String> AccNames = new Set<String>();
        for(Account acc:newrecords){
            AccNames.add(acc.Name);
        }
        list<Account> acclist = [Select Id,Name from Account where Name IN:AccNames];
        Map<String,Account> existingAccmap = new Map<String,Account>();
        if(acclist.size()>0){
        for(Account acct:acclist){
            existingAccmap.put(acct.Name,acct);
        	}
        }
        for(Account accobj:newrecords){
            if(existingAccmap.containsKey(accobj.Name)){
                accobj.addError('Same Account Name Already Exists!!');
            }
        }
    }
    public static void AfterInsertUpdate(List<Account> newrecords,Map<Id,Account> oldMap){
        List<Contact> UpdateCon = new List<Contact>();
        for(Account acc:newrecords){
            if(acc.CreateContacts__c==true || (oldMap.get(acc.Id).CreateContacts__c==false && oldMap.get(acc.Id).CreateContacts__c != acc.CreateContacts__c)){ 
                Contact con=new Contact();
                con.FirstName=acc.Name;
                con.LastName='Contact';
                con.Phone=acc.Phone;
                con.AccountId=acc.Id;
                UpdateCon.add(con);
                System.debug(UpdateCon);
            }
        }
        if(UpdateCon.size()>0){
            insert UpdateCon;
        }
    }
    public static void AfterBeforeUpdate(List<Account> newrecords,Map<Id,Account> oldMap){
        Id currentId=UserInfo.getUserId();
        if(!newrecords.isEmpty()){
            for(Account acc:newrecords){
                if(oldMap.get(acc.Id).LastModifiedById == currentId && oldMap.get(acc.Id).LastModifiedDate.addHours(1)>System.now()){
                    acc.addError('You can update Records once in an Hour!!!');
                }             
            }
        }
    }
    public static void UpdateRating(List<Account> newrecords){
        for(Account acc:newrecords){
            if(acc.Industry =='Media'||acc.Industry =='Energy'){
                acc.Rating='Hot';
            }
        }
    }
    public static void UpdateRelatedContact(List<Account> newrecords,Map<Id,Account> oldMap){
        List<Account> accId = new List<Account>();
        Map<Id,Account> accMap = new Map<Id,Account>();
        for(Account acc:newrecords){
            if(acc.Phone != null && acc.Phone != oldMap.get(acc.Id).Phone && oldMap.get(acc.Id).Phone != null){
                accMap.put(acc.Id,acc);
                System.debug(accMap);
            }
            List<Contact> ConList = [Select Id,Name,Phone,AccountId FROM Contact where AccountId IN:accMap.keySet()];
            System.debug(ConList);
            List<Contact> Conlistupdate = new List<Contact>();
            for(Contact Con:ConList){
                Con.Phone = accMap.get(con.AccountId).Phone;
                Conlistupdate.add(Con);
                //System.debug(Conlistupdate);
            }
            if(Conlistupdate.size()>0){
                update Conlistupdate; 
            }
        }
    }
    public static void UpdateRelatedOpportunity(List<Account> newrecords,Map<Id,Account> oldMap){
        List<Opportunity> accId = new List<Opportunity>();
        Map<Id,Account> accMap = new Map<Id,Account>();
        for(Account acc:newrecords){
            if(acc.Active__c != null && acc.Active__c != oldMap.get(acc.Id).Active__c && oldMap.get(acc.Id).Active__c == 'Yes' && oldMap.get(acc.Id).Active__c  != null){
                accMap.put(acc.Id,acc);
                System.debug(accMap);
            }
        }
        List<Opportunity> OpplistUpdate = new List<Opportunity>();
        List<Opportunity> Opplist = [Select Id,AccountId,StageName FROM Opportunity where AccountId IN:accMap.keySet()];
        System.debug(Opplist);
        for(Opportunity opp:Opplist){
            if(opp.StageName != 'Closed Lost'||opp.StageName != 'Closed Won'){
                opp.StageName = 'Closed Lost';
                OpplistUpdate.add(opp);   
            }
            if(OpplistUpdate.size()>0){
                update OpplistUpdate;
                System.debug('Id'+OpplistUpdate[0].Id);
            }
        }
    }
    public static void BeforeDelete(List<Account> newrecords){
        Set<Id> accId = new Set<Id>();
        for(Account acc:newrecords){
            accId.add(acc.Id);
        }
        list<Account> acclist = [SELECT Id, Name, (SELECT Id, AccountId FROM Contacts)FROM Account where Id IN:accId];
        Map<String,Account> existingAccmap = new Map<String,Account>();
        for(Account acct:acclist){
            existingAccmap.put(acct.Name,acct);
        	}
        for(Account accobj:newrecords){
            if(existingAccmap.containsKey(accobj.Name)){
                accobj.addError('Account Cannot be Deleted as it has dependent Contact!!');
            }
        }
    }
    public static void PreventContactDeactivation(Map<Id,Account> newMap,Map<Id,Account> oldMap){
        Set<Id> accId = new Set<Id>();
        List<Contact> conlist =[Select Id,AccountId,isActive__c FROM Contact where AccountId IN :newMap.keySet() AND isActive__c =true];
        for(Contact Con:conlist){
            accId.add(Con.AccountId);
        }
        System.debug(accId);
        System.debug(oldMap);
        System.debug(newMap);
        for(Account acc:newMap.values()){
            if(acc.Active__c=='No' && oldMap.get(acc.Id).Active__c !=acc.Active__c && accId.contains(acc.Id)){
                System.debug(acc.Active__c+' '+oldMap.get(acc.Id).Active__c);
                acc.addError('Account Cannot be deleted with active Contact');
            }
        }
     }
}