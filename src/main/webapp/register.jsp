<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>register</title>
        <%@include file = "Component/common_css_js.jsp"%>
    </head>
    <body>
        <%@include file = "Component/navbar.jsp"%>
        <div class="container-fluid">
            <div class="row mt-5">
                <div class ="col-md-5" style="margin-left: 370px;">
                    <div class="card">
                        <%@include file="Component/message.jsp" %>
                        <div class="card-body px-4">

                            <div class="container text-center">
                                <img src="img/sign up.jpeg" class="img-fluid" alt="img not support" style="max-width: 120px;"/>
                            </div>
                            <h3 class="text-center my-2">Sign Up here</h3>
                            <form action="RegisterServlet"  method="post"onsubmit="return validate()" >
                                <div class="form-group">
                                    <label for="name">User Name</label>
                                    <input type="text" class="form-control" id="name"  placeholder="Enter here" name ="user_name"><p style="color:red; "id="err_name"></p>
                                </div>
                                <div class="form-group">

                                    <label for="email">User Email</label>
                                    <input type="email" class="form-control" id="email" placeholder="Enter here" name = "user_email"><p style="color:red; " id="err_mail"></p>
                                    <small id="emails" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="password">User Password</label>
                                    <input type="password" class="form-control" id="password"  placeholder="Enter here" name ="user_password"><p style="color:red;" id="err_pass"></p>
                                </div>
                                <div class="form-group">
                                    <label for="phone">User Phone</label>
                                    <input type="number" class="form-control" id="phone"  placeholder="Enter here" name ="user_phone"><p style="color:red;" id="err_phone"></p>
                                </div>
                                <div class="form-group">
                                    <label for="address">User Address</label>
                                    <textarea  style="height:150px"class="form-control" id="address"   placeholder="Enter here" name ="user_address"></textarea>
                                </div>
                                <div class="container">

                                    <input type="submit" class="btn btn-outline-success" value ="register">
                                    <input type="Reset" class="btn btn-outline-warning" value ="reset">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function validate() {
                reg_name = /^[a-zA-Z ]{3,}$/;
                reg_mail = /^[a-zA-Z0-9]+[@][a-zA-Z]+[.][a-zA-Z]+$/;
                reg_pass = /^[a-zA-Z0-9!@#$%^]{6,}$/;
                reg_phone = /^[0-9]{10}$/;
                var name = document.getElementById("name").value;
                var mail = document.getElementById("email").value;
                var phone = document.getElementById("phone").value;
                var pass = document.getElementById("password").value;
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
                if (!pass.match(reg_pass)) {
                    document.getElementById("err_pass").innerHTML = "*Password is not strong";
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
                document.getElementById("err_pass").innerHTML = "";
            }
       
       
        </script>
        
    </body>
</html>
