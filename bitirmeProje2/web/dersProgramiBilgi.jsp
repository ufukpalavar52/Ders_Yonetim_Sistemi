

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.bitirmeProje.DAO.ConnectionDB"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
<div class ="form-group">
    <%
                String no = request.getParameter("id");
                ConnectionDB connect = new ConnectionDB();
                Connection conn = connect.baglanti();
                try {
                       ResultSet rs = null;
                       Statement st = null;
                       String bolum_sorgu = "Select dersId,dersAd from ders,ders_has_akademisyan where bolum_bolumId='"+session.getAttribute("oturumBolum") +"' and ders_dersId = dersId and akademisyan_akademisyenNo = '"+no+"';";
                       st = conn.createStatement();
                       rs = st.executeQuery(bolum_sorgu);
    %> 

                                    <label for="name" class="col-sm-2 control-label">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Verdiği Dersler</label>
                                    <div class="col-sm-5">
                                        <select class="form-control" name="ders">
                                            <option value=""> </option>
                                            <%while (rs.next()) {%>
                                            <option value="<%=rs.getString("dersId")%>"><%=rs.getString("dersAd")%></option>    
                                            <%}%>
                                            
                                        </select>
                                      <%} 
                                       catch(Exception ex) {
                                          out.println(ex);
                                      }%>      
                                    </div>
</div>                                  
</body>
</html>
