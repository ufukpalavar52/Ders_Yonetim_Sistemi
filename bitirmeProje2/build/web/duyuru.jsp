<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.bitirmeProje.DAO.ConnectionDB"%>
<!doctype html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <meta charset="utf-8" />
<title>Duyuru</title>


<link href="resources/css/global.css" rel="stylesheet" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
<link href='http://fonts.googleapis.com/css?family=IM+Fell+DW+Pica+SC' rel='stylesheet' type='text/css'>






</head>
<body>
    <%
        Connection con = null;
        Statement stm = null;
        ResultSet rs = null;

        try {

        	ConnectionDB connect = new ConnectionDB();
   	        Connection conn = connect.baglanti();

            PreparedStatement st = conn.prepareStatement("SELECT * from duyuru order by duyuruId desc");
            int sayac = 1;

            rs = st.executeQuery();


    %>


<div class="panel-heading" style="background-color: #333;"><strong style="color:white;font-size: 20px;">Duyuru</strong> <a href="tumDuyuru.jsp" style="float:right;color:white;font-size: 12px;">Tum duyrulari gor</a></div><br/>


<ul id="ticker_01" class="ticker" style="width:340px;height:318px; list-style-type:none;">
    <%                  while (rs.next() && sayac < 6) {
            String duyuruKonuBaslik = rs.getString("duyuruKonuBaslik");
            String duyuruMesaj = rs.getString("duyuruMesaj");

    %>

    <li style="background-color: window"><hr><strong>Duyuru:&nbsp;&nbsp;</strong><a href="duyuruGoster.jsp?duyuruId=<%=rs.getString("duyuruId") %>"><% out.println(duyuruKonuBaslik); %></a></li>
            <%
                    sayac = sayac + 1;
                }
            %>


</ul>


<%
    } catch (Exception ex) {

        out.println(ex.getMessage());
    }
%>







<script>

    function tick() {
        $('#ticker_01 li:first').slideUp(function() {
            $(this).appendTo($('#ticker_01')).slideDown();
        });
    }
    setInterval(function() {
        tick()
    }, 5000);


    function tick2() {
        $('#ticker_02 li:first').slideUp(function() {
            $(this).appendTo($('#ticker_02')).slideDown();
        });
    }
    setInterval(function() {
        tick2()
    }, 3000);


    function tick3() {
        $('#ticker_03 li:first').animate({'opacity': 0}, 200, function() {
            $(this).appendTo($('#ticker_03')).css('opacity', 1);
        });
    }
    setInterval(function() {
        tick3()
    }, 4000);

    function tick4() {
        $('#ticker_04 li:first').slideUp(function() {
            $(this).appendTo($('#ticker_04')).slideDown();
        });
    }


    /**
     * USE TWITTER DATA
     */

    $.ajax({
        url: 'http://search.twitter.com/search.json',
        data: 'q=%23javascript',
        dataType: 'jsonp',
        timeout: 10000,
        success: function(data) {
            if (!data.results) {
                return false;
            }

            for (var i in data.results) {
                var result = data.results[i];
                var $res = $("<li />");
                $res.append('<img src="' + result.profile_image_url + '" />');
                $res.append(result.text);

                console.log(data.results[i]);
                $res.appendTo($('#ticker_04'));
            }
            setInterval(function() {
                tick4()
            }, 4000);

            $('#example_4').show();

        }
    });


</script>




</body>
</html>