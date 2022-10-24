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

        Flow.Interview flw = new Flow.Interview.Sales_Rep_Suggester(
            new Map<String, Object>{
                'Country_of_Residence' => paramCountry
                    , 'First_Time_Customer' => paramBoolFirstTimeCustomer
            }
        );
        flw.start();
        User u = (User) flw.getVariableValue('Sales_Rep_User');

        return String.valueOf(u.Id);

    }

}