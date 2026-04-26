public with sharing class UniversityDetails {
    @AuraEnabled(cacheable=true)
    public static List<University__c> UniversityDetailstable(String accountId) {
        List<University__c> UniList = [Select Id,Name,Website__c,Zone__c,Region__c FROM University__c WHERE Id =: accountId LIMIT 10];
        return UniList;
    }
}