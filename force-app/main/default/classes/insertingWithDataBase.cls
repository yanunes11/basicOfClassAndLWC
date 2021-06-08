public with sharing class insertingWithDataBase {
    public static void inserting(List<Account> AccountList) {
        List<Opportunity> opt = new List<Opportunity>();

        for(Account acct : AccountList) {
            if (acct.UpsellOpportunity__c == 'yes') {
                Opportunity optList = new Opportunity();
                optList.Name = 'By Data ' + acct.Name;
                optList.AccountId = acct.Id;
                optList.CloseDate = date.today().addMonths(1);
                optList.StageName = 'Qualification';
                opt.add(optList);
            }
        }

        Database.SaveResult[] srList = Database.insert(opt, true); //save line

        //track saved records and the saved ones
        for (Database.SaveResult sr : srList) {
            if (sr.isSuccess()) {
                system.debug('Sucessfully inserted the opportunity ' +sr.getId());
            }
            else {
                for(Database.Error objErr : sr.getErrors()) {
                    system.debug('The following errors occured: ');
                    system.debug(objErr.getStatusCode() + ' ' + objErr.getMessage());
                    system.debug('Opportunities objects fields wich are affected' +objErr.getFields());
                }
            }
        }
    }
}
