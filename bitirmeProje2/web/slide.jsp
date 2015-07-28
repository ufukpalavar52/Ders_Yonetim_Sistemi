<%-- 
    Document   : slide
    Created on : 07.Ara.2014, 00:02:04
    Author     : İlkin Azeri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link href="dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    
        <div class="slide">
            
           
            
            <div id="myCarousel" class="carousel slide">
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			
		</ol>

		<div class="carousel-inner">
			<div class="item active">
				<img style="width: 1400px;
            height: 500px;" src="img/1820-3.jpg"/>
				<div class="container">
						<div class="carousel-caption">
							<h1>OMU Not Paylasim Portalina</h1>
							<p>HOSGELDINIZ</p>
                                                        
							<p><a href="#" class="btn btn-large btn-primary">Giris Yap</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="btn btn-success">Uye Ol</a></p> 
						
                                                
                                                </div>

				</div>
			</div>

			

			<div class="item">
				<img style="width: 1400px;
            height: 500px;" src="img/5.jpg"/>
				<div class="container">
						<div class="carousel-caption">
							<h1>OMU Not Paylasim Portalina</h1>
							<p>HOSGELDINIZ</p>
                                                        
							<p><a href="#" class="btn btn-large btn-primary">Giris Yap</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="btn btn-success">Uye Ol</a></p> 
						
                                              
                                                
                                                </div>

				</div>
			</div>
                    
		</div>
                
                


		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left"></span>

		</a>

		<a class="right carousel-control" href="#myCarousel" data-slide="next">
			<span class="glyphicon glyphicon-chevron-right"></span>

		</a>

            </div>
            

        </div>





<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="dist/js/bootstrap.min.js"></script>
    <script src="assets/js/docs.min.js"></script>
       
</body>
</html>
