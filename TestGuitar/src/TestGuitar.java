import java.util.Random;
import java.util.Scanner;
/*
 * File: TestGuitar.java
 * Author: Matt Rieser
 * Date: October 29, 2017
 * Purpose: This program constructs creates 3 different Guitars, each
representing a unique test case and call each all of the getter methods along with the toString and
playGuitar() methods and document the output. 
 */
public class TestGuitar {
		private int numStrings;
		private double guitarLength;
		private String guitarManufacturer,guitarColor;
		// Default Constructor
		public TestGuitar() {
		this.numStrings = 6;
		this.guitarLength = 28.2;
		this.guitarManufacturer = "Gibson";
		this.guitarColor = "red";
		}
		// Guitar Constructor
		public TestGuitar(int nS, double guitarLength, String guitarManufacturer, String guitarColor) {
		this.numStrings = numStrings;
		this.guitarLength = guitarLength;
		this.guitarManufacturer = guitarManufacturer;
		this.guitarColor = guitarColor;
		}
		public String toString() 
		{
		return "(numStrings= "+this.numStrings+" "+"Length= "+this.guitarLength+" "+"Manufacturer= " +this.guitarManufacturer+" "+"Color= "+guitarColor+" ";
	    }
		public int getnumStrings() 
		{
			return numStrings;
		}
		public double getguitarLength()
		{
			return guitarLength;
		}
		public String getguitarManufacturer()
		{
			return guitarManufacturer;
		}
		public String getguitarColor()
		{
			return guitarColor;
		}
		public String playGuitar()
		{
			Random rand = new Random();
			char[] arrNote = {'A', 'B', 'C', 'D', 'E', 'F', 'G'};
			double[] arrNum = {.25, .5, 1, 2, 4};
			String play = "[";
			for (int i=0; i< 16; i++) {
			play = play.concat(arrNote[rand.nextInt(6)]+"("+arrNum[rand.nextInt(4)]+"),");
			}
			play=play.concat("]");
			return play;
			}
				
		}
