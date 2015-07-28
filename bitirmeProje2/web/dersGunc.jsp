<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@page import = "com.bitirmeProje.DAO.ConnectionDB" %>
<%@page import = "com.bitirmeProje.model.Ders" %>
<%
   String yetki = String.valueOf(session.getAttribute("yetki"));
   if (yetki.equals("1") || yetki.equals("2") || yetki.equals("3")) {
    
%>
<%
request.setCharacterEncoding("ISO-8859-9");
response.setCharacterEncoding("ISO-8859-9");
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
     <%
     
     String str = request.getParameter("id");
     
     
     
   %>
  

    <br/><br/><br/>

  
   
   


    <div class="container">
        <div class="row">
            <div class="col-md-12">
            <%
                    
                    ConnectionDB connect = new ConnectionDB();
           	        Connection conn = connect.baglanti();
           	        ResultSet rs = null;
           	        Statement st = null;
                        String sql = "";
                        if (yetki.equals("1") || yetki.equals("2"))
                            sql = "Select *from ders where dersId='"+str+"' and bolum_bolumId ='"+session.getAttribute("oturumBolum")+"';";
           	        else
                            sql = "Select *from ders where dersId='"+str+"';";
                        try {
           	        	st = conn.createStatement();
                                rs = st.executeQuery(sql);
           	            
           	        
                    %>

                <form class="form-horizontal" action="./dersGuncelle" method="post">

                 <%if(rs.next()){ %>

                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">Sınıf</label>
                        <div class="col-sm-5">
                            <input type="number" min="1" max="4" class="form-control" name="sinif" Value="<%=rs.getString("ders_Yil") %>" required autofocus/>
                        </div>   
                    </div> 


                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">Kodu</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="kod" Value="<%=rs.getString("dersId") %>"  readonly/>
                        </div>   
                    </div>

                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">Ad</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="dersAd" Value="<%=rs.getString("dersAd") %>" required autofocus/>
                        </div>   
                    </div>  

                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">Teorik Ders</label>
                        <div class="col-sm-5">
                            <input type="number" min="0" class="form-control" name="teorikDers"Value="<%=rs.getString("teorikDersSaati")%>" required autofocus/>
                        </div>   
                    </div> 

                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">Pratik Ders</label>
                        <div class="col-sm-5">
                            <input type="number" min="0" class="form-control" name="pratikDers" Value="<%=rs.getString("pratikDersSaati") %>" required autofocus/>
                        </div>   
                    </div> 

                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">Lab Ders</label>
                        <div class="col-sm-5">
                            <input type="number" min="0" class="form-control" name="labDers" Value="<%=rs.getString("labDersSaati") %>" required autofocus/>
                        </div>   
                    </div> 

                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">Kredi</label>
                        <div class="col-sm-5">
                            <input type="number" min="0" class="form-control" name="dersKredi" Value="<%=rs.getString("dersKredi") %>" required autofocus/>
                        </div>   
                    </div> 

                 <% } }catch(Exception ex){
                	       out.println(ex);
                 }
                 
                 
                 %>



                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-5">
                            <button type="submit" class="btn btn-primary" onclick="return window.confirm('Ders bilgilerini güncellmek istiyormusun?')">Güncelle</button>&nbsp;&nbsp;
                            <button type="reset" class="btn btn-default">Temizle</button>
                        </div>   
                    </div> 
                </form>
                

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
<%} else {
       response.sendRedirect("index.jsp");
   }%>