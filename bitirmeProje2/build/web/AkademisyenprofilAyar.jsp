<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@page import = "com.bitirmeProje.DAO.ConnectionDB" %>
<%@page import = "com.bitirmeProje.model.Ders" %>
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


        

       <br/><br/><br/>
       
       
        <div class="container">
        <div class="row">
            <div class="col-md-12">
                
                         
                
                  
                 <%
                   String oturumNo = (String)session.getAttribute("oturumNo");
                   
                   ConnectionDB connect = new ConnectionDB();
           	   Connection conn = connect.baglanti();
                 if(oturumNo!=null){ 
                 %>
                 
                 <h2 style="color: #269abc;">Akademisyen Profil Ayarları</h2> <hr/>
                <form class="form-horizontal" action="akademisyenGuncProfil" method="post">
                    <% 
                     
                            ResultSet rs = null;
           	            Statement st = null;
                            
           	            String sql = "Select *from akademisyen where akademisyenNo='"+oturumNo+"';";
           	           
           	            try {
                                String hata = "";
           	        	st = conn.createStatement();
                                rs = st.executeQuery(sql);
           	                if(rs.next()){
           	                     
                                    if(session.getAttribute("hata") != null)
                                    {
                                        hata="Hatalı şifre girdiniz.";
                                        session.removeAttribute("hata");
                                    }
           	       %>
                    
                    
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">Akademisyen No</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="akademisyenNo" value="<%= rs.getString("akademisyenNo")%>" readonly/>
                        </div>   
                    </div>
                    
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">İsim</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="isim" value="<%= rs.getString("akademisyenAd")%>" readonly/>
                        </div>   
                    </div> 
                    
                    
                     <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">Soyisim</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="soyisim" value="<%= rs.getString("akademisyenSoyad")%>" readonly/>
                        </div>   
                    </div>
                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-5">
                            <input type="email" class="form-control" name="email" value="<%= rs.getString("akademisyenEposta")%>" required/>
                        </div>   
                    </div>
                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">Cep Telefon</label>
                        <div class="col-sm-5">
                            <input type="tel" class="form-control" name="ceptel" value="<%= rs.getString("akademisyenCepTel")%>" required/>
                        </div>   
                    </div>
                        <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">İş Telefon</label>
                        <div class="col-sm-5">
                            <input type="tel" class="form-control" name="istel" value="<%= rs.getString("akademisyenIsTel")%>" required/>
                        </div>   
                    </div>
                        
                        
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">Yeni Şifre</label>
                        <div class="col-sm-5">
                            <input type="password" class="form-control" name="sifre1" placeholder="Sifreyi güncellemek istiyorsanız yeni şifreyi giriniz."/>
                        </div>   
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">Şifre*</label>
                        <div class="col-sm-5">
                            <input type="password" class="form-control" name="sifre" placeholder="Mevcut şifrenizi giriniz." required autofocuds/><p style="color:  #c12e2a"><%= hata%></p>
                        </div>   
                    </div>
                    
                    
                      
            
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-5">
                            <button type="submit" class="btn btn-primary" onclick="return window.confirm('Güncellensin Mi?')">Kaydet</button>&nbsp;&nbsp;
                            <button type="reset" class="btn btn-default">Temizle</button>
                        </div>   
                    </div>
                        <%} }catch(Exception ex) {
                            out.println(ex);
                        }
                        %>
                </form>
                <%} else{
                     response.sendRedirect("akademisyenGirisi.jsp");
                     
                 }%>
               
                  
                  
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
