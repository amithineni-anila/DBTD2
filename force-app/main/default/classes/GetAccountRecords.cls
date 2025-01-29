public class GetAccountRecords {
    public static void getAccounts(){
    List<Account> Accounts = [SELECT Id, Name From Account];
        system.debug(Accounts);
    }
}