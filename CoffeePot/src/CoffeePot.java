/*
 *File: CoffeePot.java
 * Author: Matt Rieser
 * Date: November 12, 2017
 * Purpose: This program constructs a class that asks for a users input to start
 * the coffee maker and to start the brew of the coffee. Then counts up from 0 to
 * while it brews. It also uses the Coffee class methods to find amount of cups of coffee made. 
 */
import java.util.Scanner;
public class CoffeePot {
    public static void main(String[] args) {
        boolean coffeeMaker = false;
        System.out.print("Enter true to turn on the Coffee Maker: ");
        Scanner n = new Scanner(System.in);
        boolean onOrOff = n.nextBoolean();
        do {}
        while (onOrOff == false); {
            if (onOrOff == true) {
                System.out.println("CoffeePot is on... ");
            }
            System.out.print("Enter true to start the brew: ");
            boolean brew = n.nextBoolean();
            while (onOrOff == false); {
                if (onOrOff == true) {
                    System.out.println("Coffee is now brewing...");
                    int i = 0;
                    while (i < 11) {
                        System.out.println(i);
                        i++;
                    }
                    //default CoffeePot
                    Coffee defaultCoffee = new Coffee();
                    System.out.println("Coffee is finshed");
                    System.out.println("Amount of Coffee in Cups: " + defaultCoffee.getcupsOfCoffee());
                }
            }
        }
    }
}