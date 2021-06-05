package com.nt.utility;

public class Utility {

	public static String get10words(String decs) {
	System.err.println("Utility.get10words()");
		String[] str = decs.split("  ");
		String res ="";
		if (str.length > 10) {
			for(int i=0;i<10;i++) {
				res = res+str[i]+" ";
				}
			return res;		
		} else {
			return decs + "...";
		}
	}
}
