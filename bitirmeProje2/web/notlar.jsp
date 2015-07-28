<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.bitirmeProje.DAO.ConnectionDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Dosya Listele</title>
    <link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css">
    <script src="dist/js/bootsrap.js" ></script>         
        <style>
            .gizli{
                display:none;
            }
        </style>
</head>
<%
    if (session.getAttribute("oturum") != null) {
%>
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
                    String yil = request.getParameter("yil");
                    String fakulte = request.getParameter("fakulte");
                    
                    String donemId = request.getParameter("akademikYil");
                    if(donemId == null) {
                        response.sendRedirect("yakinNotAra.jsp");
                    }
                    
                    
                    
        Statement stm = null;
        ResultSet rs = null;
        
        try{
            
        	ConnectionDB connect = new ConnectionDB();
   	        Connection conn = connect.baglanti();
                
                PreparedStatement st = conn.prepareStatement("select dersId,dersAd from ders,ders_has_akademisyan where bolum_bolumId='" + session.getAttribute("oturumBolum") + "' and ders_has_akademisyan.donem_donemId='" + donemId + "' and dersId = ders_dersId;");
                
                rs = st.executeQuery();
                
                
               
                
                
                %>
                
                
                <h2><%out.println( "Ders Dosyaları");%></h2>
                <table class="table table-hover">
                    <tr>
                        <th>Ders Kodu</th>
                        <th>Ders Adi</th>
                        <th></th>
                    </tr>
                    
                <%
                //}
                while(rs.next()){
                    String dersID = rs.getString("dersId");
                    String dersAd = rs.getString("dersAd");
                   
                    
                    %>
                    <tr>
                    
                        <td><h4><strong><%out.println(dersID);%></strong></h4></td>
                        <td><h4><strong><%out.println(dersAd);%></strong> </h4></td>
                        <td>
                        <form action="derslikler.jsp" method="POST">
                        <input type="text" name="dersAd" class="gizli" value="<% out.println(dersAd); %>">
                            <input type="text" name="dersID" class="gizli" value="<% out.println(dersID); %>">
                           &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <button type="submit" style="width:40px; height:35px;"  class="btn btn-primary glyphicon glyphicon-share-alt"></button>
                        </form>
                           
                        </td>
                    
                    </tr>
                    
                    
                    <%
                       
                        
                    
                }
                
                
                
                %>
                </table>
                
                
                <%
                
        }catch(Exception ex){
            out.println(ex.getMessage());
        }
                
                %>
    
            </div>
        </div>
    </div>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>

<%@include file="asagiMenu.jsp" %>

        
        
        
</body>
</html>
<%} else {
        response.sendRedirect("ogrenciGirisi.jsp");
    }%>