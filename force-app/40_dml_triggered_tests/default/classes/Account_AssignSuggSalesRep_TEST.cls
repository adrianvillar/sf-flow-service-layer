@isTest
private class Account_AssignSuggSalesRep_TEST {
    
    private static User dummyUser = new User(Id='005000000000000000');
    private static Map<String, Account> acctsByNickname = new Map<String, Account>{
        'a1' => new Account(Name='Albanian Apples', BillingCountry='Albania', OwnerId=dummyUser.Id),
            'a2' => new Account(Name='Zimbabwean Zebras', BillingCountry='Zimbabwe', OwnerId=dummyUser.Id),
            'a3' => new Account(Name='Japanese Junipers', BillingCountry='Japan', OwnerId=dummyUser.Id),
            'a4' => new Account(Name='French Flowers', BillingCountry='French', OwnerId=dummyUser.Id),
            'a5' => new Account(Name='Montserrat Maples', BillingCountry='Montserrat', OwnerId=dummyUser.Id),
            'a6' => new Account(Name='Kenyan Kiwis', BillingCountry='Kenya', OwnerId=dummyUser.Id)
            }; {}
    
    private static testMethod void validateSuggesterAltersOwnerId() {
        Test.startTest();
        Account_AssignSuggSalesRep processor = new Account_AssignSuggSalesRep(acctsByNickname.values());
        List<Account> retdAccts = processor.getAssignedAccountMemoryObjects(); // Need to fix this; not a real clone
        Test.stopTest();
        for ( String nickname : acctsByNickname.keySet() ) {
            Assert.isNotNull(acctsByNickname.get(nickname).OwnerId, nickname);
            Assert.areNotEqual(dummyUser.Id, acctsByNickname.get(nickname).OwnerId, nickname);
        }
    }
    
}