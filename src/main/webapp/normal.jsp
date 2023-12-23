<%-- 
    Document   : normal
    Created on : 10-Jul-2023, 11:09:31 pm
    Author     : sudha
--%>
<%@page import ="mycart.entities.User" %>
<%
    User user = (User)session.getAttribute("current-user");
    if(user==null){
                session.setAttribute("message","Login Please"); 
                session.setAttribute("msgtype","warning");
                response.sendRedirect("login.jsp"); 
                return; 
    }else if(user.getUserType().equals("admin")){
                session.removeAttribute("current-user");
                session.setAttribute("message","invalid user"); 
                session.setAttribute("msgtype","warning");
                response.sendRedirect("login.jsp"); 
                return;
                }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Normal Page</title>
        <%@include file = "Component/common_css_js.jsp"%>
        
        
        <style>
            span{
                font-size: 20px; 
                font-weight:  600; 
                margin-left: 7px;
                color: #11324D ; 
            }           
            #container {
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 20px;}
#content {
  flex: 0 0 120px;
  color: black; 
}
            </style>
    </head>
    <body style="background: #9BABB8;">
        <%@include file = "Component/navbar.jsp"%>
        <%@include file="Component/common_modals.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <div class="container-fluid">
                        <div style="border: 2px solid white; background: white; border-radius: 8px" class="mt-5" >
                            <div style="display: inline-block" class="mt-1 mb-1">
                                <img src="img/users.png" width="60px" height="60px" class="rounded-circle ml-1" alt="user" />
                            </div>
                            <div  class="text-center" style="display: inline-block" >
                                <h4 ><%=user.getUserName().trim()%></h4>
                            </div>
                        </div>
                    </div>
                    <div class="mt-4  row">
                        <div  id="container" class="container"nclass="col=4">                  
                            <ul class="list-group">
                                <li class="list-group-item"><a id ="content" href="myorder.jsp">My Orders</a></li>
                                <li class="list-group-item"><a id ="content" href="#!">Payment</a></li>
                                <li class="list-group-item"><a id ="content" href="#">Manage Address</a></li>
                                
                                <li class="list-group-item"><a id ="content" href="LogoutServlet">Log Out</a></li>
                        </ul>
                        </div>
                    </div>                            
                </div>                            
                <div class="col-md-9 mt-5">                    
                    <h2>Your Details : </h2>                    
                    <div class="row mt-5">                        
                        <div class="col=8 container">
                            <ul class="list-group">                               
                                <li class="list-group-item">Name :<span><%=user.getUserName().trim()%></span> </li>
                                <li class="list-group-item">Mobile No :<span><%=user.getUserPhone()%></span>  </li>
                                <li class="list-group-item">E-Mail :<span><%=user.getUserEmail().trim()%></span> </li>
                                <li class="list-group-item">Address :<span><%=user.getUserAddress().trim()%></span>  </li>
                                <li class="list-group-item">Your Gender : <span><input type="radio" value="male" id="male" name="gen"><lable class="ml-2" for="male">Male</lable>    <input type="radio" value="female" id="female" name="gen"><lable  class="ml-2"   for="female">Female</lable></span></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>