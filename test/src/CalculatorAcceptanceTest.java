package src;

import src.Calculator;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 * As a user
 * I want to use a calculator for basic operations
 * So that I can quickly compute results for real-world problems
 */
public class CalculatorAcceptanceTest {

    private Calculator calculator;

    @Before
    public void setUp() {
        // Given a fresh calculator instance
        calculator = new Calculator();
    }

    @After
    public void tearDown() {
        calculator = null;
    }

    @Test
    public void validAdditionShouldReturnCorrectResult() {
        // When I add two numbers
        double result = calculator.add(10, 5);

        // Then I get the correct sum
        assertEquals(15.0, result, 0.001);
    }

    @Test
    public void validDivisionShouldReturnCorrectResult() {
        // When I divide two valid numbers
        double result = calculator.divide(20, 4);

        // Then I get the correct quotient
        assertEquals(5.0, result, 0.001);
    }

    @Test
    public void divisionByZeroShouldThrowException() {
        // When I divide by zero
        try {
            calculator.divide(10, 0);
            fail("Expected IllegalArgumentException for division by zero");
        } catch (IllegalArgumentException e) {
            // Then I get a clear error message
            assertEquals("Division by zero", e.getMessage());
        }
    }

    @Test
    public void subtractionShouldBeAccurate() {
        // When I subtract one number from another
        double result = calculator.subtract(7, 3);

        // Then the result should be the correct difference
        assertEquals(4.0, result, 0.001);
    }
}
