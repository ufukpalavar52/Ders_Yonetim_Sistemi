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
    <script>   
 
</script>   
</head>
<body>
<%
   String dersId = request.getParameter("id");
    
   ConnectionDB connect = new ConnectionDB();
   Connection conn = connect.baglanti();
   ResultSet rs = null;
   Statement st = null;
   String sql = "";
%>
               
                  
                 <%
                      
    	               
    	              rs = null;
    	              st = null;
                      
                        sql = "Select sinifAd,sinif_sinifId, saatAd,gunAd,saat_saatId,gun_gunId ,dersAd, ders_dersId from donem,sinif, gun,saat, ders,dersprogrami where bolum_bolumId = '"+session.getAttribute("oturumBolum")+"' and ders_dersId = '"+dersId+"' and dersId='"+dersId+"' and gun_gunId = gunId and saat_saatId = saatId and sinifId = sinif_sinifId and dersprogrami.donem_donemId = donemId and aktifMi = 1;";
                      
    	        try {
       	        	st = conn.createStatement();
                        rs = st.executeQuery(sql);
       	            
       	            
       	            		
       	            
             
                %>
                                 
                <div class="form-group">  
                    <label for="name" class="col-sm-2 control-label">Dersler</label>
                    <div class="col-sm-5">
                        <select class="form-control" name="bolumdersSil" >

                            <% while(rs.next()){ %>
                            <option value="<%=rs.getString("ders_dersId")+" "+rs.getString("saat_saatId")+" "+rs.getString("gun_gunId")+" "+rs.getString("sinif_sinifId")%>"><%=rs.getString("dersAd")+" | Gün:"+rs.getString("gunAd")+" | saat:"+rs.getString("saatAd")+" "+rs.getString("sinifAd") %></option>
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
                        <button type="submit" class="btn btn-primary" onclick="return window.confirm('Dersi Programdan Silmek için Eminmisiniz')">Sil</button>&nbsp;&nbsp;
                        <button type="reset" class="btn btn-default">Varsayılan</button>
                    </div>   
                </div>
    
    
</body>
</html>
<% } else { 
       response.sendRedirect("index.jsp");
   } else 
       response.sendRedirect("akademisyenGirisi.jsp");
%>