package com.learn.mycart.dao;

import java.util.List;
import mycart.entities.Category;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class CategoryDao {
    private SessionFactory factory ;
    public CategoryDao(SessionFactory factory){
        this.factory=factory;
    }
    
    
    public int saveCategory(Category cat){
        int cat_id = 0;  
        try{
        Session session = this.factory.openSession();
        Transaction tx = session.beginTransaction();
        cat_id = (int)session.save(cat); 
        
        tx.commit();
        session.close();

    }catch(Exception e){
        e.printStackTrace();
    }
                return cat_id; 
    }
    
    
    // get list of categories...
    public List<Category> getCategories(){
        Session s = this.factory.openSession(); 
        Query query = s.createQuery("from Category"); 
        List<Category> list = query.list(); 
        return list; 
        
    }
    public Category getCategoryById(int id){
        Category cat = null ;
        try{
            Session s = this.factory.openSession();
            cat = s.get(Category.class, id); 
            s.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return cat; 
        
    }
    
    // getallcategoriess.
    public List<Category> getAllCategories(){
        Session session = this.factory.openSession(); 
        Query query = session.createQuery("from Category"); 
        List<Category> list = query.list(); 
        
        return list;
    }
}
