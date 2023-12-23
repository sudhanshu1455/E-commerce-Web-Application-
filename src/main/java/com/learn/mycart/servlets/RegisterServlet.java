
package com.learn.mycart.servlets;

import java.io.IOException;
import mycart.entities.User; 
import java.io.PrintWriter;
import com.learn.mycart.FactoryProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.Iterator;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

@WebServlet(name = "/RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try{
                String name = request.getParameter("user_name");
                String password = request.getParameter("user_password"); 
                String email = request.getParameter("user_email"); 
                String phone = request.getParameter("user_phone"); 
                String address = request.getParameter("user_address");
                
                User user = new User(name,email,password,phone,"default.jpg",address,"normal"); 
                
                SessionFactory factory = FactoryProvider.getFactory(); 
                Session session  = factory.openSession();

                try{
                    Transaction tx = session.beginTransaction();
                    int userId = (int)session.save(user);
                    tx.commit();
                }catch(Exception e){
                    // for email duplicate entry ...
                    redirectPageAndMessage(request,session,response,"warning","email already register");
                    return; 
                }
                session.close();
                
                redirectPageAndMessage(request,session,response,"success" , "successfully register");                
            }catch(HibernateException e){
                e.printStackTrace();
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
    public void redirectPageAndMessage(HttpServletRequest request , Session session,HttpServletResponse response ,String msgtype,String message ){
                    HttpSession httpsession = request.getSession();
                    httpsession.setAttribute("message",message) ; 
                    httpsession.setAttribute("msgtype",msgtype); 
                    session.close();
                    try{
                        response.sendRedirect("register.jsp");
                    }catch(IOException e ){
                        e.printStackTrace();
                    }
                    return;
    }
}
