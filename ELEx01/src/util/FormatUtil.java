package util;

import java.text.DecimalFormat;

public class FormatUtil {
	// number->pattern(,)
	public static String changeFormat(long number, String pattern) {
		DecimalFormat format = new DecimalFormat(pattern);
		
		return format.format(number);
	}
}
