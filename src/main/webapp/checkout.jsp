<%@page import ="mycart.entities.*" %>
<%
            User user = (User)session.getAttribute("current-user"); 
            if(user==null){
                session.removeAttribute("current-user");
                session.setAttribute("message","Login Please"); 
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
        <%@include file = "Component/common_css_js.jsp"%>
        <title>Checkout</title>
    </head>

    <body>
        <%@include file = "Component/navbar.jsp"%>

        <div class="container">
            <div class="row mt-5">

                <div class="col-md-6">
                    <div class="card">
                        <h5 class="text-center mt-2">your Selected item</h5>
                        <div class="cart-body">
                        <!--javascript se table aari h yha same class hone ki wzh se-->
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card">
                        <h5 class="text-center mt-2">your Selected item</h5>
                        <form  method="post"onsubmit="return validate()">
                            <div class="form-group">
                               <p style="color:red;" id="err_mail"></p>
                                <label for="your_email">Email address</label>
                                <input type="email" class="form-control" id="your_email" aria-describedby="emailHelp" placeholder="Enter email" value="<%=user.getUserEmail()%>" readonly name="email">
                                <small id="emailHelp" class="form-text text-muted" >We'll never share your email with anyone else.</small>
                            </div>

                            <div class="form-group">
                                <p style="color:red;" id="err_name"></p>
                                <label for="your_name">Your Name</label>
                                <input  required value="<%=user.getUserName()%>" type="text" class="form-control" id="your_name"  placeholder="Enter Name" name="name">



                            </div>

                            <div class="form-group">
                                <p style="color:red;" id="err_phone"></p>
                                <label for="your_Number">Your Number</label>
                                <input  required  type="number" class="form-control" id="your_Number"  placeholder="Enter Mobile Number" name="phone" value="<%=user.getUserPhone()%>">

                            </div>

                            <div class="form-group">
                                <label for="your_address">Your Address</label>
                                <textarea required value="<%=user.getUserAddress()%> "class="form-control" id="your_address" rows="3"  placeholder="Enter Address"></textarea>
                            </div>

                            </form>
                            <div class="container text-center">
                                <button class="btn btn-outline-success"  onclick="CreateOrderId()">Order Now</button>
                                
<!--                                
                                
                                
                            </div>
                        <!--</form>-->
                            <button class="btn btn-outline-success  mt-3 mb-3 ml-4 mr-4 "  onclick="goToIndex()" >Continue shopping </button>  
                    </div>
                </div>

            </div>
        </div>

        <%@include file = "Component/common_modals.jsp"%>
       
        
        <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
        <script>
            
            function validate() {
                reg_name = /^[a-zA-Z ]{3,}$/;
                reg_mail = /^[a-zA-Z0-9]+[@][a-zA-Z]+[.][a-zA-Z]+$/;
                reg_phone = /^[0-9]{10}$/;
                var name = document.getElementById("your_name").value;
                var mail = document.getElementById("your_email").value;
                var phone = document.getElementById("your_Number").value;
                
        
        reset();
                
                var flag = false;
                if (!name.match(reg_name)) {
                    document.getElementById("err_name").innerHTML = "*Name is not valid";
                    flag = true;
                }
                if (!mail.match(reg_mail)) {
                    document.getElementById("err_mail").innerHTML = "*Email not valid";
                    flag = true;
                }
                if (!phone.match(reg_phone)) {
                    document.getElementById("err_phone").innerHTML = "*Phone is not valid";
                    flag = true;
                }
                
                if (flag === false) {
                    return true;
                } else {
                    return false;
                }

            }
            function reset() {
                document.getElementById("err_name").innerHTML = "";
                document.getElementById("err_mail").innerHTML = "";
                document.getElementById("err_phone").innerHTML = "";
            }
            
            
             function goToIndex(){
                 console.log("chll "); 
    window.location="index.jsp"; 
}
        </script>
        
        
        
        
    </body>
</html>
