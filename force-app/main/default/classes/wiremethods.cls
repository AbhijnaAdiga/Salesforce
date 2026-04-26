public with sharing class wiremethods {
    @AuraEnabled(cacheable=true)
    public static List<Student__c> studentwiremethod() {
        return [SELECT Id,Name,Age__c FROM Student__c];
    }
}