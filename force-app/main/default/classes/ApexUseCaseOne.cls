public class ApexUseCaseOne {
    public static void CreateNewContact(String FirstName, String LastName, String Email) {
        List<Contact> contactListInsert = new List<Contact>();
        Contact conInsert = new Contact();
        conInsert.FirstName = FirstName;
        conInsert.LastName = LastName;
        conInsert.Email = Email;
        contactListInsert.add(conInsert);

    if(contactListInsert.size()>0){
        insert contactListInsert;
    }
}
}