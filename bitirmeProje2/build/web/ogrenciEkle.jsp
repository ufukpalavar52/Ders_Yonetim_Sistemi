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
    <title>Yönetim Paneli || Öğrenci Ekle</title>
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
                
                         
                <h2 style="color: #269abc;">Öğrenci Ekle </h2> <hr/>
                  
                    
                <form class="form-horizontal" action="ogrenciEkle" method="post">
                    
                    <div class="form-group">
                        <label for="fakulte" class="col-sm-2 control-label">Bölüm</label>
                        <div class="col-sm-5">
                        <% 
                        ConnectionDB connect = new ConnectionDB();
           	        Connection conn = connect.baglanti();
           	        ResultSet rs = null;
           	        Statement st = null;
                        String sql="";
                        if (yetki.equals("1") || yetki.equals("2")) {
           	        sql = "Select bolumId, bolumAd from bolum where bolumId = '"+session.getAttribute("oturumBolum")+"'";
                        }
                        else {
                             sql =  "Select bolumId, bolumAd from bolum";
                        }
           	            try {
           	        	st = conn.createStatement();
           	            rs = st.executeQuery(sql);
           	            
           	            int i = 0;
           	            		
           	            
           	            %>
                            <select class="form-control" name="bolum" >
                        <% while(rs.next()){ %>      
                                <option value="<%=rs.getString("bolumId")%>"> <%=rs.getString("bolumAd") %></option>
                                
                        <% }} catch(Exception ex) {
                        	   out.println(ex);
                        }
                        
                        %>        
                            </select >
                        </div>   
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">Öğrenci No</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="ogrenciNo" placeholder="Öğrenci No Girin" required autofocus/>
                        </div>   
                    </div>
                    
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">İsim</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="isim" placeholder="İsim Girin" required autofocus/>
                        </div>   
                    </div> 
                    
                    
                     <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">Soyisim</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="soyisim" placeholder="Soyisim Girin" required autofocus/>
                        </div>   
                    </div>
                    
                    
                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-5">
                            <input type="email" class="form-control" name="email" placeholder="Email Girin" required/>
                        </div>   
                    </div>  
            
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-5">
                            <button type="submit" class="btn btn-primary" onclick="return window.confirm('Öğrenci Eklensin mi')">Ekle</button>&nbsp;&nbsp;
                            <button type="reset" class="btn btn-default">Temizle</button>
                        </div>   
                    </div> 
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
<% } else {
       response.sendRedirect("index.jsp");
   }
   else
       response.sendRedirect("akademisyenGirisi.jsp");
                            
%>