public class Calculator {
    static Decimal c = 100;
    Decimal a;
	Decimal b;    
    public Calculator() {
        a = 0.0;
        b = 0.0;
    }
    
    public Calculator(Decimal a, Decimal b) {
        this.a = a;
        this.b = b;
    }    
 
    public Double add() {
        if(a == 2.0) {
            Decimal temp = 2.0;
            System.debug('just for tesgting');
            a = temp * 2.0;
        }
        Decimal temp = 0.0;
        System.debug(temp);
        return a + b;
    }    
    
    public static Decimal multiply(Decimal a, Decimal b) {
        return a * b;
    }

}