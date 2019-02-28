import java.security.MessageDigest;
import java.math.BigInteger;
import java.security.NoSuchAlgorithmException;
import java.util.Scanner;

public class UseofHash
{

    public static void main(String[] args) throws NoSuchAlgorithmException
    {
        //variables and intialization
        String uname = "user1";
        String pword; //password123
        String unsaltedMD5PwordHash = "482c811da5d5b4bc6d497ffa98491e38";
        Scanner input = new Scanner(System.in);

        //Get user password
        System.out.println("Enter "+uname+"'s Password: ");
        pword = input.next();

        System.out.println("*****************************");
        //check for valid password
        if (unsaltedMD5PwordHash.equals(hashFunc(pword)))
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

            MessageDigest m = MessageDigest.getInstance("MD5");
        m.update(str.getBytes(), 0, str.length());
        hash = new BigInteger(1, m.digest()).toString(16);

        return hash;
    }

}
