/**
 * FROM A NEW ACCOUNT, CREATING A NEW OBJECT AUTOMATICALLY
 * //OBS. Create the Trigger berfore insert and calls this class sending Trigger.New
 * //1. Create an static method that receives the Trigger.New inside in one List
 * //2. For loop that will run all records of the List
 * //3. Create Lists_1 that will be inserted at the end
 * //4. List_2 that will receive the values of fields in the foor loop to insert in List_1.
 * //5. INSERT List_1
 */

public with sharing class insertPagamentoInAccount {
    //1. Create an static method that receives the Trigger.New inside in one List
    public static void insertinginAccount(List<Account> idsAccount) {
        //3. Create Lists_1 that will be inserted at the end
        List<Pagamento__c> pg = new List<Pagamento__c>();
        //2. For loop that will run all records of the List
        for (Account acct : idsAccount) {
            //4. Receive the values of fields in the foor loop.
            Pagamento__c objPag = new Pagamento__c();
            objPag.Valor__c = 500;
            objPag.Account__c = acct.id;
            pg.add(objPag);
        }
        //5. INSERT List_1
        if (pg.size() > 0) {
            INSERT pg;
        }
    }
}
