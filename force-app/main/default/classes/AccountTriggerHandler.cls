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
}