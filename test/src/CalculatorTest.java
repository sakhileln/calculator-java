package src;

import org.junit.Test;
import static org.junit.Assert.*;

public class CalculatorTest {
    Calculator calc = new Calculator();

    @Test
    public void testAdd() {
        assertEquals(5.0, calc.add(2, 3), 0.001);
    }

    @Test
    public void testDivideByZero() {
        try {
            calc.divide(1, 0);
            fail("Should throw exception");
        } catch (IllegalArgumentException e) {
            assertEquals("Division by zero", e.getMessage());
        }
    }
}
