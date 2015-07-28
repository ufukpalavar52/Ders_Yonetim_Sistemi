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
    <title>Yönetim Paneli || Öğretim Üyesi Ekle</title>
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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>

<script language="javascript">  
$(document).ready(function() {   
    $('#username').blur(function() {  
        var field_value = $(this).val();  
  
        if (field_value != '')  
        {     
            $.ajax({  
                url: 'Akademisyenkontrol?uid=' + $(this).val(),  
                type: 'POST',  
                success: function(result) {  
                    $('#username_check').attr('innerHTML', result);  
                }  
            });  
        }  
    });  
});
</script>


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
                
                       
                <h2 style="color: #269abc;">Öğretim Üyesi Ekle </h2> <hr/>
                  
                    
                <form class="form-horizontal" action="./ogretimUyeEkle" method="POST">
                    
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
           	        sql = "Select bolumId, bolumAd from bolum where bolumId = '"+session.getAttribute("oturumBolum")+"' or bolumId = 11;";
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
                        <label for="name" class="col-sm-2 control-label">Akademisyen No</label>
                        <div class="col-sm-5">
                            <input id = "username"  type="text" maxlength="9" class="form-control" name="akademisyenNo" placeholder="Akademisyen No Girin"  required autofocus/> <div id="username_check"></div>
                        </div>   
                    </div>
                            <p style="color: #c12e2a"></p>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">İsim</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="isim" placeholder="İsim Girin" required autofocus/>
                        </div>   
                    </div> 
                    
                    
                     <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">Soyisim</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="soyisim" placeholder="Soyad Girin" required autofocus/>
                        </div>   
                    </div>
                    
                    
                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-5">
                            <input type="email" id="email" class="form-control" name="email" placeholder="Email Girin" required autofocus/><span class="error" id="emailError"></span>
                        </div>   
                    </div>  
                    
                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">İş Telefonu</label>
                        <div class="col-sm-5">
                            <input type="tel" class="form-control" name="isTelefon" placeholder="İş Telefonu Girin" required />
                        </div>   
                    </div> 
                    
                     <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">Cep Telefonu</label>
                        <div class="col-sm-5">
                            <input type="tel" class="form-control" name="cepTelefon" placeholder="Cep Telefonu Girin" required/>
                        </div>   
                    </div> 
                    
                    
                     <div class="form-group panel-body">
                        
                        <div class="col-sm-5">
                           
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;
                            
                            <strong>Bölüm Başkanı mı?</strong>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="checkbox" name="cevap1" value="evet"  >&nbsp;&nbsp;Evet&nbsp;&nbsp;&nbsp;&nbsp;
                            
                                
                        </div>
                         
                         
                    </div>
                            
                            <%if (yetki.equals("3")) {%>
                            <div class="form-group panel-body">
                        <div class="col-sm-5">
                           
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;
                            
                            <strong>Adminmi mı?</strong>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="checkbox" name="cevap2" value="evet" >&nbsp;&nbsp;Evet&nbsp;&nbsp;&nbsp;&nbsp;
                            
                            </div>    
                        </div> 
                         <%}%>
                            
                    
                    
                    
                    
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-5">
                            <button type="submit" class="btn btn-primary" onclick="return window.confirm('Ögretim üyesini eklemek istiyormusunuz.')">Kaydet</button>&nbsp;&nbsp;
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

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
    <script src="dist/js/bootstrap.min.js"></script>
    <script src="dist/js/jquery.min.js"></script>

</body>
</html>
<%} else {
       response.sendRedirect("index.jsp");
   } else 
       response.sendRedirect("akademisyenGirisi.jsp");
%>