
package com.learn.mycart.dao;
import java.util.*;
import mycart.entities.Product;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class ProductDao {
    private SessionFactory factory ;
    public ProductDao(SessionFactory factory){
        this.factory=factory;
    }
    public void saveProduct(Product product){
        try{
        Session session = this.factory.openSession(); 
        Transaction tr = session.beginTransaction(); 
        session.save(product) ; 
        tr.commit();
        session.close() ;
        }catch(Exception e ){
            e.printStackTrace();
        }
    }
    // get all product
    public List<Product> getAllProduct(){
        List<Product> list ; 
        
        Session session = this.factory.openSession();
        
        Query query =session.createQuery("from Product"); 
        
        list  = query.list();
                session.close(); 

        return list; 
        
        
    }
    
    // get product by id .. 
        public List<Product> getProductByCatId(int catId){
        List<Product> list ; 
        
        Session session = this.factory.openSession();
        
        Query query =session.createQuery("from Product as p where p.category.categoryId=:id"); 
        query.setParameter("id", catId);
        list  = query.list();
        session.close(); 

        return list; 
        
        
    }
}
