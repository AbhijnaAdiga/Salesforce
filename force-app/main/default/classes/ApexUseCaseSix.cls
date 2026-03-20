public  class ApexUseCaseSix {
    public static Boolean eligibletovote(Date dateofbirth) {
        Date todaydate =System.today();
        Integer AgeinYears = (dateofbirth.monthsBetween(todaydate))/12;
        if(AgeinYears >= 18){
            return true;
        }
        return false;
    }
}