@isTest
public class AccountTriggerHandlerTest {
@isTest
    public static void UpdateRatingTest(){
        List<Account> accList = new List<Account>();
        for(Integer i=0;i<5;i++){
            Account acc=new Account();
            acc.Name='New Test Acc'+i;
            acc.Industry='Media';
            acc.Phone='99999';
            accList.add(acc);
        }
        Test.startTest();
		insert accList;
        Test.stopTest();
        
        List<Account> UpdatedaccList = [Select Id,Rating,Industry From Account where Id =:accList[0].id];
        System.assertEquals('Hot',UpdatedaccList[0].Rating);
    }

    @isTest
    public static void UpdateRelatedContact(){
        List<Account> accList = new List<Account>();
         List<Contact> conList = new List<Contact>();
        for(Integer i=0;i<5;i++){
            Account acc=new Account();
            acc.Name='New Test Account'+i;
            acc.Phone='99999';
            accList.add(acc);
        }
        Test.startTest();
		insert accList;

        
        for(Account acc:accList){
            Contact con= new Contact();
            con.Lastname = acc.Name;
            con.AccountId=acc.Id;
            //con.Phone=acc.Phone;
            conList.add(con);
        }
        insert conList;
                
        
        for(Account acc:accList){
            acc.Phone='654321';
        }
        update accList;
        
        Test.stopTest();
        List<Contact> Contactupd = [Select Id,Phone FROM Contact where Id =: conList[0].Id];
        System.assertEquals('654321',Contactupd[0].Phone);
    }
}