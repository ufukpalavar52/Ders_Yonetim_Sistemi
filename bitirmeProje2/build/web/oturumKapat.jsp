<%-- 
    Document   : oturumuKapat
    Created on : 01.Mar.2015, 18:25:42
    Author     : İlkin Azeri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
    <% 
        session.removeAttribute("oturumNo");
        session.removeAttribute("oturum");
        session.removeAttribute("yetki");
        response.sendRedirect("index.jsp");
        
        %>
</body>
</html>
