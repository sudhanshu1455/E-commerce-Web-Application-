package com.learn.mycart;
public class TextCutter {   
    public static String get65char(String str){
        String val ="..." ; 
        if(str.length()<=65){
            return str; 
        }else{
         val = str.substring(0,65)+val; 
        return val;     
        }
        
    }
    public static String get50char(String str){
        String val ="..." ; 
        if(str.length()<=50){
            return str; 
        }else{
         val = str.substring(0,50)+val; 
        return val;     
        }
        
    }
}
