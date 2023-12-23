
package com.learn.mycart.servlets;

import com.learn.mycart.FactoryProvider;
import com.learn.mycart.dao.CategoryDao;
import com.learn.mycart.dao.ProductDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import mycart.entities.Category;
import mycart.entities.Product;

/**
 *
 * @author sudha
 */
@WebServlet(name = "ProductOperationServlet", urlPatterns = {"/ProductOperationServlet"})
@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        try (PrintWriter out = response.getWriter()) {
        String operation= request.getParameter("operation");
        if(operation.trim().equals("addcategory")){
            int id = addCategory(request,response);
            HttpSession httpsession = request.getSession();
            httpsession.setAttribute("message", "Category added successgfully");
            httpsession.setAttribute("msgtype", "success");
            response.sendRedirect("admin.jsp");
            return ;
        }else if(operation.trim().equals("addproduct")){
            int id = addProduct(request,response); 
            
        }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public int addCategory(HttpServletRequest request, HttpServletResponse response){
            String title= request.getParameter("catTitle");
            String desc = request.getParameter("catDescription");   
            Category category = new Category(title,desc);
        // save category into database use in da0 class.
        CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory()); 
        
        
            int id = categoryDao.saveCategory(category);
            
            
        return id;
    }
    public int addProduct(HttpServletRequest request, HttpServletResponse response) throws IOException{
        String productName =request.getParameter("p_title");
        int productPrice = Integer.parseInt(request.getParameter("p_price"));
        int productDiscount = Integer.parseInt(request.getParameter("p_discount"));
        int productQuantity = Integer.parseInt(request.getParameter("p_Quantity")); 
        String productDescription = request.getParameter("p_description"); 
        
        if(request.getParameter("catId").equals("selection")){
            HttpSession session = request.getSession(); 
            session.setAttribute("message", "please select category");
            session.setAttribute("msgtype","warning");             
            response.sendRedirect("admin.jsp");
            return 0 ;
        }
        
   
        int category_id = Integer.parseInt(request.getParameter("catId"));
        Part product_img = null; 
        try{
         product_img = request.getPart("p_picture"); 
        }catch(Exception e){
            
            response.sendRedirect("login.jsp"); 
            
        }

        Product product = new Product(); 
        product.setpName(productName);
        product.setpDesc(productDescription);
        product.setpPrice(productPrice);
        product.setpQuantity(productQuantity);
        product.setpDiscount(productDiscount);
        product.setpPhoto(product_img.getSubmittedFileName());
                
        CategoryDao catdao = new CategoryDao(FactoryProvider.getFactory()); 
     
        Category  category = catdao.getCategoryById(category_id);
        product.setCategory(category);
        ProductDao prodao = new ProductDao(FactoryProvider.getFactory()); 


        
        // pic upload.....
        // find out rhe path ro upload photo .. 
          
 String path = request.getServletContext().getRealPath("img")+File.separator+"product" +File.separator+product_img.getSubmittedFileName();
 
 System.out.println(path); 
 try{       
        FileOutputStream fos = new FileOutputStream(path);       
        InputStream is = product_img.getInputStream();
        // reading the data ..
        byte[] array = new byte[is.available()];
        is.read(array); 
        fos.write(array);
        prodao.saveProduct(product);
        fos.close(); 
        is.close();
 }catch(IOException e){
         HttpSession session = request.getSession();
    session.setAttribute("message", "image does not support .product not added");
    session.setAttribute("msgtype","warning"); 
    response.sendRedirect("admin.jsp");
    return 0 ;
    
 }
    HttpSession session = request.getSession();
    session.setAttribute("message", "Product Added Successfully");
    session.setAttribute("msgtype","success"); 
    response.sendRedirect("admin.jsp");
        return 0;
        
    }
}
