<%@page import ="mycart.entities.User" %>
<%
    User user1 = (User)session.getAttribute("current-user");
    
%>
<nav class="navbar navbar-expand-lg navbar-dark  custom-backgroundColor">
    <div class ="container">
        <a class="navbar-brand" href="index.jsp">MyCart</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp">Home<span class="sr-only">(current)</span></a>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Categories
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">Category</a>
                        <a class="dropdown-item" href="#">Profile</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                </li>

                <li>
                    
            </li>
            </ul>
            <li class="navbar-nav mlauto">
            
                <a href="#" style="color:white; margin-right:7px;  "  data-toggle="modal" data-target="#cart"><img src="img/shopping-cart.png" alt="alt" style="height:20px; width:20px; padding:1px; "/><span  class="mr-2 cart-item" style="font-size: 13px ; color:black ; " >(0)</span></a>
            
            
            </li>

            <%
                if(user1!=null){ 
            %>
            <ul class="navbar-nav mlauto">
                <li><a class="nav-link" href="<%=user1.getUserType().equals("admin")?"admin.jsp":"normal.jsp"%>"> <%= user1.getUserName()%><span class="sr-only">(current)</span></a></li>
                <li><a class="nav-link" href="LogoutServlet">Logout<span class="sr-only">(current)</span></a></li>               </ul>

            <%
                }else{
            %>

            <ul class="navbar-nav mlauto">
                
                <li><a class="nav-link" href="login.jsp">Login<span class="sr-only">(current)</span></a></li>
                <li><a class="nav-link" href="register.jsp">register<span class="sr-only">(current)</span></a></li>
            </ul>

            <%
          }
            %>



        </div>

    </div>
</nav>