public with sharing class ApexInvocableinFlow {
   
    public class OutputWrapper {
        @InvocableVariable
        public String Name;
        @InvocableVariable
        public Date CollegeLeftDate;
        @InvocableVariable
        public String Email;
        @InvocableVariable
        public String Alumni;
    }
    @InvocableMethod(Label='Get Student Details' Description='Get Student Details')
    public static List<OutputWrapper> Studentdetails(List<Id> recordId) {
        List<OutputWrapper> results = new List<OutputWrapper>();
        List<Student__c> student = [SELECT Id,Name,Student_Email__c,Alumni__c,College_Left_Date__c FROM Student__c WHERE Id = :recordId LIMIT 1];
       OutputWrapper output = new OutputWrapper();
       output.Name = student[0].Name;
       output.Email = student[0].Student_Email__c;
        output.Alumni = student[0].Alumni__c;
        output.CollegeLeftDate = student[0].College_Left_Date__c;
        results.add(output);
        return results;
    }
}