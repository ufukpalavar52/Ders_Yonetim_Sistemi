<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import = "java.sql.*" %>
<%@page import = "com.bitirmeProje.DAO.ConnectionDB" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="dist/style.css" />

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



                        <title>Duyrular</title>

                        <style>
                            a:link {text-decoration: none;}
                            a:visited {text-decoration: none;}
                            a:hover {text-decoration: none;}
                            a:active {text-decoration: none;}

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

                        <!--Slider-->
                        <div class="container">
                            <div class="col-md-10">

                                <h2>Tum Duyurular</h2><br>
                                <%
                                    Statement stm = null;
                                    ResultSet rs = null;

                                    try {
                                        ConnectionDB connect = new ConnectionDB();
                                        Connection conn = connect.baglanti();
                                        PreparedStatement st = conn.prepareStatement("SELECT * from duyuru order by duyuruId desc");
                                        int saygac = 1;

                                        rs = st.executeQuery();
                                        int sayac = 0;
                                %>


                                <table class="footable table table-bordered toggle-circle" id="index">
                                    <tbody>
                                        <% while (rs.next()) {%>
                                  
                                        <tr style="background-color: white ">
                                        <td>
                                    <div class="panel-group" id="accordion">
                                        <div style=";" class="col-md-12">
                                            <%if (sayac % 2 == 0) {%>
                                            <div class="panel panel-primary"> 
                                                <%} else {
                                                %>
                                                <div class="panel panel-info"> 
                                                    <%}
                                                    %>

                                                    <div class="panel-heading">
                                                        <h4 class="panel-title">
                                                            <a data-toggle="collapse" data-parent="#accordion" style="text-decoration: none;" href="#<%=sayac%>"><% out.println(rs.getString("duyuruId") + ". " + rs.getString("duyuruKonuBaslik"));%></a>
                                                        </h4>


                                                    </div>

                                                    <div id="<%=sayac%>" class="panel-collapse collapse">
                                                        <div class="panel-body"><% out.println(rs.getString("duyuruMesaj")); %></div>
                                                    </div>
                                                </div>





                                            </div>
                                        </div></td></tr><%
                                            sayac = sayac + 1;
                                           }%> 
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
                                </table> 
                                        
                        <script type="text/javascript">
                            $('#index').footable();
                        </script>

                                <%

                                    } catch (Exception ex) {

                                        out.println(ex.getMessage());
                                    }
                                %>
                            </div>

                        </div>









                        <div class="container panel">
                            <div class="row">
                                <hr>
                                <div class="col-md-12">

                                    <%@include file="asagiMenu.jsp" %>
                                </div>
                            </div>
                        </div>   


                        </div>

                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
                       
                        <script src="dist/js/jquery.min.js"></script>


                        </body>
                        </html>