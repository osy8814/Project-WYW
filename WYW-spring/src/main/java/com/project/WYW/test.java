package com.project.WYW;

import java.util.regex.Pattern;

public class test {

    public static void main(String[] args) {
        String userId ="adsflkajlkfdmin";
        StringBuffer stringBuffer = new StringBuffer(userId);
        for (int i = 2; i <userId.length()-2 ; i++) {
            stringBuffer.replace(i,i+1,"*");
        }
        System.out.println("stringBuffer = " + stringBuffer);
        
    }
}
