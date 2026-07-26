public class TaskTriggerHandler {
    public static void DeleteTaskValidation(List<Task> oldrec){
        Id Profileid = Userinfo.getProfileId();
        Profile Profilelist = [SELECT Id,Name FROM Profile where Id =: (Profileid)];
        if(Profilelist.Name != 'System Administrator'){
        for(task t:oldrec){
                t.addError('Only System Administrator can delete task record');
            }
        }
    }
}