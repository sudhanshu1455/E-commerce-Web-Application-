<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <%@include file = "Component/common_css_js.jsp"%>
        <style>
    body {
      font-family: Arial, sans-serif;
    }

    .c {
      max-width: 400px;
      margin: 0 auto;
      padding: 20px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }

    .c h2 {
      text-align: center;
    }

    .c input[type="email"],
    .c input[type="password"] {
      width: 100%;
      padding: 12px;
      margin: 8px 0;
      border: 1px solid #ccc;
      box-sizing: border-box;
      border-radius: 4px;
    }

    .c .submit-btn {
      width: 100%;
      background-color: #068FFF;
      color: white;
      padding: 14px 20px;
      margin: 8px 0;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }

    .c .submit-btn:hover {
      background-color: #4E4FEB;
    }

    .c .forget-password {
      text-align: right;
      margin-top: 10px;
    }
  </style>
    </head>
    <body>
        <div>
          <%@include file = "Component/navbar.jsp"%>
          </div>
         
          <div class="c mt-5">
    <h2>Login</h2>
    <%@include file = "Component/message.jsp"%>
    <form action="LoginServlet" method="post" >
      <input type="email" name="email" placeholder="Email" required id="email">
      <input type="password" name="password" placeholder="Password" required id="password">
      <input type="submit" class="submit-btn" value="Login">
      <a href="register.jsp">Register Now !</a>
      <div class="forget-password">
        <a href="#">Forgot password?</a>
      </div>
    </form>
  </div>
    </body>
</html>
