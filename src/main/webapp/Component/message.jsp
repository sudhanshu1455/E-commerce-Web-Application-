<%
    String message = (String)session.getAttribute("message"); 
    String msgtype = (String)session.getAttribute("msgtype"); // for warning or success...
    if(message!=null&&msgtype!=null){
    %>
      
    <div class="alert alert-<%= msgtype%> alert-dismissible fade show" role="alert">
        <a href="navbar.jsp"></a>
  <strong><%= message%></strong> 
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
    <%        
        session.removeAttribute("message");
        session.removeAttribute("msgtype");
        
    }  
%>