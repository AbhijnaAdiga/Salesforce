public class ApexUseCaseTen {
    public static Account findMaxRevenue() {
        List<Account> accrec =[SELECT Id,Name FROM Account WHERE AnnualRevenue!= null ORDER BY AnnualRevenue DESC LIMIT 1];
        if(accrec.size()>0){
            return accrec[0];
        }
        return null;
    }
}