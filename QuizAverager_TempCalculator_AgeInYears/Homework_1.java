import java.io.IOException;
import java.io.BufferedReader;
import java.io.InputStreamReader;
public class Homework_1 {
/* Homework_1.java, Matt Rieser, 10/15/2017
 * The purpose of this program is to take the users inputs, calculate average of quiz scores,
 * and to convert Celsius to Fahrenheit plus including a degree symbol */
	public static void main(String[] args) throws IOException {
      // Variables that will hold the users inputs 
			int studentEMPLID = 0;
			double q1Score = 0.0;
			double q2Score = 0.0;
			double q3Score = 0.0;
			int ageMonths = 0;
			double tempCelsius = 0.0;
	  // Unicode for Celsius and Fahrenheit degree outputs
			char celSymbol = '\u00B0';
			char fahSymbol = '\u00B0';
	  // Define a InputStreamReader based on Standard Input (System.in)
		 InputStreamReader isReader = new InputStreamReader(System.in);
      // Send the InputStreamReader to a BufferedReader
		 BufferedReader stdin = new BufferedReader(isReader);
		  	System.out.print("Enter your Student EMPLID: ");
	  // The readLine() method reads everything entered
	  // However the Integer.parseInt() method converts
	  // the value to an int
		 studentEMPLID = Integer.parseInt(stdin.readLine());
	  // Prompt the user to enter an double
		  	System.out.print("Enter Quiz 1 Score: ");
	  // Read the line and convert to a double
		 q1Score = Double.parseDouble(stdin.readLine());
		  	System.out.print("Enter Quiz 2 Score: ");
	  // Read the line and convert to a double
		 q2Score = Double.parseDouble(stdin.readLine());
		  	System.out.print("Enter Quiz 3 Score: ");
	  // Read the line and convert to a double
		 q3Score = Double.parseDouble(stdin.readLine());
		  	System.out.print("Enter your age in months: ");
      // The readLine() method reads everything entered
	  // However the Integer.parseInt() method converts
	  // the value to an int
		 ageMonths = Integer.parseInt(stdin.readLine());
		  	System.out.print("Enter Temperature in Celsius: ");
	  // Read the line and convert to a double
		 tempCelsius = Double.parseDouble(stdin.readLine());
	  // Print outputs and calculations for all the user inputed data
		 	System.out.println("*********Results**********");
		 	System.out.println("Student EMPLID: " + studentEMPLID);
		 	System.out.println("Quiz 1 Score: " + q1Score);
		 	System.out.println("Quiz 2 Score: " + q2Score);
		 	System.out.println("Quiz 3 Score: " + q3Score);
		 	System.out.println("Quiz's Average: " + (q1Score+q2Score+q3Score)/3);
		 	System.out.println("Age in months: " + ageMonths);
		 	System.out.println("Age in years: " + ageMonths/12);
		 	System.out.println("Temperature in Celsius: " + tempCelsius+celSymbol);
			System.out.println("Temperature in Fahrenheit: " + ((tempCelsius*1.8)+32)+fahSymbol);
	}
}
