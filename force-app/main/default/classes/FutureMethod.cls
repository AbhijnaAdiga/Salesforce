public class FutureMethod {
    public static void insertAcc(){
        Account acc = new Account();
        acc.name = 'ICICIII new Bank';
        acc.Rating ='Warm';
        acc.Industry ='Banking';
        acc.Fax ='560';
        acc.Phone = '98080';
        System.debug('Account Inserted');
        insert acc;
        
        
         UserUpdate();
    }
    
    @future
    public static void UserUpdate(){
        list<User> activeUser  = [select id,firstname,lastname,username,isActive 
		from user where username = 'adiggaagg@gmail.com' and isActive = true LIMit 1];
        if(!activeUser.isEmpty()){
            activeUser[0].IsActive = false;
                    System.debug('activeUser Updated');
            update activeUser;
        }
    }
}