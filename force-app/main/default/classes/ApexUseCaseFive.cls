public  class ApexUseCaseFive {
    public static Boolean AccountContactExist(String AccountName,String ContactName) {
        List<Contact> ContactRecords = [SELECT Id,Name,Account.Name from Contact where Name =:ContactName AND Account.Name =:AccountName];
        if(ContactRecords.size()>0){
            return true;
        }
        return false;
    }
}