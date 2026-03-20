public class ApexUseCaseThree {
    public static void SendOutboundEmail(String EmailAddress) {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        List<String> toAddress = new List<String>{EmailAddress};
        mail.setToAddresses(toAddress);
        mail.setSubject('Test Email');
        mail.setPlainTextBody('Hey!This is a notification email');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
    }
}