<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@page import = "com.bitirmeProje.DAO.ConnectionDB" %>
<%@page import = "com.bitirmeProje.model.Ders" %>
<%

   String yetki = String.valueOf(session.getAttribute("yetki"));
   if(yetki != null)
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
    <title>Yönetim Paneli || Öğrenci Güncelleme</title>
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

    <br>
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
                
                         
                <h2 style="color: #269abc;">Öğrenci Güncelleme </h2> <hr/>
                  
                 <%String id = request.getParameter("id");%>   
                <form class="form-horizontal" action="ogrenciGunc?id=<%=id%>" method="post">
                    <% 
                            ConnectionDB connect = new ConnectionDB();
           	            Connection conn = connect.baglanti();
           	            ResultSet rs = null;
           	            Statement st = null;
                            String sql;
                           if (yetki.equals("1") || yetki.equals("2"))
                                sql = "Select *from ogrenci where ogrenciNo='"+id+"' and bolum_bolumId ='"+session.getAttribute("oturumBolum")+"';";
           	           else
                               sql = "Select *from ogrenci where ogrenciNo='"+id+"';";
           	            try {
           	        	st = conn.createStatement();
                                rs = st.executeQuery(sql);
           	                if(rs.next()){
           	            
           	            		
           	            
           	       %>
                    
                    
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">Öğrenci No</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="ogrenciNo" value="<%= rs.getString("ogrenciNo")%>" required autofocus/>
                        </div>   
                    </div>
                    
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">İsim</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="isim" value="<%= rs.getString("ogrenciAd")%>" required autofocus/>
                        </div>   
                    </div> 
                    
                    
                     <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">Soyisim</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="soyisim" value="<%= rs.getString("ogrenciSoyad")%>" required autofocus/>
                        </div>   
                    </div>
                    
                    
                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-5">
                            <input type="email" class="form-control" name="email" value="<%= rs.getString("ogrenciEposta")%>" required/>
                        </div>   
                    </div>  
            
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-5">
                            <button type="submit" class="btn btn-primary" onclick="return window.confirm('Güncellensin mi?')">Güncelle</button>&nbsp;&nbsp;
                            <button type="reset" class="btn btn-default">Temizle</button>
                        </div>   
                    </div>
                        <%} else {
                           
                       %>
                       <p style="color: #c12e2a"> Yetkisiz düzenleme
                       <% } }catch(Exception ex) {
                            out.println(ex);
                        }
                        %>
                </form>
                
            </div> 
        </div>
    </div> <br/><br/><br/><br/>

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
   } else 
       response.sendRedirect("akademisyenGirisi.jsp");
%>