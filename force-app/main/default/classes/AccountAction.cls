public class AccountAction {
 @InvocableMethod
    public static List<Decimal> updateAccrevenue(List<Id> ids){
        List<Opportunity> oppList = [Select AccountId,Amount From Opportunity WHERE Id=:ids[0]];
        List<Account> accList= [Select AnnualRevenue From Account WHERE Id=:oppList[0].AccountId];
        List<Decimal> AnnualRevenueList = new List<Decimal>();
        accList[0].AnnualRevenue = accList[0].AnnualRevenue + oppList[0].Amount;
        update accList;
        AnnualRevenueList.add(accList[0].AnnualRevenue);
        return AnnualRevenueList;
    }
}