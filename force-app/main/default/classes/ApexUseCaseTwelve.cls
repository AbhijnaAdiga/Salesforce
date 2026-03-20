public  class ApexUseCaseTwelve {
    public static void CaseAssignBasedCriteria(Case caserec) {
            if(caserec.Priority == 'High' && caserec.Origin == 'Email'){
                List<Group> mySLAQueue = [SELECT Id FROM Group WHERE Type='Queue' AND DeveloperName = 'High_Priority'];
                if(mySLAQueue.size() == 1){
                caserec.OwnerId = mySLAQueue[0].Id;
                update caserec;
                }
            }
    }
}