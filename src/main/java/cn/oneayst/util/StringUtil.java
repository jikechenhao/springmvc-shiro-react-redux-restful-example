package cn.oneayst.util;

import java.util.regex.Pattern;

public class StringUtil {
    private static final Pattern numericPattern = Pattern.compile("[0-9]+");

    public static boolean isNumeric(final String str) {
        return numericPattern.matcher(str).matches();
    }

    public static boolean isNullOrEmpty(String str) {
        return null == str || 0 == str.trim().length();
    }
}
