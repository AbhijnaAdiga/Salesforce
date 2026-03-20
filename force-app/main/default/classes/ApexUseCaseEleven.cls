public  class ApexUseCaseEleven {
    public static Set<Id> Accountreport() {
        Set<Id> AccId = new Set<Id>();
        Set<String> AccName = new Set<String>();
        List<Opportunity> OpportunityRevenue = [Select Id,Name,AccountId FROM Opportunity WHERE Amount > 80000];
        for(Opportunity opp : OpportunityRevenue){
            AccId.add(opp.AccountId);
            AccName.add(opp.Name);
        }
        return AccId;
    }
}