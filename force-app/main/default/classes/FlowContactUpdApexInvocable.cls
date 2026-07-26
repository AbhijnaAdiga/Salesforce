public class FlowContactUpdApexInvocable {
@InvocableMethod(label='Update Related Contacts Phone Field')
    public static void updrelatedcontactphone(List<inputwrapper> inputs){
         Map<Id, String> accountPhoneMap = new Map<Id, String>();
        for (inputwrapper inp : inputs) {
            accountPhoneMap.put(inp.accountId, inp.phone);
        }
        List<Contact> conlist = new List<Contact>();
        List<Contact> Conlst = [Select Id,Phone,Account.Id FROM Contact WHERE Account.Id IN:accountPhoneMap.keySet()];
        for(Contact con:Conlst){
            con.Phone=accountPhoneMap.get(con.AccountId);
            conlist.add(con);
        }
        update conlist;
    }
    Public class inputwrapper{
        @InvocableVariable
        public string accountId;
        @InvocableVariable
        public String phone;
    }
}