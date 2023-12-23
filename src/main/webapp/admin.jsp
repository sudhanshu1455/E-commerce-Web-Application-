<%@page import ="com.learn.mycart.dao.CategoryDao"%>
<%@page import ="mycart.entities.*" %>
<%@page import ="com.learn.mycart.FactoryProvider"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.*"%>
<%@page import="java.util.Map"%>


<%
            User user = (User)session.getAttribute("current-user"); 
            if(user==null){
                session.removeAttribute("current-user");
                session.setAttribute("message","Login Please"); 
                session.setAttribute("msgtype","warning");
                response.sendRedirect("login.jsp"); 
                return; 
    }else if(user.getUserType().equals("normal")){
                session.removeAttribute("current-user");
                session.setAttribute("message","invalid user"); 
                session.setAttribute("msgtype","warning");
                response.sendRedirect("login.jsp"); 
                return;
                }
%>

<%
                              CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                              List<Category> list = cdao.getCategories();
                              
//getting count...
Map<String,Long> map = GetCount.getCount();

                            %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file = "Component/common_css_js.jsp"%>
    </head>
    <body>
        <%@include file = "Component/navbar.jsp"%>

        <div class ="container">
            <div class="container admin">
                <div class="container-fluid mt-3">
                    <%@include  file="Component/message.jsp"%>
                </div>
                <!--first row-->
                <div class ="row mt-3">
                    <!--first col-->
                    <div class="col-md-4">
                        <!--first box-->
                        <div class="card">
                            <div class="card-body  text-center">
                                <div class="container">
                                    <img src="img/users.png" alt="no. of users." style="max-width: 100px;" class = "rounded-circle"/>
                                </div>
                                <h2><%=map.get("user")%></h2>
                                <h2 class="text-muted text-uppercase">user</h2>
                            </div>
                        </div>
                    </div>
                    <!--second col-->
                    <div class="col-md-4">
                        <!--second box-->
                        <div class="card">
                            <div class="card-body  text-center">
                                <div class="container">
                                    <img src="img/no. of category.png" alt="no. of category." style="max-width: 100px;" class = "rounded-circle"/>
                                </div>
                                <h2><%=list.size()%></h2>
                                <h2 class="text-muted text-uppercase">categories</h2>
                            </div>
                        </div>
                    </div>
                    <!--third col-->
                    <div class="col-md-4">
                        <!--third box-->
                        <div class="card">
                            <div class="card-body  text-center">
                                <div class="container">
                                    <img src="img/products.png" alt="no. of category." style="max-width: 100px;" class = "rounded-circle"/>
                                </div>
                                <h2><%=map.get("product")%></h2>
                                <h2 class="text-muted text-uppercase">products</h2>
                            </div>
                        </div>
                    </div>

                    <!--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
                </div>
                <!--second row--> 
                <div class ="row mt-4" >
                    <!--first column-->
                    <div class="col-md-6">
                        <!--first box-->
                        <div class="card" data-toggle="modal" data-target="#add-category-modal">
                            <div class="card-body  text-center">
                                <div class="container">
                                    <img src="img/add category.png" alt="add category" style="max-width: 100px;" class = "rounded-circle"/>
                                </div>
                                <p class ="mt-2">click here to add any category<p>
                                <h2 class="text-muted text-uppercase">ADD CAtegory</h2>
                            </div>
                        </div>
                    </div>
                    <!--second column-->
                    <div class="col-md-6">
                        <!--second box-->
                        <div class="card" data-toggle="modal" data-target="#add-product-modal" >
                            <div class="card-body  text-center">
                                <div class="container">
                                    <img src="img/add-item.png" alt="add products." style="max-width: 100px;" class = "rounded-circle"/>
                                </div>
                                <p class ="mt-2">click here to add any product<p>           
                                <h2 class="text-muted text-uppercase">add product</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--add category model--> 
        <!--we use model here to fill the form--> 
        <!-- Button trigger modal -->
        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-backgroundColor text-white" >
                        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method ="post" >
                            <!--this is bootstrap form--> 
                            <div class="form-group">
                                <!--this hidden field used for ProductOperationServlet for help the which is the request from-->
                                <input type="hidden" name ="operation" value="addcategory">
                                <input type="text" class="form-control" name ="catTitle" placeholder="Enter Category Title" required="true">
                            </div>
                            <div class="form-group">
                                <textarea class="form-control" name ="catDescription" placeholder="Enter Category Desc." required="true"></textarea>
                            </div>
                            <div class="modal-footer">
                                <div class="container text-center">
                                    <input type="submit"  class="btn btn-outline-success" value="Add Category">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--end add category model-->
        <!--add product model-->
        
        
        
        
        
        
        
        
        
        
        
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-backgroundColor text-white" >
                        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form action="ProductOperationServlet" method ="post" id="myform" enctype="multipart/form-data" >
                            <!--this is bootstrap form--> 
                            <div class="form-group">
                                <!--this hidden field used for ProductOperationServlet for help the which is the request from-->
                                <input type="hidden" name ="operation" value="addproduct">
                            </div>
                            <div class="form-group" >
                                <input type="text"   class="form-control" name="p_title" placeholder="Enter Product Name" required="true"> 
                            </div>
                            <div class="form-group">
                                <input type="number" id ="pprice" class="form-control" name="p_price" placeholder="Enter Product Price" required="true"> 
                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control" name="p_discount" placeholder="Enter Maximum Discount" required="true">
                            </div>
                            
                            <div class="form-group">
                                <input type="number" class="form-control" name="p_Quantity" placeholder="Enter Product Quantity" required="true">
                            </div>

                            <!--product category-->
                            
                            <div class="form-group">
                                <select name="catId" class="form-control" id ="">
                                    <option value="selection">Select Category</option>
                                    <%
                                    for(Category c :list){
                                    %>
                                    <option value="<%= c.getCategoryId()%>" > <%= c.getCategoryTitle()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                <textarea style="height: 100px;" name="p_description" required="true" class="form-control" placeholder ="Enter Product description"></textarea>
                            </div>
                            <!--product file-->
                            <div class="form-group">
                                <label for="picture" style="font-size: 15px">Upload product pic </label>
                                <br>
                                <input type="file" id="picture" required="false" name="p_picture">
                            </div>
                            <div class="modal-footer text-white" >
                                <div class="container text-center">
                                    <input type="submit" value="Add Product" class="btn btn-outline-success">
                                    <button type="button" class="btn btn-outline-secondary" data-dismiss="modal" onclick="reset()">Close</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--end of add product model--> 
        <!--reset the form-->
        <script>
            function reset() {
                
        text.remove(); 
                
                var form = document.getElementById("myform").reset();
        
            }
        </script>
        
        
         <%@include file="Component/common_modals.jsp" %>
    </body>
</html>
