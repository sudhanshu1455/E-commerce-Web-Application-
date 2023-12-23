package com.learn.mycart;
//
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.Transaction;
public class FactoryProvider {
private static SessionFactory sessionFactory;


    public static SessionFactory getFactory() {
       
        try{  
                Configuration config=new Configuration();
            config.configure();
             sessionFactory=config.buildSessionFactory();
                
            
        }catch(Exception e ){
            e.printStackTrace();
        }
       return sessionFactory; 
    }
}
