public class Account_AssignSuggSalesRep_TAF implements TriggerAction.BeforeInsert {

    public void beforeInsert(List<Account> newAccts) {
        Set<Id> acctIdsToProcess = new Set<Id>(); // Not sure what to do
        List<Account> acctsToProcess = new List<Account>(); // Not sure what to do
        for (Account acc : newAccts) {
            acctIdsToProcess.add(acc.Id); // Not sure what to do
            acctsToProcess.add(acc); // Not sure what to do
        }
         // Not sure what to do
        if (!acctsToProcess.isEmpty()) {
            doPostProcess(acctsToProcess);
        }
    }

    private static void doPostProcess(List<Account> acctMemoryToProcess) {
        Account_AssignSuggSalesRep processor = new Account_AssignSuggSalesRep(acctMemoryToProcess);
        List<Account> retdAccts = processor.getAssignedAccountMemoryObjects(); // Need to fix this; not a real clone
        // Once real clone, do copying to acctMemoryToProcess objects I think, since before-trigger
    }

}