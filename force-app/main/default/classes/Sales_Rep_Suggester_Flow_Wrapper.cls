public without sharing class Sales_Rep_Suggester_Flow_Wrapper {
    public static String getSalesRep(String country, Boolean firstTimeCustomer) {
        Flow.Interview flw = new Flow.Interview.Sales_Rep_Suggester(
            new Map<String, Object>{
                'Country_of_Residence' => country
                    , 'First_Time_Customer' => firstTimeCustomer
                    }
        );
        flw.start();
        User u = (User) flw.getVariableValue('Sales_Rep_User');
        return String.valueOf(u.Id);
    }
}