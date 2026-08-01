public class Contactriggerhandler {
    public static void handlebeforeInsert(List<Contact> newrecords){
        List<Contact> existingrec = [SELECT Id,LastName,Phone,Email from Contact LIMIT 50000];
        for(Contact con: newrecords){
            for(Contact existcon : existingrec){
            if(con.LastName == existcon.LastName && con.Phone == existcon.Phone && con.Email == existcon.Email){
                con.addError('Duplicates found!!');
            }
            }
        }
    }
    public static void handleAfterUpdate(List<Contact> newrecords,Map<Id,Contact> oldMaprec){
        List<Id> AccountIdtomail = new List<Id>();
        for(Contact con:newrecords){
            if(con.Email != oldMaprec.get(con.Id).Email || con.Phone != oldMaprec.get(con.Id).Phone){
                AccountIdtomail.add(con.AccountId);
            }
            List<String> emailAddressList = new List<String>();
            List<Account> accrec = [Select OwnerId,Owner.Email from Account where Id IN : AccountIdtomail];
            for(Account acc:accrec){
                emailAddressList.add(acc.Owner.Email);
            }
            
            if(AccountIdtomail.size()>0){
                Messaging.SingleEmailMessage[] message = new List<Messaging.SingleEmailMessage>();
                for(Id AccId : AccountIdtomail){
                    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                    mail.ToAddresses=emailAddressList;
   				 	mail.Subject='Contact Email or Phone is Updated';
                    mail.plaintextbody='Related Contact for this Account Email or Phone is Updated';
                    message.add(mail);
                }
            }
        }
    }
    public static void handleAfterUpdateActivity(List<Contact> newrecords,Map<Id,Contact> oldMap){
        Set<Id> AccountlistId = new Set<Id>();
       for(Contact con:newrecords){
            if(con.Description != oldMap.get(con.Id).Description){
                AccountlistId.add(con.AccountId);
            } 
       }
           Map<Id,Account> Accmap = new Map<Id,Account>([Select Id,Description from Account where Id IN : AccountlistId]);
           List<Account> UpdateList = new List<Account>();
           if(AccountlistId.size()>0){
                for(Contact cont:newrecords){
                    Account acc = Accmap.get(cont.AccountId);
                    acc.Description = cont.Description;
                    UpdateList.add(acc);
           }
               if(UpdateList.size()>0){
                   update UpdateList;
               }
    }
}
    public static void DuplicateEmails(List<Contact> newrecords){
        Set<String> Emails = new Set<String>();
       for(Contact con:newrecords){
            if(con.Email != null){
                Emails.add(con.Email);
    }
           Map<String,Contact> ConMap = new Map<String,Contact>();
           List<Contact> ConList =[Select Id,Email from Contact where Email IN:Emails];
           for(Contact conEmail : ConList){
               ConMap.put(conEmail.Email,conEmail);  
               }
           for(Contact conUpd:newrecords){
               if(ConMap.containsKey(conUpd.Email)){
                   conUpd.Email.addError('Duplicate Email Not allowed');
               }
           }
           }
       }
}