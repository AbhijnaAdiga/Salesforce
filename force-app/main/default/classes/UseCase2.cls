public class UseCase2 {
    public static String CorrectPassword = 'SALESFORCEISNONSENSE';
    public static Integer attemptcounter = 1;
    
    public static String PasswordCheck(String PasswordInput){
        
        if(PasswordInput != CorrectPassword){
           
            if(attemptcounter > 3){
                return 'Maximum attempts reached...';
            }
             attemptcounter++;
            return 'failure';
        }else{
            return 'Success';
        }
    } 
}