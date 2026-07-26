public  class GetLeadDetails {
    @InvocableMethod(label='Get Lead Details')
    public static List<String> leaddetails(List<inputwrapper> inps){
            Set<Id> Ids = new Set<Id>();
            for(inputwrapper inp:inps){
                Ids.add(inp.recordId);
            }
         List<Lead> leadlst = [Select Id,LeadSource FROM Lead where Id IN:Ids];
         List<String> leads = new List<String>();
         for(Lead leadlist:leadlst){
            leads.add(leadlist.LeadSource);
         }
         return leads;
    }
    public class inputwrapper {
        @InvocableVariable
        public string recordId;
    }
}