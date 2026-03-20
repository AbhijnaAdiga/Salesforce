public  class ApexUseCaseNine {
    public static Boolean CheckifConhassameParent(Contact rec1,Contact rec2) {
        if(rec1 != null && rec2 != null && rec1.AccountId != null && rec2.AccountId != null){
            if(rec1.AccountId == rec2.AccountId){
            return true;
            }
        }
            return false;
    }
}