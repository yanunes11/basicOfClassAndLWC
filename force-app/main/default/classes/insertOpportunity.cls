public with sharing class insertOpportunity {
    public static void insertingOpp(List<Id> acctId) {
        List<Opportunity> oppt = new List<Opportunity>();
        Integer i = 1;
        for (Id acct : acctId) {
            oppt.add(new Opportunity(AccountId = acct,
                                    Name = 'oportunity' + i,
                                    StageName = 'Prospecting',
                                    CloseDate = date.today().addMonths(1)
                        ));
            i++;
        }
        if (oppt.size() > 0) {
            INSERT oppt;
        }
    }
}
