/**
 * //Create the Trigger berfore insert and calls this class sending Trigger.New
 */

trigger createPagamentotrigger on Account (after insert) {
    insertPagamentoInAccount.insertinginAccount(Trigger.New);
}