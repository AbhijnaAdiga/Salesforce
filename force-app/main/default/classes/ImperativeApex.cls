public with sharing class ImperativeApex {
    @AuraEnabled(cacheable=true)
    public static List<Student__c> studentImperativeApex() {
        return [SELECT Id,Name,Age__c FROM Student__c];
    }
}