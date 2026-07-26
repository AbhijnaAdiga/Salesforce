@isTest
public class OpportunityTriggerHandlerTest {
@isTest
    public static void UpdateDescTest(){
        List<Opportunity> oppList = new List<Opportunity>();
        for(Integer i=0;i<5;i++){
            Opportunity opp=new Opportunity();
            opp.Name='New Test'+i;
            opp.Amount=20000;
            opp.StageName='Prospecting';
            opp.CloseDate=System.today();
            oppList.add(opp);
        }
		Test.startTest();
		insert oppList;
        Test.stopTest();
        
        List<Opportunity> oppListUpdate = [Select Id,Description,Name,Amount,StageName FROM Opportunity where Id =:oppList[0].id];
        System.assertEquals('Hot Opportunity',oppListUpdate[0].Description);
    }
    @isTest
    public static void AmountValidationTest(){
        List<Opportunity> oppList = new List<Opportunity>();
        for(Integer i=0;i<5;i++){
            Opportunity opp=new Opportunity();
            opp.Name='New Test Opp'+i;
            opp.StageName='Prospecting';
            opp.CloseDate=System.today();
            oppList.add(opp);
        }
        try{
        insert oppList;
        System.assert(false,'Expected Error but Updated successfully');
        }catch(Exception e){
         System.assert(e.getMessage().contains('Please Enter Amount!'));
        }
    }
}