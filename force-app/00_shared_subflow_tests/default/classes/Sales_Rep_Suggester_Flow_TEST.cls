@isTest
private class Sales_Rep_Suggester_Flow_TEST {
    
    private static testMethod void first_time_japan() {
        Flow.Interview flw = new Flow.Interview.Sales_Rep_Suggester(
            new Map<String, Object>{'Country_of_Residence' => 'Japan', 'First_Time_Customer' => TRUE}
        );
        
        Test.startTest();
    	flw.start();
        Test.stopTest();
        
        User u = (User) flw.getVariableValue('Sales_Rep_User');
        Assert.isNotNull(u.Id);
    }
    
    private static testMethod void first_time_kenya() {
        Flow.Interview flw = new Flow.Interview.Sales_Rep_Suggester(
            new Map<String, Object>{'Country_of_Residence' => 'Kenya', 'First_Time_Customer' => TRUE}
        );
        
        Test.startTest();
    	flw.start();
        Test.stopTest();
        
        User u = (User) flw.getVariableValue('Sales_Rep_User');
        Assert.isNotNull(u.Id);
    }
    
    private static testMethod void first_time_montserrat() {
        Flow.Interview flw = new Flow.Interview.Sales_Rep_Suggester(
            new Map<String, Object>{'Country_of_Residence' => 'Montserrat', 'First_Time_Customer' => TRUE}
        );
        
        Test.startTest();
    	flw.start();
        Test.stopTest();
        
        User u = (User) flw.getVariableValue('Sales_Rep_User');
        Assert.isNotNull(u.Id);
    }
    
    private static testMethod void first_time_france() {
        Flow.Interview flw = new Flow.Interview.Sales_Rep_Suggester(
            new Map<String, Object>{'Country_of_Residence' => 'France', 'First_Time_Customer' => TRUE}
        );
        
        Test.startTest();
    	flw.start();
        Test.stopTest();
        
        User u = (User) flw.getVariableValue('Sales_Rep_User');
        Assert.isNotNull(u.Id);
    }    private static testMethod void returning_time_japan() {
        Flow.Interview flw = new Flow.Interview.Sales_Rep_Suggester(
            new Map<String, Object>{'Country_of_Residence' => 'Japan', 'First_Time_Customer' => FALSE}
        );
        
        Test.startTest();
    	flw.start();
        Test.stopTest();
        
        User u = (User) flw.getVariableValue('Sales_Rep_User');
        Assert.isNotNull(u.Id);
    }
    
    private static testMethod void returning_time_kenya() {
        Flow.Interview flw = new Flow.Interview.Sales_Rep_Suggester(
            new Map<String, Object>{'Country_of_Residence' => 'Kenya', 'First_Time_Customer' => FALSE}
        );
        
        Test.startTest();
    	flw.start();
        Test.stopTest();
        
        User u = (User) flw.getVariableValue('Sales_Rep_User');
        Assert.isNotNull(u.Id);
    }
    
    private static testMethod void returning_time_montserrat() {
        Flow.Interview flw = new Flow.Interview.Sales_Rep_Suggester(
            new Map<String, Object>{'Country_of_Residence' => 'Montserrat', 'First_Time_Customer' => FALSE}
        );
        
        Test.startTest();
    	flw.start();
        Test.stopTest();
        
        User u = (User) flw.getVariableValue('Sales_Rep_User');
        Assert.isNotNull(u.Id);
    }
    
    private static testMethod void returning_france() {
        Flow.Interview flw = new Flow.Interview.Sales_Rep_Suggester(
            new Map<String, Object>{'Country_of_Residence' => 'France', 'First_Time_Customer' => FALSE}
        );
        
        Test.startTest();
    	flw.start();
        Test.stopTest();
        
        User u = (User) flw.getVariableValue('Sales_Rep_User');
        Assert.isNotNull(u.Id);
    }
    
}