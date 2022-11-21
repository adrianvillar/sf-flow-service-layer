@isTest
private class Account_AssignSuggSalesRep_ALFlow_TEST {
    
    private static Profile prof = [SELECT Id FROM Profile WHERE Name='Standard User']; 
    private static User dummyUser = new User(Alias = 'dummyu', Email='dummyuser289uajdsaff879hf@example.com', 
        EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
        LocaleSidKey='en_US', ProfileId = prof.Id, 
        TimeZoneSidKey='America/Chicago', UserName='dummyuser289uajdsaff879hf@example.com');
    
    private static testMethod void validateSuggesterAltersOwnerId() {
        INSERT dummyUser;
        Map<String, Account> acctsByNickname = new Map<String, Account>{
            'a1' => new Account(Name='a1', BillingCountry='Albania', OwnerId=dummyUser.Id),
                'a2' => new Account(Name='a2', BillingCountry='Zimbabwe', OwnerId=dummyUser.Id),
                'a3' => new Account(Name='a3', BillingCountry='Japan', OwnerId=dummyUser.Id),
                'a4' => new Account(Name='a4', BillingCountry='French', OwnerId=dummyUser.Id),
                'a5' => new Account(Name='a5', BillingCountry='Montserrat', OwnerId=dummyUser.Id),
                'a6' => new Account(Name='a6', BillingCountry='Kenya', OwnerId=dummyUser.Id)
                }; {}

        Flow.Interview flw = new Flow.Interview.Account_AssignSuggSalesRep_Flw_TAF(
            new Map<String, Object>{'record' => acctsByNickname.get('a1')}
        );
        
        Test.startTest();
    	flw.start();
        Test.stopTest();
        
        Account a1Output = (Account) flw.getVariableValue('record');
        Assert.isNotNull(a1Output, 'Flow returned null output1');
 
        Assert.isNotNull(a1Output.OwnerId, a1Output.Name);
        Assert.areNotEqual(dummyUser.Id, a1Output.OwnerId, a1Output.Name);
    }
    
}