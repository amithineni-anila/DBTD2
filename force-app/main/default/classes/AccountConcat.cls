public class AccountConcat { 
    public static void accountsToUpdate(){
        List<Account> listacc = [SELECT Id, Name, AccountNumber, Account_Information__c FROM Account];
        for(Account acc:listacc){
            acc.Account_Information__c = acc.Name+'-'+acc.AccountNumber;
        }
        update listacc;
        system.debug(listacc);
    }
}