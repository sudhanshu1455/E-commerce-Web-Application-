
package com.learn.mycart;

/**
 *
 * @author sudha
 */
public class Calculation {
    public static int getDiscountedPrice(int price , int discount){
        double val = price*discount; 
        double dis = val/100.0;
        double disc = (double)price-dis; 
        return (int)disc;
        
        
        
        
    }
}
