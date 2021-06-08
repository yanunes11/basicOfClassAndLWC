/**
 * //Create the Trigger berfore insert and calls this class sending Trigger.New
 */

trigger createPagamentotrigger on Account (before insert, after insert, after update) {
    if (Trigger.isInsert) {
        if (Trigger.isBefore) {
            Account acct = new Account();
            acct.Description = 'inserted with isBefore' + date.today();
        }
        if (Trigger.isAfter) {
            insertPagamentoInAccount.insertinginAccount(Trigger.New);
        }
    } else if (Trigger.isUpdate) {
        insertTaskInAccount.insertTaskInAccount(Trigger.New);
    }

}