package util;

import java.util.Random;

public class SoNgauNhien {
	public static String getSoNgauNhien( ) {
		Random rd = new Random();
		String s1 = rd.nextInt(10) +"";
		String s2 = rd.nextInt(10) +"";
		String s3 = rd.nextInt(10) +"";
		String s4 = rd.nextInt(10) +"";
		String s5 = rd.nextInt(10) +"";
		String s6 = rd.nextInt(10) +"";
		String s7 = rd.nextInt(10) +"";
		String s8 = rd.nextInt(10) +"";
		String s9 = rd.nextInt(10) +"";

		String s = s1 + s2 + s3 + s4 + s5 + s6 + s7 + s8 + s9;
		return s;
	}
}
