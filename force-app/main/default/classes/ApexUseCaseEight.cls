public  class ApexUseCaseEight {
    public static UserInfowrapper UserLoggedinInfo() {
        UserInfowrapper wrapper = new UserInfowrapper();
        wrapper.localeInfo = UserInfo.getLocale();
        wrapper.timezone=String.ValueOf(UserInfo.getTimeZone());
        String UserID =UserInfo.getUserId();
        wrapper.Name=UserInfo.getUserName();
        List<User> Userrec = [SELECT Id,LastLoginDate FROM User where Id =:UserID LIMIT 1];
        wrapper.LastLogininfo=Userrec[0].LastLoginDate;
        return wrapper;
    }
public class UserInfowrapper{
    public DateTime LastLogininfo;
    public String localeInfo;
    public String timezone;
    public String Name;
}
}