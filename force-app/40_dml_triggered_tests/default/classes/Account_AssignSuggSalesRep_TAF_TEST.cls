@isTest
private class Account_AssignSuggSalesRep_TAF_TEST {
    
    private static Profile prof = [SELECT Id FROM Profile WHERE Name='Standard User']; 
    private static User dummyUser = new User(Alias = 'dummyu', Email='dummyuser289uajdsaff879hfksj@example.com', 
        EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
        LocaleSidKey='en_US', ProfileId = prof.Id, 
        TimeZoneSidKey='America/Chicago', UserName='dummyuser289uajdsaff879hfksj@example.com');
    
    private static testMethod void validateTriggerHandlerAltersOwnerId() {
        INSERT dummyUser;
        Map<String, Account> acctsByNickname = new Map<String, Account>{
            'a1' => new Account(Name='Albanian Apples', BillingCountry='Albania', OwnerId=dummyUser.Id),
                'a2' => new Account(Name='Zimbabwean Zebras', BillingCountry='Zimbabwe', OwnerId=dummyUser.Id),
                'a3' => new Account(Name='Japanese Junipers', BillingCountry='Japan', OwnerId=dummyUser.Id),
                'a4' => new Account(Name='French Flowers', BillingCountry='French', OwnerId=dummyUser.Id),
                'a5' => new Account(Name='Montserrat Maples', BillingCountry='Montserrat', OwnerId=dummyUser.Id),
                'a6' => new Account(Name='Kenyan Kiwis', BillingCountry='Kenya', OwnerId=dummyUser.Id)
                }; {}
        Test.startTest();
        INSERT acctsByNickname.values();
        Test.stopTest();
        Map<Id, Account> acctsAfter = new Map<Id, Account>([SELECT OwnerId FROM Account]);
        Assert.areNotEqual(0, acctsAfter.size(), 'No accts after');
        for ( String nickname : acctsByNickname.keySet() ) {
            Id acctId = acctsByNickname.get(nickname).Id;
            Account acct = acctsAfter.get(acctId);
            Assert.isNotNull(acct.OwnerId, nickname);
            Assert.areNotEqual(dummyUser.Id, acct.OwnerId, nickname);
        }
    }
    
}