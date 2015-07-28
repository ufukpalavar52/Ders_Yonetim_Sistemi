

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bitirmeProje.model.Akademisyen"%>
<%@page import="com.bitirmeProje.DAO.AkademisyenDAO"%>
<%@page import="com.bitirmeProje.DAO.ConnectionDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
    <link href="http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet"/>
    <script src="dist/js/bootsrap.js" ></script>
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
    <title>Öğretim Görevlileri</title>
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

<div class="container">
    <div class="row">
        <div class="col-md-12">

             <% 
                  ConnectionDB connect = new ConnectionDB();
                  Connection conn = connect.baglanti();
                  ResultSet rs = null;
           	  Statement st = null;
                  String bolumId=request.getParameter("bolum");
                  int donem  = Integer.valueOf(request.getParameter("donem"));
                  String bolum_sorgu;
                  
                  String sorgu = "Select bolumAd,donemAd,akademikYil from bolum, donem where bolumId = '"+bolumId+"' "+
                  "and donemId='"+donem+"'";
                      try {
           	        	
                            st = conn.createStatement();
           	            rs = st.executeQuery(sorgu);
                            if (rs.next()) { %>
                            <center> <h3 style="color:#2d6ca2 ;"><%=rs.getString("akademikYil")+"/"+rs.getString("donemAd")+"/"+rs.getString("bolumAd")%>  Akademisyen Planı</h3></center><br>         
                      <%      }
                            
                      } catch(Exception ex) {
                          out.println(ex);
                      }
                 
                 
               %>
            
                <!-- Default panel contents -->
               
                <!-- Table -->
                 <table class="table table-hover">
                    <tr>
                        <th><center>Fotoğraf</center></th>
                        <th><center>Adı</center></th>
                        <th><center>Soyadı</center></th>
                        <th><center>Bilgi</center></th>
                        <th><center>Ders Programı</center></th>
               </tr>
                        
            <%
                
                try {

                    //HttpSession session = request.getSession();
                    ArrayList<Akademisyen> akademik = new ArrayList();

                    

                    AkademisyenDAO akademisyen = new AkademisyenDAO();
                    akademik = akademisyen.AkademisyenList(bolumId,donem);

                    if (akademik != null) {
                        for (Akademisyen item : akademik) {
                             String akademisyenAd = item.getAkademisyenAd();
                             String akademisyenSoyad = item.getAkademisyenSoyad();
                             String akademiyenNo = item.getAkademisyenNo();
            %>
             
                    <tr>
                        <td><center><img src="img/business_man_blue.png" style="width:30px;height:30px;"/></center></td>
                        <td><center><%= akademisyenAd%></center></td>
                        <td><center><%= akademisyenSoyad%></center></td>
                    <td>
                    <center>
                            <form action="akademisyenBilgi.jsp" method="post">
                                <input type="text" value="<%=akademiyenNo%>" name="akademisyenNo" class="gizli"/>
                                <input type="text" value="<%=donem%>" name="donem" class="gizli"/>
                                <button class="btn btn-info btn bnt- glyphicon glyphicon-folder-open" type="submit" style="width:50px;height:30px;" ></button>
                            </form>
                    </center>
                    </td>
                        <td> <center>
                            <form action="akademisyenPlani.jsp" method="post">
                                <input type="text" value="<%=akademiyenNo%>" name="akademisyenNo" class="gizli"/>
                                <input type="text" value="<%=donem%>" name="donem" class="gizli"/>
                                <button class="btn btn-primary btn bnt- glyphicon glyphicon-list-alt" type="submit" style="width:50px;height:30px;" ></button>
                            </form>
                        </center>
                        </td>
                        
                    </tr>



               
            <%
                        }
                    } else {
                        //response.sendRedirect("ogretimPlani.jsp");
                        out.println("hata");
                    }
                } catch (Exception ex) {
                    out.println(ex);
                }


            %>
         </table>
         

        </div>
    </div>
</div>
<br/>

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
