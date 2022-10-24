/*
* This is a pretty useless API for a general-public-facing website when it's behind a login-wall.
* See https://www.wadewegner.com/2013/03/creating-anonymous-apex-rest-apis-with-force.com/ to 
* make "get_sales_rep" accessible to the whole world.
*/
@RestResource(urlMapping='/get_sales_rep/*')
global with sharing class SalesRepAPI {
    @TestVisible private static String unitTestHelperCountry;
    @HttpGet
    global static String getSalesRep() {
        RestRequest req = RestContext.request;
        String paramCountry = req.params.get('country');
        unitTestHelperCountry = paramCountry;
        String paramFirstTimeCustomer = req.params.get('firstTimeCustomer');
        Boolean paramBoolFirstTimeCustomer = ( String.isBlank(paramFirstTimeCustomer) ? FALSE : Boolean.valueOf(paramFirstTimeCustomer) );
        String returnMe = Sales_Rep_Suggester_Flow_Wrapper.getSalesRep(paramCountry, paramBoolFirstTimeCustomer);
        return returnMe;
    }
}