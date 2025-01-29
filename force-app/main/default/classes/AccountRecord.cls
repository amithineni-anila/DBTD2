public class AccountRecord {
    public static void account(){
        firstAccount();
    }
    public static void firstAccount(){
        Account acc = new Account();
        acc.name='PRAMEELA';
        acc.phone='9492001671';
        insert acc;
        acc.type= 'partnar';
        update acc;
    }
}