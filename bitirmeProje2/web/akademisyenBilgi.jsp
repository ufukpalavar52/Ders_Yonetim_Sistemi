<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.bitirmeProje.DAO.ConnectionDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css"/>
    <title>Yönetim Paneli || Akademisyen Planı</title>

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




<br/>




<div class="container">
    <div class="row">
        <div class="col-md-12">
             
                    <%
                    String saat[] = {"08:15/09:00","09:15/10:00","10:15/11:00","11:15/12:00","13:00/13:45","14:00/14:45","15:00/15:45","16:00/16:45"};
                    String donem = request.getParameter("donem");
                    String akademisyenNo = request.getParameter("akademisyenNo");
                    %>
                    
                     <%
                                      ConnectionDB connect = new ConnectionDB();
                                      Connection conn = connect.baglanti();
                                      ResultSet rs = null;
                                      Statement st = null;
                                      try {
                                      String sorgu = "Select akademisyenAd,akademisyenSoyad,akademisyenEposta,akademisyenIsTel,akademisyenCepTel ,donemAd,akademikYil from "+
                                      "akademisyen,donem,ders_has_akademisyan where akademisyenNo = '"+akademisyenNo+"' " +
                                       "and akademisyan_akademisyenNo = akademisyenNo and donem_donemId = '"+donem+"' "+
                                       "and donemId = donem_donemId";
                                      st = conn.createStatement();
                                      rs = st.executeQuery(sorgu);
                                      if (rs.next()) {
                                      %>
                                      <center>
                                      <h3 style="color: #2b669a;"><%=rs.getString("akademikYil")+"/"+rs.getString("donemAd")+"/"+rs.getString("akademisyenAd")+" "+rs.getString("akademisyenSoyad")%> </h3><br>
                                      </center>
                                     
                                      <center>
                                          <table class="table table-bordered table-striped table-condensed" style="width: 400px;">
                                              <tr>
                                                  <td style="height: 10px;"><center>Adı</center></td>
                                                  <td class="info" style="height: 10px;"><center><%=rs.getString("akademisyenAd")%></center></td>
                                              </tr>
                                              <tr>
                                                  <td><center>Soyadı</center></td>
                                                  <td class="info"><center><%=rs.getString("akademisyenSoyad")%></center></td>
                                              </tr>
                                              <tr>
                                                  <td><center>Email</center></td>
                                                  <td class="info"><center><%=rs.getString("akademisyenEposta")%></center></td>
                                              </tr>
                                              <tr>
                                                  <td><center>Cep Telefon</center></td>
                                                  <td class="info"><center><%=rs.getString("akademisyenCepTel")%></center></td>
                                              </tr>
                                              <tr>
                                                  <td><center>İş Telefonu</center></td>
                                                  <td class="info"><center><%=rs.getString("akademisyenIsTel")%></center></td>
                                              </tr>
                                              
                                          </table>
                                              
                                      </center>
                                               <%
                                      } 
                                      } catch(Exception ex) {
                                          out.println(ex);
                                      }
                     %>
                                              <br/><br/>
                                <table class="table table-hover table-bordered table-striped table-responsive ">
                    <tr>
                        
                      
                        <th><center>Verdiği Dersler</center></th>
                        <th><center>Teorik</center></th>
                        <th><center>Uygulama</center></th>
                        <th><center>Laboratuar</center></th>
                        <th><center>Kredi</center></th>
                        

                    </tr>
                    <%
                    
                        
           	        conn = connect.baglanti();
           	        rs = null;
           	        st = null;
                        String sql;
                        sql = "Select distinct dersId,dersAd, teorikDersSaati, pratikDersSaati, labDersSaati,dersKredi from ders,ders_has_akademisyan,dersprogrami "+
                              "where akademisyan_akademisyenNo='"+akademisyenNo+"' and akademisyenNo='"+akademisyenNo+"' and dersId = dersprogrami.ders_dersId "+
                               "and dersprogrami.donem_donemId = '"+donem+"' " ;
                        try {
           	        	st = conn.createStatement();
                                rs = st.executeQuery(sql);
           	            		
                                while(rs.next()){
           	            	
           	            
           	        
                    %>

                    <tr>
                        
                    
                    <td><center><%=rs.getString("dersId")+"-"+rs.getString("dersAd")%></center></td>

                    <td><center><%=rs.getString("teorikDersSaati")%></center></td>
                    <td><center><%=rs.getString("pratikDersSaati")%></center></td>
                    <td><center><%=rs.getString("labDersSaati")%></center></td>
                    <td><center><%=rs.getString("dersKredi")%></center></td>



                    </tr>
                    <%
           	            }
           	        } catch(Exception ex){
           	        	out.println(ex);
           	        }
                    %>
                </table><hr>              
                    
                   
                    



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
