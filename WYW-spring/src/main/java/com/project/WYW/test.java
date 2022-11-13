package com.project.WYW;

import java.util.regex.Pattern;

public class test {

    public static void main(String[] args) {

//        String Regex = "[A-Za-z0-9]{4,16}";
        String Regex = "^((?=.*\\d)(?=.*[a-zA-Z])(?=.*[\\W]).{8,})$";
        boolean result = Pattern.matches(Regex, "dDdd1234@");

        System.out.println(result);
    }
}
