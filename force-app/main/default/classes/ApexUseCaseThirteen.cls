public with sharing class ApexUseCaseThirteen {
    public static List<Task> TaskCreated() {
            return [SELECT Id,Subject from Task ORDER BY CreatedDate DESC LIMIT 5];
    }
}