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
        <title>Yönetim Paneli || Ders Ekle</title>
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


                <h2>Ders  Ekle </h2> <hr/>


                <form class="form-horizontal" action="./dersEkleme" method="post">
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
                        <label for="name" class="col-sm-2 control-label">Sınıf</label>
                        <div class="col-sm-5">
                            <select class="form-control" name="sinif">
                                <option value="1">1.Sınıf</option>
                                <option value="2">2.Sınıf</option>
                                <option value="3">3.Sınıf</option>
                                <option value="4">4.Sınıf</option>
                                
                            </select>
                        </div>   
                    </div> 


                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">Kodu</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="kod" placeholder="Dersin Kodunu Girin" required autofocus/>
                        </div>   
                    </div>

                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">Ad</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="dersAd" placeholder="Dersin Adını Girin" required autofocus/>
                        </div>   
                    </div>  

                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">Teorik Ders</label>
                        <div class="col-sm-5">
                            <input type="number" min="0" class="form-control" name="teorikDers" placeholder="Teorik Ders Saatini Girin" required autofocus/>
                        </div>   
                    </div> 

                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">Pratik Ders</label>
                        <div class="col-sm-5">
                            <input type="number" min="0" class="form-control" name="pratikDers" placeholder="Pratik Ders Saatini Girin" required autofocus/>
                        </div>   
                    </div> 

                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">Lab Ders</label>
                        <div class="col-sm-5">
                            <input type="number" min="0" class="form-control" name="labDers" placeholder="Lab. Ders Saatini Girin" required autofocus/>
                        </div>   
                    </div> 

                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">Kredi</label>
                        <div class="col-sm-5">
                            <input type="number" min="0" class="form-control" name="dersKredi" placeholder="Dersin Kredisini Girin" required autofocus/>
                        </div>   
                    </div> 
                   <div class="form-group panel-body">
                        
                        <div class="col-sm-5">
                           
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;
                            
                            <strong>Seçmelimi mı?</strong>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="checkbox" name="cevap1" value="evet" >&nbsp;&nbsp;Evet&nbsp;&nbsp;&nbsp;&nbsp;
                            
                                
                        </div>
                         
                         
                    </div>




                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-5">
                            <button type="submit" class="btn btn-primary">Kaydet</button>&nbsp;&nbsp;
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
<%} else {
    response.sendRedirect("index.jsp");
   } else 
       response.sendRedirect("akademisyenGirisi.jsp");
%>
    