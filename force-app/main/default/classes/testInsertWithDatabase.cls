@isTest
public with sharing class testInsertWithDatabase {
    @isTest
    public static void testing() {
        Account acct = [SELECT Id, UpsellOpportunity__c FROM Account WHERE Id = '0015e000008IYo5AAG'];
        acct.UpsellOpportunity__c = 'Yes';

        Test.startTest();
        UPDATE acct.;
        Test.stopTest();

        Opportunity opt = [SELECT AccountId FROM ]

        system.assertEquals('Yes', 'Maybe');
    }
}
