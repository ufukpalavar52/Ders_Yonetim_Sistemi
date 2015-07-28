

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("ISO-8859-9");
response.setCharacterEncoding("ISO-8859-9");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Dosya</title>
</head>
<body>
    <%request.setCharacterEncoding("ISO-8859-9");
      response.setCharacterEncoding("ISO-8859-9");
        
        request.setCharacterEncoding("utf-8");
        String pdf = request.getParameter("pdf");
        out.println(request.getParameter("pdfAd"));
      
        response.sendRedirect(pdf);
        out.println(pdf);
        
        %>
</body>
</html>
