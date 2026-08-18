public with sharing class PrintPDFfromVF {

    public Opportunity opp { get; set; }

    public PrintPDFfromVF() {

        Id oppId = ApexPages.currentPage().getParameters().get('id');

        opp = [
            SELECT Name, Amount, StageName
            FROM Opportunity
            WHERE Id = :oppId
        ];
    }
}