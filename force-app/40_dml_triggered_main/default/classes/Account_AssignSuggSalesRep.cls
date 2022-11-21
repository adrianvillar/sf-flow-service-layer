public class Account_AssignSuggSalesRep {

    private List<Account> accts = new List<Account>();

    public Account_AssignSuggSalesRep(Set<Id> acctIdsToProcess) {
        accts = [SELECT Name, BillingCity FROM Account];
    }

    public Account_AssignSuggSalesRep(List<Account> inMemoryAcctsToProcess) {
        accts = inMemoryAcctsToProcess; // Need to fix this; redundant return in getAssignedAccountMemoryObjects();
    }

    public List<Account> getAssignedAccountMemoryObjects() {
        for (Account acc : accts) {
            Flow.Interview flw = new Flow.Interview.Sales_Rep_Suggester(
                new Map<String, Object>{
                    'Country_of_Residence' => acc.BillingCity
                    , 'First_Time_Customer' => 'abcdefghijklm'.contains(acc.Name.substring(1).toLowerCase())
                }
            );
            flw.start();
            User ownr = (User) flw.getVariableValue('Sales_Rep_User');
            acc.ownerId = ownr.Id;
        }
        return accts;
    }

}