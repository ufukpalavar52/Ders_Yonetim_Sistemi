<%@page import="com.bitirmeProje.DAO.DersDAO"%>
<%@page import="com.bitirmeProje.model.Sinif"%>
<%@page import="java.util.ArrayList"%>
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
    <title>Yönetim Paneli || Lab. Programı Ayarla</title>

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
 <script>    
function bilgiGoster(str)
{
var xmlhttp;    
if (str=="")
  {
  document.getElementById("txtHint").innerHTML="";
  return;
  }
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
	
  if (xmlhttp.readyState == 4 && xmlhttp.status === 200)
    {
    document.getElementById("txtHint").innerHTML=xmlhttp.responseText;
    }
  }
xmlhttp.open("POST","labProgramiAl.jsp?id="+str,true);
xmlhttp.send();
}
</script>    
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

<br/>


<%
   
   String yetki = String.valueOf(session.getAttribute("yetki"));
    if(yetki != null)
        if (yetki.equals("1") || yetki.equals("2") || yetki.equals("3")) {
    
%>
<div class="container">
    <div class="row">
        <div class="col-md-12">
           
             <h2 style="color: #000000">Labaratuvar Derslerini Ayarlama </h2>
           
              <%
                       ArrayList <Sinif> sinif = new ArrayList();
                       DersDAO ders = new DersDAO();
                       ConnectionDB connect = new ConnectionDB();
                       Connection conn = connect.baglanti();
                %>                      
                       
            
                <form class="form-horizontal"  action="dersProgLab.jsp" method="POST">
                  <table class="table table-bordered table-condensed table-striped table-hover table-responsive">
                     <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">  
                                    <%
                                      connect = new ConnectionDB();
                                      conn = connect.baglanti();
                                      String donem = "";
                                      try {
                                      ResultSet rs = null;
                                      Statement st = null;
                                      String bolum_sorgu = "Select *from donem where aktifMi=1";
                                      st = conn.createStatement();
                                      rs = st.executeQuery(bolum_sorgu);
                                    %> 

                                    <label for="name" class="col-sm-2 control-label">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Dönem</label>
                                    <div class="col-sm-5">
                                        <select class="form-control" name="donem">
                                            
                                            <%while (rs.next()) {%>
                                            <option value="<%=rs.getString("donemId")%>"><%=rs.getString("akademikYil")+"/"+rs.getString("donemAd")%></option>    
                                            <% donem = rs.getString("donemId");%>
                                            <%}%>
                                            
                                        </select>
                                      <%} 
                                       catch(Exception ex) {
                                          out.println(ex);
                                      }%>      
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">  
                                   
                                    <%
                                      connect = new ConnectionDB();
                                      conn = connect.baglanti();
                                    
                                      try {
                                      ResultSet rs = null;
                                      Statement st = null;
                                      String bolum_sorgu = "Select distinct akademisyenNo,dersId,dersAd,teorikDersSaati,pratikDersSaati,labDersSaati,secmeliMi,ders_Yil from dersprogrami , ders as d,ders_has_akademisyan,donem where bolum_bolumId='"+session.getAttribute("oturumBolum") +"' and dersId = ders_has_akademisyan.ders_dersId  and ders_has_akademisyan.donem_donemId = donemId and aktifMi = 1 and d.bolum_bolumId = '"+session.getAttribute("oturumBolum")+"' and labDersSaati > 0 and dersId = (Select DISTINCT dersId from dersprogrami,ders,donem where dersId = d.dersId and   dersId = ders_dersId and donemId = dersprogrami.donem_donemId and aktifMi=1) and teorikDersSaati+labDersSaati+pratikDersSaati <= (Select COUNT(*) from dersprogrami,ders,donem where dersId = d.dersId and   dersId = ders_dersId and donemId = dersprogrami.donem_donemId and aktifMi=1) and akademisyenNo = akademisyan_akademisyenNo ;";
                                      st = conn.createStatement();
                                      rs = st.executeQuery(bolum_sorgu);
                                    %> 
                                    
                                    <label for="name" class="col-sm-2 control-label">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Dersler</label>
                                    <div class="col-sm-5">
                                        <select class="form-control" name="ders" onchange="bilgiGoster(this.value)">
                                            <option value=""> </option>
                                            <%while (rs.next()) {%>
                                            <option value="<%=rs.getString("dersId")+" "+rs.getString("ders_Yil")+" "+ donem+" "+rs.getString("akademisyenNo") %>"><%=rs.getString("dersAd")+" "+rs.getString("ders_Yil")%>.sınıf/Teorik Ders:<%=rs.getInt("teorikDersSaati")%> Pratik:<%=rs.getInt("pratikDersSaati")%> Lab:<%=rs.getInt("labDersSaati")%></option>    
                                            
                                            <%
                                            
                                            }
                                             
                                           
                                            
                                            %>
                                            
                                        </select>
                                       
                                      <%} 
                                       catch(Exception ex) {
                                          out.println(ex);
                                      }%> 
                                      
                                    </div><% if (session.getAttribute("dersHata") !=null ) { %>
                                    <p style = "color: #c12e2a">Lütfen Ders Seçiniz.</p>
                                    
                                    <%
                                        session.removeAttribute("dersHata");
                                    }  %>
                                    
                                </div>
                            </div>
                        </div>
                        </div> 
<script>
function sinifGoster1(str)
{
var xmlhttp;    
if (str=="")
  {
  document.getElementById("txtHint").innerHTML="";
  return;
  }
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
	
  if (xmlhttp.readyState == 4 && xmlhttp.status === 200)
    {
    document.getElementById("txtHint1").innerHTML=xmlhttp.responseText;
    }
  }
xmlhttp.open("POST","sinifGoster.jsp?id="+str+" "+<%=donem%>,true);
xmlhttp.send();
}    
</script>                                 
                       
                    
                    <br/><br/>
                    
                                
                    

                   
                      
                    
                
            </table>
<div id ="txtHint"></div>
            </form>
                                
                                
                                 <div id ="txtHint1"></div>                       
                                <table>
                                    
                                </table>
                                
            <br/>
            
            



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
   } else 
       response.sendRedirect("akademisyenGirisi.jsp");
%>