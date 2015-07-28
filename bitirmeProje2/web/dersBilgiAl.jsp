<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@page import = "com.bitirmeProje.DAO.ConnectionDB" %>
<%
   String yetki = String.valueOf(session.getAttribute("yetki"));
    if(yetki != null)
        if (yetki.equals("1") || yetki.equals("2") || yetki.equals("3")) {
    
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
   String sql = "Select *from akademisyen where bolum_bolumId = '"+bolum+"' and pasifMi=0;";
   try {
        st = conn.createStatement();
       	rs = st.executeQuery(sql);
       	            
       
             %>


                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">Öğretim Üyesi</label>
                   
                    <div class="col-sm-5">
                        <select class="form-control" name="ogretimUyesi">
                         <% while(rs.next()){ %>
                            <option value="<%=rs.getString("akademisyenNo")%>"><%=rs.getString("akademisyenAd")+" "+rs.getString("akademisyenSoyad") %></option>
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
                      if (yetki.equals("1") || yetki.equals("2"))
                        sql = "Select *from ders where bolum_bolumId = '"+session.getAttribute("oturumBolum")+"';";
                      else
                          sql = "Select *from ders";
    	        try {
       	        	st = conn.createStatement();
                        rs = st.executeQuery(sql);
       	            
       	            
       	            		
       	            
             
                %>
                                 
                <div class="form-group">  
                    <label for="name" class="col-sm-2 control-label">Verebileceği Dersler</label>
                    <div class="col-sm-5">
                        <select class="form-control" name="bolumders">

                            <% while(rs.next()){ %>
                            <option value="<%=rs.getString("dersId")%>"><%=rs.getString("dersAd") %></option>
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
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-5">
                        <button type="submit" class="btn btn-primary" onclick="return window.confirm('Ders Ataması İçin Eminmsiniz')">Ekle</button>&nbsp;&nbsp;
                        <button type="reset" class="btn btn-default">Temizle</button>
                    </div>   
                </div>
    
    
</body>
</html>
<% } else { 
       response.sendRedirect("index.jsp");
   } else 
       response.sendRedirect("akademisyenGirisi.jsp");
%>