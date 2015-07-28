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
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
    <link href="http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet"/>
    <script src="dist/js/bootsrap.js" ></script>
    <script type="text/javascript" src="dist/js2/jquery-1.9.0.js"></script>
    <link rel="stylesheet" type="text/css" href="dist/js2/jquery.autocomplete.css" />
    <script type="text/javascript">

$(function(){

		
		$("#ara").keyup(function(){

			var kelime=$(this).val();

			$.post("AkademisyenAra",{"kelime":kelime},function(al){ //ara.php ye gönder

				$(".kelimeler").html(al);//gelen verileri .kerlimeler clasına ait divin içine yaz

			});

		});
});



function tamamla(al){

	$("#ara").val(al);//inputa koy

	$(".kelimeler").text("");

}

</script>
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
    <title>Öğretim Üyesi Planı</title>
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
        <div class="col-lf-2">

            <h2>Öğretim Üyesi Ara</h2> <hr/>
          <%
            ConnectionDB connect = new ConnectionDB();
            Connection conn = connect.baglanti();
            ResultSet rs = null;
            Statement st = null;
            String bolum_sorgu = "Select *from donem";
            try {
                    st = conn.createStatement();
           	    rs = st.executeQuery(bolum_sorgu);
            %>
            
            <form class="form-horizontal" action="ogretimGorevlisiAra.jsp" method="POST">
                <div class="form-group">
                    <label for="year" class="col-sm-2 control-label">Dönem</label>
                    <div class="col-sm-5">
                        
                        <select  name="donem"  class="form-control" >
                        
                        <% while (rs.next()) {%>
                        <option value="<%=rs.getInt("donemId")%>"><%=rs.getString("akademikYil")+"/"+rs.getString("donemAd")%> </option>
                        <%}%>
                        </select>
                        
                    </div>   
                </div> 
                
               

                <div class="form-group">
                    <label for="year" class="col-sm-2 control-label">Öğretim Üyesi Adı</label>
                    <div class="col-sm-5">
                        <input  type="text" id="ara" name="ogretimUyeAdi" class="form-control" placeholder="İsim Girin" required autofocus />
                        <div class="list-group">
                            <div class="kelimeler">
                                
                            </div>
 
 
                        </div>
                    </div>   
                </div> 



                <div class="col-sm-7">
                    <button type="submit"  class="btn btn-primary" style="float:right; width:120px;height:40px;" >Ara</button>
                </div>       
            </form>       
        </div>
        <br/><br/>
        <div class="col-lf-2">

            <h2>Öğretim Üyesi Listele</h2> <hr/>
           <% st = conn.createStatement();
              rs = st.executeQuery(bolum_sorgu);
           %>
            <form class="form-horizontal" action="ogretimElamaniList.jsp" method="POST">
                <div class="form-group">
                    <label for="year" class="col-sm-2 control-label">Dönem</label>
                    <div class="col-sm-5">
                        <select  name="donem"  class="form-control" >
                            <% while (rs.next()) {%>
                        <option value="<%=rs.getInt("donemId")%>"><%=rs.getString("akademikYil")+"/"+rs.getString("donemAd")%> </option>
                        <%}%>
                        
                        </select>
                    </div>   
                </div>
               
            <%      
                    st = null;
                    rs = null;
                    bolum_sorgu = "Select *from bolum";
                    st = conn.createStatement();
                    rs = st.executeQuery(bolum_sorgu);
           %>
               

                <div class="form-group">
                    <label  class="col-sm-2 control-label">Bölüm</label>
                    <div class="col-sm-5">
                        <select  name="bolum"  class="form-control" >
                         <% while (rs.next()) {%>
                        <option value="<%=rs.getInt("bolumId")%>"><%=rs.getString("bolumAd")%> </option>
                        <%}%>
                        
                        </select>
                    </div>   
                </div> 
                  


                <div class="col-sm-7">
                    <button type="submit"  class="btn btn-primary" style="float:right; width:120px;height:40px;" >Listele</button>
                </div>       
            </form>  
               <%} 
                 catch(Exception ex) {
                    out.println(ex);
                }%>        
               
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

