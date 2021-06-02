/**
 * INSERT DESCRIPTION BEFORE AND CREATE OPORTUNITY AFTER
 * //1 - Name of trigger and the object that will fire it
 * //2 - For loop before to create a description
 * //3 - For loop after to create an opportunity calling a class
 */
//1 - Name of trigger and the object that will fire it
trigger accountBeforeAfterInsert on Account (before insert, after insert) {
    // 2 - For loop before to create a description
    List<Opportunity> opt = new List<Opportunity>();
    for (Account acct : Trigger.New) {
        if (Trigger.isBefore) {
            acct.Description = 'It was insert using Trigger.isInsert';
        }
        if (Trigger.isAfter) {
            opt.add(new Opportunity(AccountId = acct.Id,
                                    Name = 'Opportunity' + 3,
                                    StageName = 'Prospecting',
                                    CloseDate = date.today().addMonths(1)
                   ));
        }
    }
    if (opt.size() > 0) {
        try {
            INSERT opt;
        } catch (Exception e) {
            system.debug(e.getMessage());
        }
        
    }
}