<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.bitirmeProje.model.Ders"%>
<%@page import="com.bitirmeProje.model.Akademisyen"%>
<%@page import="com.bitirmeProje.DAO.AkademisyenDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@page import = "com.bitirmeProje.DAO.ConnectionDB" %>
<%@page import = "java.sql.*" %>
<%@page import = "com.bitirmeProje.DAO.ConnectionDB" %>
<% if (session.getAttribute("oturum") != null) {%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Dosya Ara</title>
    <link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css">
</head>
<body>
    <br/>
        <div class="container panel">
            <div class="row">
                <div class="col-md-12">
                  <%@include file="yakinMenu.jsp" %>
                </div>
            </div>
        </div>
    <br/>
     <br/>
     
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                  <% 
                    
                    
        Statement stm = null;
        ResultSet rs = null;
        
        try{
            
        	ConnectionDB connect = new ConnectionDB();
   	        Connection conn = connect.baglanti();
                PreparedStatement st = conn.prepareStatement("select * from donem");
                
                
                rs = st.executeQuery();
                
                
               
                
                
                %>
                                 
                 
                
                <h2>Dosya Listele</h2> <hr/>
                <form class="form-horizontal" action="notlar.jsp" method="POST">
                    <div class="form-group">
                        <label for="year" class="col-sm-2 control-label">Dönem</label>
                        <div class="col-sm-6">
                            <select  name="akademikYil"  class="form-control" >
                                <%
                while(rs.next()){
                    String donemAd = rs.getString("donemAd");
                    String akademikYil = rs.getString("akademikYil");
                    int  donemId = rs.getInt("donemId");
                
                %>
                                <option value="<%=donemId %>"><% out.println(akademikYil + "/" + donemAd ); %></option>
                                <%}%>
                            </select>
                        </div>   
                    </div> 
                        <%
                
        }catch(Exception ex){
            out.println(ex.getMessage());
        }
                
                %>
                     
                    
                     
                    
                    <div class="col-sm-8">
                            <button type="submit" class="btn btn-primary" style="float:right;" >Listele</button>
                    </div>       
                </form>       
            </div>
        </div>
    </div>
        
<br><br><br><br><br><br><br><br>
<div class="container panel">
            <div class="row">
                <hr>
                <div class="col-md-12">
                    
                   <%@include file="asagiMenu.jsp" %>
                </div>
            </div>
 </div>

   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="dist/js/bootstrap.min.js"></script>
    <script src="dist/js/jquery.min.js"></script>
                            
                            
                     
</body>
</html>
<%} else {
    response.sendRedirect("index.jsp");
}%>

