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
    Integer i = 1;
    for (Account acct : Trigger.New) {
        if (Trigger.isInsert) {
            acct.Description = 'It was insert using Trigger.isInsert';
        }
        else if (Trigger.isAfter) {
            opt.add(new Opportunity(AccountId = acct.Id,
                                    Name = 'Opportunity' + i,
                                    StageName = 'Prospecting',
                                    CloseDate = date.today().addMonths(1)
            ));
        }
    }
}