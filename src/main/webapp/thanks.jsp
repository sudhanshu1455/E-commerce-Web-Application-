<%-- 
    Document   : thanks
    Created on : 22-Jul-2023, 8:48:47 pm
    Author     : sudha
--%>



<!--// validations ...-->
<%@page import ="mycart.entities.User" %>
    <%
    User user = (User)session.getAttribute("current-user");
    if(user==null){
                session.setAttribute("message","Login Please"); 
                session.setAttribute("msgtype","warning");
                response.sendRedirect("login.jsp"); 
                return; 
    }
%>
    
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thank You for Your Purchase</title>
     <%@include file = "Component/common_css_js.jsp"%>
    <style>
        .short{
            font-family: Arial, sans-serif;
            line-height: 1.6;
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
        }
    </style>
</head>
<body>
    <%@include file = "Component/navbar.jsp"%> 
    
    
    <h2 class="short">Thank You for Your Purchase!</h2>
    <p class="short" >Thank you for buying from our company. We appreciate your business!</p>
    <div id="transactionDetails" class="short">
        <ul class="list-group list-group-flush" class="short">
            
  <li class="list-group-item"><h1>you will get order soon!!</h1></li>
  <li class="list-group-item"><%=user.getUserName()%></li>
  <li class="list-group-item"><%=user.getUserEmail()%></li>
  <li class="list-group-item"></li>
  <li class="list-group-item"><a href="index.jsp">Go To Home</a></li>

</ul>
    </div>
   
</body>
</html>
