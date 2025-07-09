package src;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Calculator calc = new Calculator();
        Scanner scanner = new Scanner(System.in);
        System.out.println("Enter operation (add, sub, mul, div) and two numbers:");

        String op = scanner.next();
        double a = scanner.nextDouble();
        double b = scanner.nextDouble();
        double result = 0;

        switch (op) {
            case "add": result = calc.add(a, b); break;
            case "sub": result = calc.subtract(a, b); break;
            case "mul": result = calc.multiply(a, b); break;
            case "div": result = calc.divide(a, b); break;
            default: System.out.println("Unknown operation"); return;
        }

        System.out.println("Result: " + result);
    }
}
