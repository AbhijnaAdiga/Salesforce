public with sharing class wiremethodapexclass {
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> Opportunitywire() {
        return [SELECT Id,Name,AccountId,StageName FROM Opportunity];
    }
}