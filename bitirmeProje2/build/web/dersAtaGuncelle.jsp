
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@page import = "com.bitirmeProje.DAO.ConnectionDB" %>
<%@page import = "com.bitirmeProje.model.Ders" %>
<%
   String yetki = String.valueOf(session.getAttribute("yetki"));
    if(yetki != null)
        if (yetki.equals("1") || yetki.equals("2") || yetki.equals("3")) {
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Yönetim Paneli || Ders Ataması Güncelle</title>
    <link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css"/>
    <style>
        .largeIcon{
            font-size: 50px;
            padding-left: 35px;
            padding-right: 35px;
        }

        a:hover{
            text-decoration: none;
        }
        .gizli {
            display: none;
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


            <h2>Ders  Güncelleme</h2> <hr/>
             <%String akademisyenNo = request.getParameter("id"); 
               
               
               String dersId = request.getParameter("id1");;
             %>
             
             

            <form class="form-horizontal" action="./dersAtaGunc?id=<%=dersId%>" method="post">
              <%
                      ConnectionDB connect = new ConnectionDB();
    	              Connection conn = connect.baglanti();
    	              ResultSet rs = null;
    	              Statement st = null;
                      String ad = "";
                      String soyad = "";
                      String dersad = "";
                      String donemId = "";
    	              String sql="CALL sp_AkademisyenDers ('"+akademisyenNo+"', '"+dersId+"')";
    	              try {
                          st = conn.createStatement();
       	                  rs = st.executeQuery(sql);
       	                  if (rs.next()){
                              ad = rs.getString("akademisyenAd");
                              soyad = rs.getString("akademisyenSoyad");
                              dersad = rs.getString("dersAd");
                              donemId = rs.getString("ders_has_akademisyan.donem_donemId");
                          }
                         
                      } catch(Exception ex) {
                          out.println(ex);
                      }
       	            
       	            
       	            		
       	            
             
             %>
                  
             <input type="text" value="<%=donemId%>" name="donemId" class="gizli"/>
                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">Öğretim Üyesi</label>
                   
                    <div class="col-sm-5">
                        <select class="form-control" name="ogretimUyesi">
                        <option value="<%=akademisyenNo%>"><%out.println(ad+" "+soyad);%></option>
                             
                        </select>
                        
                    </div>   
                </div>
                
                <%
                      
    	              conn = connect.baglanti(); 
    	              rs = null;
    	              st = null;
                      if (yetki.equals("1") || yetki.equals("2"))
                          sql = "Select *from ders where dersId!='"+dersId+"' and bolum_bolumId='"+session.getAttribute("oturumBolum")+"';";
                      else
                          sql = "Select *from ders where dersId!='"+dersId+"'";
    	        try {
       	        	st = conn.createStatement();
       	                rs = st.executeQuery(sql);
       	            
       	            
       	            		
       	            
             
                %>
                                 
                <div class="form-group">  
                    <label for="name" class="col-sm-2 control-label">Verebileceği Dersler</label>
                    <div class="col-sm-5">
                        <select class="form-control" name="bolumders">
                            <option value="<%=dersId%>"><%=dersad %></option>
                            <% while(rs.next()){ %>
                            <option value="<%=rs.getString("dersId")%>"><%=rs.getString("dersAd") %></option>
                            <% }%>
                        </select>
                    </div>
                </div><%if (session.getAttribute("dersProgramiKontrol")!= null){%>
                <p style="color:  #c12e2a">Bu ders,  Ders Programına eklenmiş bulunuyor.</p> 
                <%
                    session.removeAttribute("dersProgramiKontrol");
                }%>
                <% 
                } catch(Exception ex){
                	out.println(ex);
                }
                %>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-5">
                        <button type="submit" class="btn btn-primary"  onclick="return window.confirm('Güncellemek İstiyormusunuz?')">Güncelle</button>&nbsp;&nbsp;
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