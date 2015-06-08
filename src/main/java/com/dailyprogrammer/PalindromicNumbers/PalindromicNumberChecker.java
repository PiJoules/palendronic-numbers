package com.dailyprogrammer.PalindromicNumbers;

import java.math.BigInteger;
import java.util.Scanner;

public class PalindromicNumberChecker {
	private BigInteger num;

    /**
     * Retrieve the number of steps required to make a palendrom of the number
     * @param  n string
     * @return   BigInt
     */
    public long getStepCount(String n){
    	BigInteger num = new BigInteger(n);
    	BigInteger revNum = reverseNum(num);
    	long steps = 0;

    	while (!num.equals(revNum)){
    		num = num.add(revNum);
    		revNum = reverseNum(num);
    		steps++;
    	}

    	this.num = num;
    	return steps;
    }

    /**
     * Get the flipped value of the number
     * @param  num BigInt
     * @return     BigInt
     */
    private static BigInteger reverseNum(BigInteger num) {
        String reverseStr = new StringBuilder(num.toString()).reverse().toString();
        return new BigInteger(reverseStr);
    }

    /**
     * Getter for the final palindrome number
     * @return NigInt
     */
    public BigInteger getPalindromeNum(){
    	return this.num;
    }
}