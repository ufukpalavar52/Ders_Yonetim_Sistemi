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
    <title>Yönetim Paneli || Ders Programı Ayarla</title>

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
xmlhttp.open("POST","dersProgramiAl.jsp?id="+str,true);
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
           
            
            <%String no = request.getParameter("id");
             int toplam = 0;
                     
                      
            %>
              <%
                                      ConnectionDB connect = new ConnectionDB();
                                      Connection conn = connect.baglanti();
                                      
                                      try {
                                      ResultSet rs = null;
                                      Statement st = null;
                                      String bolum_sorgu = "Select akademisyenAd,akademisyenSoyad from akademisyen where akademisyenNo ='"+no+"';";
                                      st = conn.createStatement();
                                      rs = st.executeQuery(bolum_sorgu);
                                      
                                      if (rs.next()) {
                              %>                             
                        <h2 style="color: #000000"><%=rs.getString("akademisyenAd")+" "+rs.getString("akademisyenSoyad")%> Öğretim Üyesinin Ders Programı Ayarlanıyor..</h2><br>
                 
                        <%                 
                                      } 
                                }  catch(Exception ex) {
                                    out.println(ex);
                  }%>  
             
            <table class="table table-bordered table-condensed table-striped table-hover table-responsive">
                <form class="form-horizontal"  action="dersProg.jsp" method="POST">
                    <input type = "text" class="gizli" value="<%=no%>" name="id"/>
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
<script>
function sinifGoster(str)
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
                                      String bolum_sorgu = "Select dersId,dersAd,teorikDersSaati,pratikDersSaati,labDersSaati,secmeliMi,ders_Yil from ders,ders_has_akademisyan,donem where bolum_bolumId='"+session.getAttribute("oturumBolum") +"' and dersId = ders_dersId and akademisyan_akademisyenNo = '"+no+"' and ders_has_akademisyan.donem_donemId = donemId and aktifMi = 1 and ders.bolum_bolumId = '"+session.getAttribute("oturumBolum")+"';";
                                      st = conn.createStatement();
                                      rs = st.executeQuery(bolum_sorgu);
                                    %> 
                                    
                                    <label for="name" class="col-sm-2 control-label">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Verdiği Dersler</label>
                                    <div class="col-sm-5">
                                        <select class="form-control" name="ders" onchange="bilgiGoster(this.value)">
                                            <option value=""> </option>
                                            <%while (rs.next()) {%>
                                            <option value="<%=rs.getString("dersId")+" "+rs.getString("ders_Yil")+" "+ donem + " "+rs.getString("secmeliMi")%>"><%=rs.getString("dersAd")+" "+rs.getString("ders_Yil")%>.sınıf/Teorik Ders:<%=rs.getInt("teorikDersSaati")%> Pratik:<%=rs.getInt("pratikDersSaati")%> Lab:<%=rs.getInt("labDersSaati")%></option>    
                                            
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
                    <br/><br/>
                    <div id ="txtHint"></div>
                                
                    

                    <tr class="active">
                    <th rowspan="2"><center>Saat-Gün</center></th>
                    <th colspan="2"><center>Pazartesi</center></th>
                    <th colspan="2"><center>Salı</center></th>
                    <th colspan="2"><center>Çarşamba</center></th>
                    <th colspan="2"><center>Perşembe</center></th>
                    <th colspan="2"><center>Cuma</center></th>

                    </tr>

                    <tr>

                        <td style=" width: 30px; height: 30px">Ders</td>
                        <td><center>Sınıf</center></td>
                    <td style=" width: 30px; height: 30px">Ders</td>
                    <td><center>Sınıf</center></td>
                    <td style=" width: 30px; height: 30px">Ders</td>
                    <td><center>Sınıf</center></td>
                    <td style=" width: 30px; height: 30px">Ders</td>
                    <td><center>Sınıf</center></td>
                    <td style=" width: 30px; height: 30px">Ders</td>
                    <td><center>Sınıf</center></td>

                    </tr>
                      <%    try {
                                conn = connect.baglanti();
                                ResultSet rs = null;
                                PreparedStatement ps = conn.prepareStatement("select *from sinif");
                                
                      %>
                    <tr>
                        <td><center>8:15/9:00</center>
                         <select class="gizli" name="saat0">
                           <option value="1">8:15/9:00</option>
                         </select>
                        </td>
                       <%for (int i = 0; i < 5; i++) {%> 
                       <td><center><input type="checkbox" name="c<%=i%>"/></center></td>
                    <td>
                    <div class="form-group">
                        <div class="col-sm-5">
                            <select class="form-control" name="sinif<%=i%>" style=" height: 28px;  width: 100px" onchange="sinifGoster(this.value)">
                                <option value=""></option>
                                <%
                                    rs = ps.executeQuery();
                                    while (rs.next()) {
                                %>
                                
                                <option value="<%=rs.getString("sinifId")%>"><%=rs.getString("sinifAd")%> </option>
                                <%} rs = null;
                                    rs = ps.executeQuery();
                                %>


                            </select>
                        </div>
                    </div>
                    </td>
                    
                    <%}%>
                    </tr>
                    <tr>
                        <td><center>9:15/10:00</center></td>
                        <select class="gizli" name="saat1">
                           <option value="2">9:15/10:00</option>
                       </select>
                       <%for (int i = 5; i < 10; i++) {%>
                        
                    <td><center><input type="checkbox" name="c<%=i%>"/></center></td>
                    <td>
                    <div class="form-group">
                        <div class="col-sm-5">
                            <select class="form-control" name="sinif<%=i%>" style=" height: 28px;  width: 100px"onchange="sinifGoster(this.value)">
                                <option value=""></option>
                                <%
                                    rs = ps.executeQuery();
                                    while (rs.next()) {
                                %>
                                
                                <option value="<%=rs.getString("sinifId")%>"><%=rs.getString("sinifAd")%> </option>
                                <%} rs = null;
                                    rs = ps.executeQuery();
                                %>


                            </select>
                        </div>
                    </div>
                    </td>
                    
                    <%}%>
                    </tr>
                    <tr>
                        <td><center>10:15/11:00</center></td>
                        <select class="gizli" name="saat2">
                           <option value="3">9:15/10:00</option>
                       </select>
                       <%for (int i = 10; i < 15; i++) {%>
                        
                    <td><center><input type="checkbox" name="c<%=i%>"/></center></td>
                    <td>
                    <div class="form-group">
                        <div class="col-sm-5">
                            <select class="form-control" name="sinif<%=i%>" style=" height: 28px;  width: 100px" onchange="sinifGoster(this.value)">
                                <option value=""></option>
                                <%
                                    rs = ps.executeQuery();
                                    while (rs.next()) {
                                %>
                                
                                <option value="<%=rs.getString("sinifId")%>"><%=rs.getString("sinifAd")%> </option>
                                <%} rs = null;
                                    rs = ps.executeQuery();
                                %>


                            </select>
                        </div>
                    </div>
                    </td>
                    
                    <%}%>
                    </tr>
                    <tr>
                        <td><center>11:15/12:00</center></td>
                        <select class="gizli" name="saat3">
                           <option value="4">11:15/12:00</option>
                       </select>
                       <%for (int i = 15; i < 20; i++) {%>
                        
                    <td><center><input type="checkbox" name="c<%=i%>"/></center></td>
                    <td>
                    <div class="form-group">
                        <div class="col-sm-5">
                            <select class="form-control" name="sinif<%=i%>" style=" height: 28px;  width: 100px" onchange="sinifGoster(this.value)">
                                <option value=""></option>
                                <%
                                    rs = ps.executeQuery();
                                    while (rs.next()) {
                                %>
                                
                                <option value="<%=rs.getString("sinifId")%>"><%=rs.getString("sinifAd")%> </option>
                                <%} rs = null;
                                    rs = ps.executeQuery();
                                %>


                            </select>
                        </div>
                    </div>
                    </td>
                    
                    <%}%>
                    </tr>
                    <tr class="active">

                        <td><center>12:00/13:00</center></td>
                    <td></td>
                    <td>

                    </td>
                    <td></td>
                    <td>

                    </td>
                    <td></td>
                    <td>

                    </td>
                    <td></td>
                    <td>

                    </td>
                    <td></td>
                    <td>

                    </td>



                    </tr>
                    <tr>
                        <td><center>13:00/13:45</center></td>
                       <select class="gizli" name="saat4">
                           <option value="5">13:00/13:45</option>
                       </select>         
                       <%for (int i = 20; i < 25; i++) {%>
                        
                    <td><center><input type="checkbox" name="c<%=i%>"/></center></td>
                    <td>
                    <div class="form-group">
                        <div class="col-sm-5">
                            <select class="form-control" name="sinif<%=i%>" style=" height: 28px;  width: 100px" onchange="sinifGoster(this.value)">
                                <option value=""></option>
                                <%
                                    rs = ps.executeQuery();
                                    while (rs.next()) {
                                %>
                                
                                <option value="<%=rs.getString("sinifId")%>"><%=rs.getString("sinifAd")%> </option>
                                <%} rs = null;
                                    rs = ps.executeQuery();
                                %>


                            </select>
                        </div>
                    </div>
                    </td>
                    
                    <%}%>
                    </tr>
                    <tr>
                        <td><center>14:00/14:45</center></td>
                        <select class="gizli" name="saat5">
                           <option value="6">14:00/14:45</option>
                       </select>
                       <%for (int i = 25; i < 30; i++) {%>
                        
                    <td><center><input type="checkbox" name="c<%=i%>"/></center></td>
                    <td>
                    <div class="form-group">
                        <div class="col-sm-5">
                            <select class="form-control" name="sinif<%=i%>" style=" height: 28px;  width: 100px" onchange="sinifGoster(this.value)">
                                <option value=""></option>
                                <%
                                    rs = ps.executeQuery();
                                    while (rs.next()) {
                                %>
                                
                                <option value="<%=rs.getString("sinifId")%>"><%=rs.getString("sinifAd")%> </option>
                                <%} rs = null;
                                    rs = ps.executeQuery();
                                %>


                            </select>
                        </div>
                    </div>
                    </td>
                    
                    <%}%>
                    </tr>
                    <tr>
                        <td><center>15:00/15:45</center></td>
                        <select class="gizli" name="saat6">
                           <option value="7">15:00/15:45</option>
                       </select>
                       <%for (int i = 30; i < 35; i++) {%>
                        
                    <td><center><input type="checkbox" name="c<%=i%>"/></center></td>
                    <td>
                    <div class="form-group">
                        <div class="col-sm-5">
                            <select class="form-control" name="sinif<%=i%>" style=" height: 28px;  width: 100px" onchange="sinifGoster(this.value)">
                                <option value=""></option>
                                <%
                                    rs = ps.executeQuery();
                                    while (rs.next()) {
                                %>
                                
                                <option value="<%=rs.getString("sinifId")%>"><%=rs.getString("sinifAd")%> </option>
                                <%} rs = null;
                                    rs = ps.executeQuery();
                                %>


                            </select>
                        </div>
                    </div>
                    </td>
                    
                    <%}%>
                    </tr>
                    <tr>
                        <td><center>16:00/16:45</center></td>
                        <select class="gizli" name="saat7">
                           <option value="8">16:00/16:45</option>
                       </select>
                       <%for (int i = 35; i < 40; i++) {%>
                        
                    <td><center><input type="checkbox" name="c<%=i%>"/></center></td>
                    <td>
                    <div class="form-group">
                        <div class="col-sm-5">
                            <select class="form-control" name="sinif<%=i%>" style=" height: 28px;  width: 100px" onchange="sinifGoster(this.value)">
                                <option value=""></option>
                                <%
                                    rs = ps.executeQuery();
                                    while (rs.next()) {
                                %>
                                
                                <option value="<%=rs.getString("sinifId")%>"><%=rs.getString("sinifAd")%> </option>
                                <%} rs = null;
                                    rs = ps.executeQuery();
                                %>


                            </select>
                        </div>
                    </div>
                    </td>
                    
                    <%}%>
                    </tr>

                    <tr>

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-5">
                            <td><button type="submit" class="btn btn-primary" >Kaydet</button>
                                <button type="reset" class="btn btn-default">Temizle</button></td>
                        </div>   
                    </div>
                    </tr>
                <%} catch(Exception ex) {
                        out.println(ex);
                }%>
                </form>
            </table><hr>
            <br/>
            <div id ="txtHint1"></div>
            



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