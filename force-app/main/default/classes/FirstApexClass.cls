public class FirstApexClass {

    public static void ConditionalsInApex(String typeOfCustomer,Decimal purchaseAmount){
        if(purchaseAmount > 0){
            System.debug('You have got discount!!');
        }
        if(typeOfCustomer == 'Premium'){
            DateTime CurrDtTime = DateTime.now();
            Date CurrDate = CurrDtTime.Date();
            Time CurrTime = CurrDtTime.time();   
           System.debug('Current time is '+ CurrDtTime +',' + CurrDate + ',' + CurrTime + '');
            System.debug('You have got discount!!');
        }
    }
}