package ReadData;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

/*
 * File: ReadData.java
 * Author: Matt Rieser
 * Date: November 26, 2017
 * Purpose: This program reads
 * numbers from a file and displays them
 * to standard output.
 */
public class ReadData {
    public static void main(String[] args) {
        BufferedReader inputStream = null;

        String fileLine;
        try {
            inputStream = new BufferedReader(new FileReader("Numbers 1-10.txt"));

            System.out.println("Numbers:");
            // Read one Line using BufferedReader
            while ((fileLine = inputStream.readLine()) != null) {
                System.out.println(fileLine);
            }
            System.out.println("Numbers read were 1-10");
        } catch (IOException io) {
            System.out.println("File IO exception" + io.getMessage());
        }finally {
            // Need another catch for closing 
            // the streams          
            try {               
                if (inputStream != null) {
                inputStream.close();
            }                
            } catch (IOException io) {
                System.out.println("Issue closing the Files" + io.getMessage());
            }
        
        }
    }
}


