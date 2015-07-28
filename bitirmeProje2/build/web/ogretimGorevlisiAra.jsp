
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
        .gizli{
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

            <center><h3 style="color:#2d6ca2 ;">Öğretim Üyesi Bilgileri</h3></center>
            <br><br>
                          
                <table class="table table-hover">
                    <tr>
                        <th><center>Adı</center></th>
                        <th><center>Soyadı</center></th>
                        <th><center>Bölümü</center></th>
                        <th><center>Bilgi</center></th>
                        <th><center>Ders Programı</center></th>
                    </tr>
                    <%
                        try {

                            //HttpSession session = request.getSession();
                            ArrayList<Akademisyen> akademik = new ArrayList();

                            String akademisyenAd = request.getParameter("ogretimUyeAdi");
                            int donem = Integer.valueOf(request.getParameter("donem"));
                            AkademisyenDAO akademisyen = new AkademisyenDAO();
                            akademik = akademisyen.AkademisyenAra(akademisyenAd);

                            if (akademik != null) {
                                for (Akademisyen item : akademik) {
                                    akademisyenAd = item.getAkademisyenAd();
                                    String akademisyenSoyad = item.getAkademisyenSoyad();
                                    String bolum = item.getBolumAd();
                                    String akademisyenNo = item.getAkademisyenNo();
                    %>

                    <tr>
                        <td><center><%= akademisyenAd%></center></td>
                        <td><center><%= akademisyenSoyad%></center></td>
                        <td><center><%= bolum%></center></td>
                        
                        <td>
                    <center>
                            <form action="akademisyenBilgi.jsp" method="post">
                                <input type="text" value="<%=akademisyenNo%>" name="akademisyenNo" class="gizli"/>
                                <input type="text" value="<%=donem%>" name="donem" class="gizli"/>
                                <button class="btn btn-info btn bnt- glyphicon glyphicon-folder-open" type="submit" style="width:50px;height:30px;" ></button>
                            </form>
                    </center>
                    </td>
                        <td> <center>
                            <form action="akademisyenPlani.jsp" method="post">
                                <input type="text" value="<%=akademisyenNo%>" name="akademisyenNo" class="gizli"/>
                                <input type="text" value="<%=donem%>" name="donem" class="gizli"/>
                                <button class="btn btn-primary btn bnt- glyphicon glyphicon-list-alt" type="submit" style="width:50px;height:30px;" ></button>
                            </form>
                        </center>
                        </td>
                    </tr>





                    <%
                                }
                            } else {
                                response.sendRedirect("ogretimPlani.jsp");
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
