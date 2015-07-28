
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
    <title>Ders Programı Düzenle</title>
    <link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css"/>
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
    </style>
<script>
function bilgiGoster(str)
{
var xmlhttp;    
if (str == "")
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
xmlhttp.open("GET","dersProgDuz.jsp?id="+str,true);
xmlhttp.send();
}

</script>  
<script>   
 function gunSaatGoster(str)
{
var xmlhttp;    
if (str == "")
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
xmlhttp.open("POST","dersGunSaat.jsp?id="+str,true);
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

<br/><br/><br/>


<div class="container">
    <div class="row">
        <div class="col-md-12">


            <h2>Ders Programı Düzenleme </h2> <hr/>


            <form class="form-horizontal" action="dersProgSil" method="post">
              <%
                      ConnectionDB connect = new ConnectionDB();
    	              Connection conn = connect.baglanti();
    	              ResultSet rs = null;
    	              Statement st = null;
    	              String sql = "Select *from bolum where bolumId = '"+session.getAttribute("oturumBolum")+"'";
    	        try {
       	        	st = conn.createStatement();
                        rs = st.executeQuery(sql);
                        
       	            
       	            		
       	            
             
             %>


                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">Bölüm</label>
                   
                    <div class="col-sm-5">
                        <select class="form-control" name="bolum" onchange="bilgiGoster(this.value)">
                            <option value="">Bölümünü seç</option>   
                         <% while(rs.next()){ %>
                            <option value="<%=rs.getString("bolumId")%>"><%=rs.getString("bolumAd")%></option>
                        <% }%>    
                        </select>
                        
                    </div>   
                </div>
                <% 
                } catch(Exception ex){
                	out.println(ex);
                }
                %>
             <div id="txtHint"></div>
             <div id="txtHint1"></div>
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

<script src="dist/js/bootstrap.min.js"></script>
<script src="dist/js/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>


</body>
</html>
<% } else { 
       response.sendRedirect("index.jsp");
   } else 
       response.sendRedirect("akademisyenGirisi.jsp");
%>