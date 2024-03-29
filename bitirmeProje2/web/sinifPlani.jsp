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
    <title>Sınıf Planı</title>
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
             <form class="form-horizontal" action="sinifPlaniGoster.jsp" method="POST">   
                <h2>Sınıf Planı Ara</h2> <hr/>
                
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
                <%} 
                 catch(Exception ex) {
                    out.println(ex);
                }  
                 connect = new ConnectionDB();
                 conn = connect.baglanti();
                 rs = null;
                 st = null;
                 bolum_sorgu = "Select *from sinif";
                 try {
                    st = conn.createStatement();
           	    rs = st.executeQuery(bolum_sorgu);
            %>
            
            
                <div class="form-group">
                    <label for="year" class="col-sm-2 control-label">Derslik</label>
                    <div class="col-sm-5">
                        
                        <select  name="sinif"  class="form-control" >
                        
                        <% while (rs.next()) {%>
                        <option value="<%=rs.getInt("sinifId")%>"><%=rs.getString("sinifAd")%></option>
                        <%}%>
                        </select>
                        
                    </div>   
                </div> 
                <%} 
                 catch(Exception ex) {
                    out.println(ex);
                }%> 
                    
                      
                    
                    <div class="col-sm-7">
                           <button type="submit"  class="btn btn-primary" style="float:right; width:120px;height:40px;" >Ara</button>
                    </div>       
                </form>       
            </div>
        </div>
    </div>
<br/>
<br/>
<br/>
<br/>
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

