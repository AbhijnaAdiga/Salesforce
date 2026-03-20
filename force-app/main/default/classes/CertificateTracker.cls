public class CertificateTracker {
    public static Map<String,Date> myCertificateData = new Map<String,Date>();
    
    public static void addnewCertif(String name,Date issuedate){
        myCertificateData.put(name,issuedate);  
    }
    public static List<Date> CertificateDates(){
        return myCertificateData.values();
    }
    public static Integer CertificateCountsize(){
        return myCertificateData.size();
    }
      public static Set<String> CertificateNames(){
        return myCertificateData.keySet();
    }
}