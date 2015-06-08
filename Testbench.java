import java.util.Scanner;
import java.math.BigInteger;

public class Testbench {
	public static void main(String[] args){
    	/* Read from stdin */
        Scanner scan = new Scanner(System.in);
        PalindromicNumberChecker pnc = new PalindromicNumberChecker();
        while (scan.hasNextLine()) {
        	String num = scan.nextLine();
        	long steps = pnc.getStepCount(num);
        	System.out.println(num + " gets palindromic after " + steps + " steps: " + pnc.getPalindromeNum().toString());
        }
	}
}