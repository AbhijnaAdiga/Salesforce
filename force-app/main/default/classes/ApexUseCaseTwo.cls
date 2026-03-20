public class ApexUseCaseTwo {
    public static Decimal SimpleInterestCalculator(Decimal principal, Decimal rate, Integer term) {
        if(principal != null){
            Decimal simpleInterest = (principal * rate * term) / 100;
           return simpleInterest;
        }
        return 0;
    }
}