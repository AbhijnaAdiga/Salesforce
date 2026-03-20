public class UseCase4 {
    public static void CheckHighestLowest(Map<String,Integer>myreport){
        Integer minmarks =0;
        Integer maxmarks=0;
        for(String subject : myreport.keyset()){
            if(minmarks == 0){
                minmarks =myreport.get(subject);
            }
            Integer subjectmarks = myreport.get(subject);
            if(maxmarks < subjectmarks){
                maxmarks=subjectmarks;
            }
            if(minmarks > subjectmarks){
                minmarks=subjectmarks;
            }
        }
        System.debug('Minimum Marks is:'+minmarks);
        System.debug('Maximum Marks is:'+maxmarks);
    }
}