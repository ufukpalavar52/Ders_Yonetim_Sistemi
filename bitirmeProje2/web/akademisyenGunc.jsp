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
    <title>Yönetim Paneli || Öğretim Üyesi Güncelle</title>
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
                
                         
                <h2 style="color: #269abc;">Öğretim Üyesi Guncelle </h2> <hr/>
                <%
                  String akademisyenNo = request.getParameter("id");
                  String bolumId = request.getParameter("id1");
                  String bolumAd = "";
                %>  
                    
                <form class="form-horizontal" action="./ogretimUyeGunc?id=<%=akademisyenNo %>" method="post">
                    
                    <div class="form-group">
                        <label for="fakulte" class="col-sm-2 control-label">Bölüm</label>
                        <div class="col-sm-5">
                        <% 
                            ConnectionDB connect = new ConnectionDB();
           	            Connection conn = connect.baglanti();
           	            ResultSet rs = null;
           	            Statement st = null;
           	            String sql = "Select  *from bolum Where bolumId = '"+bolumId+"' ;";
           	        try {
           	        	st = conn.createStatement();
           	                rs = st.executeQuery(sql);
                                
                                if (rs.next()) {
                                    bolumAd = rs.getString("bolumAd");
                                }
                        } catch(Exception ex) {
                             out.println(ex);
                        }
           	           conn = connect.baglanti();
                           rs = null;
                           st = null;
                           sql = "Select  *from bolum Where bolumId != '"+bolumId+"';";
           	           try { 		
                                st = conn.createStatement();
           	                rs = st.executeQuery(sql);
                            %>
                            <select class="form-control" name="bolum" >
                             <option value="<%=bolumId%>"><%=bolumAd %></option>  
                        <% while(rs.next()){ %>      
                                <option value="<%=rs.getString("bolumId")%>"> <%=rs.getString("bolumAd") %></option>
                                
                        <% } %>        
                            </select>
                            <%
           	                   } catch(Exception ex) {
              	                     out.println(ex);
                               }
                            %>
                        </div>   
                    </div>
                     <%
                           conn = connect.baglanti();
                           rs = null;
                           st = null;
                           sql = "Select  *from akademisyen where akademisyenNo = '"+akademisyenNo+"';";
                           try {  		
                                st = conn.createStatement();
           	                rs = st.executeQuery(sql);    
                                
                                if (rs.next()) {
                     %>   
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">Akademisyen No</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="akademisyenNo" value="<%=akademisyenNo %> " required autofocus/>
                        </div>   
                    </div>
                    
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">İsim</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="isim" value="<%=rs.getString("akademisyenAd") %>" required autofocus/>
                        </div>   
                    </div> 
                    
                    
                     <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">Soyisim</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="soyisim" value="<%=rs.getString("akademisyenSoyad") %>" required autofocus/>
                        </div>   
                    </div>
                    
                    
                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-5">
                            <input type="email" class="form-control" name="email" value="<%=rs.getString("akademisyenEposta") %>" required autofocus/>
                        </div>   
                    </div>  
                    
                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">İş Telefonu</label>
                        <div class="col-sm-5">
                            <input type="tel" class="form-control" name="isTelefon" value="<%=rs.getString("akademisyenIsTel") %>" required />
                        </div>   
                    </div> 
                    
                     <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">Cep Telefonu</label>
                        <div class="col-sm-5">
                            <input type="tel" class="form-control" name="cepTelefon" value="<%=rs.getString("akademisyenCepTel") %>" required/>
                        </div>   
                    </div> 
                    <%
                                }
                           } catch (Exception ex) {
                               out.println(ex);
                           }
                    %>
                    
                     <div class="form-group panel-body">
                        
                        <div class="col-sm-5">
                           
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;
                            <strong>Bölüm Başkanı mı?</strong>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="cevap1" value="evet">&nbsp;&nbsp;Evet&nbsp;&nbsp;&nbsp;&nbsp;
                               
                        </div>   
                    </div>
                    
                    
                    
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-5">
                            <button type="submit" class="btn btn-primary" onclick="return window.confirm('Ögretim üyesinin bilgilerini güncellensin mi')">Güncelle</button>&nbsp;&nbsp;
                            <button type="reset" class="btn btn-default">Varsayılan</button>
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
   } else 
       response.sendRedirect("akademisyenGirisi.jsp");
%>