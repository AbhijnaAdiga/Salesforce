public  class ApexUseCaseFour {
    public static List<String> ContactEmails (String accountName) {
        List<String> EmailList = new List<String>();
        List<Contact> contactlist = [SELECT Id,Email FROM Contact WHERE Account.Name = :accountName];
        if(contactlist.size()>0){
        for(Contact con : contactlist){
            if(con.Email != null){
                EmailList.add(con.Email);
            }
        }
    }
        return EmailList;
    }
}