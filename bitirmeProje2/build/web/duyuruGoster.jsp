<%-- 
    Document   : duyuruGoster
    Created on : 07.May.2015, 00:08:38
    Author     : İlkin Azeri
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bitirmeProje.DAO.ConnectionDB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Duyuru</title>
</head>
<body>
    
      <br/>
                        <div class="container panel">
                            <div class="row">
                                <div class="col-md-12">
                                    <%@include file="menu.jsp" %>
                                </div>
                            </div>
                        </div>
<div class="container">
                            <div class="col-md-10">
                                
                                <h2>Duyuru</h2><hr>
    <%
        
        
        
        int duyuruId = Integer.parseInt(request.getParameter("duyuruId")); 
    
    
   
        Connection con = null;
        Statement stm = null;
        ResultSet rs = null;

        try {

        	ConnectionDB connect = new ConnectionDB();
   	        Connection conn = connect.baglanti();

            PreparedStatement st = conn.prepareStatement("SELECT * from duyuru where duyuruId='" + duyuruId + "'");
          

            rs = st.executeQuery();
            int sayac = 0;
            
            while(rs.next()){
            
           %>
           <div class="panel-group" id="accordion">
                                        <div style=";" class="col-md-12">
                                            <%if (sayac % 2 == 0) {%>
                                            <div class="panel panel-primary"> 
                                                <%} else {
                                                %>
                                                <div class="panel panel-info"> 
                                                    <%}
                                                    %>

                                                    <div class="panel-heading">
                                                        <h4 class="panel-title">
                                                            <a data-toggle="collapse" data-parent="#accordion" style="text-decoration: none;" href="#<%=sayac%>"><% out.println(rs.getString("duyuruId") + ". " + rs.getString("duyuruKonuBaslik"));%></a>
                                                        </h4>


                                                    </div>

                                                    <div id="<%=sayac%>" class="panel-collapse">
                                                        <div class="panel-body"><% out.println(rs.getString("duyuruMesaj")); %></div>
                                                    </div>
                                                </div>





                                            </div>
                                        </div>
           </div>
                                       
         
                                                    <%
            
            sayac = sayac + 1;
            }


    
        }catch(Exception ex){
            out.println(ex.getMessage());
        }
    
    %>
    
           </div>
                            </div><br/><br/>

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