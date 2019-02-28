
import java.security.MessageDigest;
import java.math.BigInteger;
import java.security.NoSuchAlgorithmException;
import java.util.Scanner;

public class UseofHashFix
{

    public static void main(String[] args) throws NoSuchAlgorithmException
    {
        //variables and intialization
        String uname = "user1";
        String pword; //password123
        String salt  = "0521382097";
        String saltedSHA256Pwordhash = 
                "21db2bd09deeee7591b462db51d57f4267276323c993a7ab4035e6b5c48c7df6";
        Scanner input = new Scanner(System.in);
        
        //Get user password
        System.out.println("Enter "+uname+"'s Password: ");
        pword = input.next();
        
        System.out.println("*****************************");
        //check for valid password
        if (saltedSHA256Pwordhash.equals(hashFunc(salt+pword)))
        {
            System.out.println("Welcome "+uname+"!");
        }
        else
        {
            System.out.println("Incorrect Password!");
        }
    }
    //Convert string to hash
    public static String hashFunc(String str) throws NoSuchAlgorithmException
    {
        String hash;
        if (str == null) {
            return null;
        }
        
            MessageDigest m = MessageDigest.getInstance("SHA-256");
        m.update(str.getBytes(), 0, str.length());
        hash = new BigInteger(1, m.digest()).toString(16);
        
        return hash;
    }
}
