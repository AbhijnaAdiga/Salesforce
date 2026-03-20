public class UseCase3 {
    public static Integer NoofDaysLearned(Map<String,Boolean> weeklog){
        Integer NoofDays = 0;
        for (String weekday : weeklog.keySet()){
            Boolean Days =weeklog.get(weekday);
            if(Days){
                NoofDays++;
            }
        }
		return NoofDays;
    }
}