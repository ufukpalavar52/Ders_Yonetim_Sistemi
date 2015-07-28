
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import = "com.bitirmeProje.DAO.ConnectionDB" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Dosya Arama</title>
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

        
        <style>  .gizli{
            display: none;
            
        }
        
        </style>
</head>
<body>
    <br/>
        <div class="container panel">
            <div class="row">
                <div class="col-md-12">
                  <%@include file="yakinMenu.jsp" %>
                </div>
            </div>
        </div>
    <br/>
     <br/>
    
  <div class="container">
        <div class="row">
            <div class="col-md-9">
    
        <%
        request.setCharacterEncoding("utf-8");
        String dersAd = (String) request.getParameter("notAra");
        
        
        Statement stm = null;
        ResultSet rs = null;
        
        try{
            
                ConnectionDB connect = new ConnectionDB();
                Connection conn = connect.baglanti();
                
                PreparedStatement st = conn.prepareStatement("SELECT * from dosya Where  dosyaAd like '%"+dersAd+"%';");
                
                
                rs = st.executeQuery();
                
                %>
                <h1><%out.println(dersAd + " anahtari geçen ders dökümanları");%></h1>
                <table class="footable table table-bordered toggle-circle" id="index">
                    <thead>
                    <tr>
                        <th></th>
                        <th>Dosya Adı</th>
                        
                        
                        <th>Açıklama</th>
                        
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                <%
                while(rs.next()){
                   %>
                   
                   <%
                    String pdfAd = rs.getString("dosyaAd");
                    String pdf = rs.getString("dosyaYolu");
                    String dosyaTipi = rs.getString("dosyaTipi");
                    String notAciklama = rs.getString("dosyaHakkindaAciklama");
                    
                    %>
                    <tr style="background-color: white ">
                        <td><% if(dosyaTipi.equals(".pdf")){ %>
                        <img src="resim/pdf-icon.png" style="width:40px;height:40px;">
                            <%}else if(dosyaTipi.equals(".rar") || dosyaTipi.equals(".zip")){ %>
                            <img src="resim/rar.jpg" style="width:40px;height:40px;">
                                <%} else if(dosyaTipi.equals(".docx")){%>
                                
                                <img src="resim/wordResmi.jpg" style="width:40px;height:40px;">
                               <%}else{%>
                               <img src="resim/blgsyrFile.jpg" style="width:40px;height:40px;">
                               <%}%>
                        </td>
                        <td><%out.println(pdfAd);%></td>
                        
                        <td><%out.println(notAciklama);%></td>
                        
                        <td>
                            <form action="goruntule.jsp" method="POST" class="form-horizontal" >
                                <input type="hidden"   name="pdfAd" value="<% out.println(pdfAd); %>">
                                <input type="text"  class="gizli" name="pdf" value="<% out.println(pdf); %>">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <button type="submit" style="width:37px; height:35px;"  class="btn btn-danger glyphicon glyphicon-download-alt"></button>
                            </form>
                            
                        </td>
                   
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
                
        }catch(Exception ex){
            
            out.println(ex.getMessage());
        }
                %>
                
            </div>
        </div>
     </div>
    
    
    
    <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>

<%@include file="asagiMenu.jsp" %>

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="dist/js/bootstrap.min.js"></script>
</body>
</html>
