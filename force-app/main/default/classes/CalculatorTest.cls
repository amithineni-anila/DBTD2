@IsTest
public class CalculatorTest {
    
    @IsTest
    public static void testAddingTwoNumbers() {
        Calculator cal = new Calculator(1.2, 2.2);
        //1.2, 2.2
        Double result = cal.add();
        Assert.areEqual(3.4, result);
    }
  
    @IsTest
    public static void testAddingTwoNumbers_moreLogic() {
        Calculator cal = new Calculator(2.0, 2.2);
        //(2.0, 2.2
        Double result = cal.add();
        Assert.areEqual(6.2, result);
    }
  
    @IsTest
    public static void testAddingTwoNumbers_more() {
        Calculator cal = new Calculator();
        //(2.0, 2.2
        Double result = cal.add();
        Assert.areEqual(4.0, result);
    }
    
    
    @IsTest
    public static void testMulitplyTwoNumbers() {
        Calculator cal = new Calculator();
        //(2.0, 2.2
        Double result = Calculator.multiply(1.0, 2.0);
        Assert.areEqual(2, result);
    }    
    
}