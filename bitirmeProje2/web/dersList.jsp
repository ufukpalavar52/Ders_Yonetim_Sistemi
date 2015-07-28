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
        
         <link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css">
             <link href="fooTablo/css/bootstrap.min.css" rel="stylesheet">
        <link href="fooTablo/css/footable.core.min.css" rel="stylesheet">
            <link href="fooTablo/css/footable.metro.min.css" rel="stylesheet">
                <link href="fooTablo/css/bootstrap-select.min.css" rel="stylesheet" type="text/css">

                    <script type ="text/javascript" src="fooTablo/js/jquery-2.1.1.min.js"></script>
                    <script type ="text/javascript" src="fooTablo/js/bootstrap.min.js"></script>
                    <script type ="text/javascript" src="fooTablo/js/footable.js"></script>
                    <script type ="text/javascript" src="fooTablo/js/footable.paginate.js"></script>
                    <script type="text/javascript" src="fooTablo/js/footable.sort.js"></script>


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
                  ConnectionDB connect = new ConnectionDB();
                  Connection conn = connect.baglanti();
                  ResultSet rs = null;
           	  Statement st = null;
                  String bolum_sorgu;
                  if (yetki.equals("1") || yetki.equals("2")) {
                      bolum_sorgu ="Select bolumAd from bolum where bolumId = '"+session.getAttribute("oturumBolum")+"'";
                      try {
           	        	
                            st = conn.createStatement();
           	            rs = st.executeQuery(bolum_sorgu);
                            if (rs.next()) { %>
                       <h2 style="color: #269abc;"><%=rs.getString("bolumAd")%> Bölümünün Dersleri </h2><br>         
                      <%      }
                            
                      } catch(Exception ex) {
                          out.println(ex);
                      }
                  } else {
                 
               %>
               <h2 style="color: #269abc;">Tüm Bölümün Dersleri </h2><br>
               <% }%>
                  <table class="footable table table-bordered toggle-circle" id="index">
                      <thead>
                    <tr>
                        <th>Sınıf</th>
                        <th>Ders Kodu</th>
                        <th>Ad</th>
                        <th>Teorik Ders</th>
                        <th>Pratik Ders</th>
                        <th>Lab Ders</th>
                        <th>Kredi</th>
                        <th>İslemler</th>

                    </tr>
                    </thead>
                    <tbody>
                    <%
                    
                    
           	        conn = connect.baglanti();
           	        rs = null;
           	        st= null;
                        String sql = "";
                        if (yetki.equals("1") || yetki.equals("2"))
           	            sql = "Select *from ders where bolum_bolumId='"+session.getAttribute("oturumBolum")+"';";
                        else
                            sql = "Select *from ders";
           	        try {
           	        	 st = conn.createStatement();
           	                 rs = st.executeQuery(sql);
           	            
           	            		
                                 while(rs.next()){
           	            	
           	            
           	        
                    %>
                    
                    <tr style="background-color: white ">
                        <td><%=rs.getInt("ders_Yil") %></td>
                        
                        <td><%=rs.getString("dersId") %></td>
                       
                        <td><%=rs.getString("dersAd") %></td>
                       
                        <td><%=rs.getInt("teorikDersSaati") %></td>
                       
                        <td><%=rs.getInt("pratikDersSaati") %></td>
                       
                        <td><%=rs.getInt("labDersSaati") %></td>
                       
                        <td><%=rs.getInt("dersKredi") %></td>
                        
                        <%
                           
                           String dersSil = "dersSil.jsp?id="+rs.getString("dersId");
                           String gnc = rs.getString("dersId");
                           
                        
                        %>
                        <th><a href ="<%=dersSil %>"><button  class="btn btn-danger btn bnt- glyphicon glyphicon-trash" type="submit"  style="width:50px;height:30px;" onclick="return window.confirm('Dersi silmek istiyormusunuz.')"></button></a>
                            <a href ="dersGunc.jsp?id=<%=gnc %>" class="btn btn-warning btn bnt- glyphicon glyphicon-pencil" type="submit" style="width:50px;height:30px;" ></a>
                        </th>



                    </tr>
                    
                    <%
                    }
                                 %>
                                 </tbody>
                                 
                                   <tfoot style="background-color: window">
                                        <center>
                                            <tr >
                                                <td colspan="10">
                                            <div class="pagination pagination-centered hide-if-no-paging"></div>
                                            </td>
                                            </tr>
                                        </center>
                                        </tfoot>
                                        
                                          <script type="text/javascript">
                            $('#index').footable();
                        </script>
                                 </table><hr>
                                 <%
           	        } catch(Exception ex){
           	        	out.println("Hata oluştu");
           	        }
                    %>
                    <% if (session.getAttribute("dersHataSonuc")!= null ) {
                           session.removeAttribute("dersHataSonuc");
                    %> 
                    <p style="color: #ac2925">Bu ders, ders programına eklidir. Bu dersi silemezsiniz.<br/><br/>
                    <%}%>

                <a href="dersEkle.jsp"> <button  class="btn btn-info" type="submit" value="Ders Ekle">Ders Ekle</button> </a>

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
   } 
   else 
       response.sendRedirect("akademisyenGirisi.jsp");
%>