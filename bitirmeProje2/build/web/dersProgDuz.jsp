<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@page import = "com.bitirmeProje.DAO.ConnectionDB" %>
<%
   String yetki = String.valueOf(session.getAttribute("yetki"));
    if(yetki != null)
        if (yetki.equals("1") || yetki.equals("2")) {
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
     
</head>
<body>
<%
   String bolum = request.getParameter("id");
    
   ConnectionDB connect = new ConnectionDB();
   Connection conn = connect.baglanti();
   ResultSet rs = null;
   Statement st = null;
   String sql = "";
%>
               
                  <%
                      
    	               
    	              rs = null;
    	              st = null;
    	              sql = "Select *from donem where aktifMi = 1";
    	        try {
       	        	st = conn.createStatement();
                        rs = st.executeQuery(sql);
       	            
       	            
       	            		
       	            
             
                %>
                                 
                <div class="form-group">  
                    <label for="name" class="col-sm-2 control-label">Dönem</label>
                    <div class="col-sm-5">
                        <select class="form-control" name="donem">

                            <% while(rs.next()){ %>
                            <option value="<%=rs.getString("donemId")%>"><%=rs.getString("AkademikYil")+" "%><%=rs.getString("donemAd") %></option>
                            <% }%>
                        </select>
                    </div>
                </div>
                <% 
                } catch(Exception ex){
                	out.println(ex);
                }
                %>
                 <%
                      
    	               
    	              rs = null;
    	              st = null;
                      
                        sql = "Select distinct  ders_dersId,dersAd  from donem, gun,saat, ders,dersprogrami where bolum_bolumId = '"+session.getAttribute("oturumBolum")+"' and ders_dersId = dersId and gun_gunId = gunId and saat_saatId = saatId and dersprogrami.donem_donemId = donemId and aktifMi = 1;";
                      
    	        try {
       	        	st = conn.createStatement();
                        rs = st.executeQuery(sql);
       	            
       	            
       	            		
       	            
             
                %>
                                 
                <div class="form-group">  
                    <label for="name" class="col-sm-2 control-label">Dersler</label>
                    <div class="col-sm-5">
                        <select class="form-control" name="bolumders" onchange="gunSaatGoster(this.value)">
                            <option value="">Ders Seçiniz</option>
                            <% while(rs.next()){ %>
                            <option value="<%=rs.getString("ders_dersId")%>"><%=rs.getString("dersAd") %></option>
                            <% }%>
                        </select>
                    </div>
                </div>
                <% 
                } catch(Exception ex){
                	out.println(ex);
                }
                %>
                
    
</body>
</html>
<% } else { 
       response.sendRedirect("index.jsp");
   } else 
       response.sendRedirect("akademisyenGirisi.jsp");
%>