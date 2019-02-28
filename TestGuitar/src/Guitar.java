import java.util.Random;
/*
* File: Guitar.java
* Author: Matt Rieser
* Date: October 29, 2017
* Purpose: This program constructs instances
* of the TestGuitar class and uses
* its methods
*/
public class Guitar {
 public static void main (String[] args) {
// Construct a guitar
	 TestGuitar guitar0 = new TestGuitar();
	 TestGuitar guitar1 = new TestGuitar(7, 30.2,"Fender","Black");
	 TestGuitar guitar2 = new TestGuitar(8, 25.5,"Martin","Blue");
	 TestGuitar guitar3 = new TestGuitar(16,27.8,"Seagull","Brown");
	 System.out.println("toString(): " + guitar0.toString());
	 System.out.println("getnumString(): " + guitar0.getnumStrings());
	 System.out.println("getguitarLength(): " + guitar0.getguitarLength());
	 System.out.println("getguitarManufacturer(): " + guitar0.getguitarManufacturer());
	 System.out.println("getguitarColor(): " + guitar0.getguitarColor());
	 System.out.println("playGuitar(): " + guitar0.playGuitar());
 }
}
