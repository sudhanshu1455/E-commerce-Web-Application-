<%@page import="com.learn.mycart.*"%>
<%@page import="com.learn.mycart.dao.*"%>
<%@page import="mycart.entities.*"%>
<%@page import="java.util.*"%>
<%@page import="com.learn.mycart.servlets.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>myCart-Home</title>

        <%@include file = "Component/common_css_js.jsp"%>
    </head>
    <body>
        <%@include file = "Component/navbar.jsp"%>
        <%  
            if(FactoryProvider.getFactory()==null){
                response.sendRedirect("component/error.jsp");
                return ;
                
            }else{
        %>
        
        
        <div class="container-fluid">
        <div class="row">
            <%
                
                List<Product> productList = null; 
                ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
                String category = request.getParameter("category"); 
                if(category==null||category.trim().equals("-1")){
                      productList = pdao.getAllProduct();
                }else{
                    int catId = Integer.parseInt(category.trim()); 
                    productList = pdao.getProductByCatId(catId); 
                }
               CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());                                            List<Category> categoryList = cdao.getAllCategories();
            %>
            <!--// show categories-->
            <div class="col-md-2">
                <div class="list-group mt-4 ml-2" >

                    <a href="index.jsp?category=-1" class="list-group-item list-group-item-action active">All Categories</a>  
                    

                    <%
                    
                    for(Category c : categoryList ){
                    %>
                    <a href="index.jsp?category=<%=c.getCategoryId()%>" class="list-group-item list-group-item-action"> <%=c.getCategoryTitle()%> </a>
                    <%
                   }

                    %>
                </div>
            </div>

            <!--show product-->
            <div class="col-md-10">
                <div class="row mt-4">
                    <div class="col-md-12">
                        <div class="card-columns">
                            <!--traversing product-->
                            <%

                            if(productList.size()==0){
                                out.println("<h3 style='color:red;'>no product available !!!</h3>"); 
                            }
                            for(Product p : productList){ 

                            %>
                            <div class="card style-card-product">
                                <div class="text-center mt-1">
                                    <img  class="card-img-top img-fluid sizingproductimage" src="img/product/<%=p.getpPhoto()%>" alt="Card image cap">
                                </div>
                                <div class="card-body">
                                    <h6 class="card-title"><%=TextCutter.get50char(p.getpName())%></h6>
                                    <P class="card-text">
                                        <%= TextCutter.get65char(p.getpDesc())%>
                                    </P>
                                </div>
                                <div class="card-footer text-center ">
                                    
                                   
                                    
                                    <button class="btn custom-backgroundColor text-white" onclick="add_to_cart(<%=p.getpId()%>,'<%=p.getpName()%>',<%=Calculation.getDiscountedPrice(p.getpPrice(),p.getpDiscount())%>)">Add to Cart</button>
                                                                        
                                    <button  class="btn btn-outline-primary" style=" width:90px;max-height:35px;">&#8377;<%= Calculation.getDiscountedPrice(p.getpPrice(),p.getpDiscount())%> </button>
                                    <div style="display: inline-block;">
                                    <span style="font-size:15px; text-decoration: line-through; color: #878787;"><%=p.getpPrice()%></span>
                                    <p style="font-size: 13px; font-weight: bold; margin-top: 1px; color: green; "><%=p.getpDiscount()%>% off</p>
                                    </div>
                            </div>
                            </div>
                            <%
                                  }
                            %>
                            
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <%
            }
        %>
 
        
        </div>
        
        
        <%@include file="Component/common_modals.jsp" %>
        
       
            
    </body>
</html>
