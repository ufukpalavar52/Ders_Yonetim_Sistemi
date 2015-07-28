

<%@page import="com.bitirmeProje.DAO.DersDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@page import = "com.bitirmeProje.DAO.ConnectionDB" %>
<%
   String yetki = String.valueOf(session.getAttribute("yetki"));
    if(yetki != null)
        if (yetki.equals("1") || yetki.equals("2") || yetki.equals("3")) {
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css">
        <title>Yönetim Paneli || Dersleri Listele</title>

        <style>
            .largeIcon{
                font-size: 50px;
                padding-left: 35px;
                padding-right: 35px;
            }

            a:hover{
                text-decoration: none;
            }
        </style>
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


    <%@include file="adminIslem.jsp" %>

    <br/><br/><br/>




    <div class="container">
        <div class="row">
            <div class="col-md-12">

                <%
                String id = request.getParameter("id");
                DersDAO ders = new DersDAO();
                int dersKontrol = ders.DersProgramiAkademisyenKontrol(id);
                if(dersKontrol == 0) { 
                PreparedStatement st = null;
                
                 try{
           	     ConnectionDB connect = new ConnectionDB();
           	     Connection conn = connect.baglanti();
           	     String sql = "Delete from akademisyen where akademisyenNo = ?"; 
           	     st = (PreparedStatement) conn.prepareStatement(sql);
           	     st.setString(1,id);
           	     st.executeUpdate();
           	     response.sendRedirect("ogreteList.jsp"); 
                }catch(Exception ex){
                	out.println(ex);
                	
                }
                }
                else if(dersKontrol == 1) {
                    response.sendRedirect("akademisyenHata.jsp");
                }
                else
                    response.sendRedirect("hata.jsp");
                
                %>

            </div>
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
<% } else { 
       response.sendRedirect("index.jsp");
   } else 
       response.sendRedirect("akademisyenGirisi.jsp");
%>