public class ApexUseCaseSeven {
    public static Boolean CheckDuplicates(Lead leadrecords){
        List<Lead> Leadrecordstocheck =[Select Id FROM Lead where Id !=:leadrecords.Id AND FirstName =:leadrecords.FirstName AND LastName =:leadrecords.LastName AND Email =:leadrecords.Email];
        if(Leadrecordstocheck.size()>0){
            return true;
        }
        return false;
    }
}

/*Lead leadrec = [Select Id,FirstName,LastName,Email from Lead where Id='00QgL000008kiUUUAY'];
System.Debug(ApexUseCaseSeven.CheckDuplicates(leadrec));*/