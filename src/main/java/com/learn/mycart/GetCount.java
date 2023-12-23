
package com.learn.mycart;

import java.util.HashMap;
import java.util.Map;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class GetCount {
    public static Map<String,Long> getCount(){
        SessionFactory factory = FactoryProvider.getFactory(); 
        Session session = factory.openSession();
        String q1 = "select count(*) from User"; 
        String q2 = "select count(*) from Product"; 
        Query query1 = session.createQuery(q1) ;
        Query query2 = session.createQuery(q2) ;

        Long userCount = (Long)query1.list().get(0); 
        Long produtCount = (Long)query2.list().get(0);
        
        Map<String,Long> map = new HashMap<>(); 
        map.put("user",userCount); 
        map.put("product", produtCount); 
        
        
        
        session.close(); 
        
        
        return map; 
    }
}
