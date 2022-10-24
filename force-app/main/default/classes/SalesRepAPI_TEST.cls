@IsTest
private class SalesRepAPI_TEST {
    @isTest static void testGet() {
        // Set up a test request
        RestRequest req = new RestRequest();
        req.requestUri = '/services/apexrest/get_sales_rep/';
        req.addParameter('country', 'Japan');
        req.addParameter('firstTimeCustomer', String.valueOf(FALSE));
        req.httpMethod = 'GET';
        RestContext.request = req;
        
        Test.startTest();
        // Call the method to test
        Id salesRepId = SalesRepAPI.getSalesRep();
        Test.stopTest();
        
        // Verify results
        Assert.isNotNull(salesRepId, 'Class ID');
        // Note:  Apex unit tests can't validate the contents of RestResponse-typed objects, so don't bother checking for statusCode 200, a body that matches "salesRepID," etc.
        // This hack is about the closest we can get to using a unit test to make sure that the SalesRepAPI is truly accepting HTTP parameters.
        Assert.areEqual('Japan', SalesRepAPI.unitTestHelperCountry);
    }    
}