
package com.learn.mycart.servlets;

import com.learn.mycart.FactoryProvider;
import com.learn.mycart.dao.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mycart.entities.User;

/**
 *
 * @author sudha
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String email = request.getParameter("email");
            String password =  request.getParameter("password");
            UserDao dao = new UserDao(FactoryProvider.getFactory());
            User user = dao.getUserByEmailAndPassword(email, password);
            HttpSession session = request.getSession();
            if(user==null){     
                session.setAttribute("message", "Wrong Email Or Password");
                session.setAttribute("msgtype", "warning");                
                response.sendRedirect("login.jsp");
            }else{
                String userType = user.getUserType();
                session.setAttribute("current-user",user);
                if(userType.equals("admin")){
                    response.sendRedirect("admin.jsp");
                }else if(userType.equals("normal")){
                    response.sendRedirect("normal.jsp");
                }else{
                    response.sendRedirect("component/error.jsp");
                }
            }
            return ;
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
}
