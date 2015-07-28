
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>İletişim</title>
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

     </style>
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
            <div class="col-md-12">
                
                         
                <h2>İletişim Formu </h2> <hr/>
                <form class="form-horizontal" action="mailAtServlet" method="post">
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">İsim Soyisim</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="isimSoyisim" placeholder="Ad Soyad Girin.." required autofocus/>
                        </div>   
                    </div> 
                    
                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-6">
                            <input type="email" class="form-control" id="email" name="email" placeholder="Email Girin.." required autofocus/>
                        </div>   
                    </div>  
                    
                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">Konu</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="konu" placeholder="Konu Girin.." required autofocus/>
                        </div>   
                    </div> 
                    
                    
                    <div class="form-group">
                        <label for="message" class="col-sm-2 control-label">Mesaj</label>
                        <div class="col-sm-6">
                            <textarea class="form-control" rows="6" name="mesaj" placeholder="Mesajınızı Girin.." required autofocus></textarea>
                        </div>   
                    </div> 
                    
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-6">
                            <button type="submit" class="btn btn-primary">Gönder</button>&nbsp;&nbsp;
                            <button type="reset" class="btn btn-default">Reset</button>
                        </div>   
                    </div> 
                </form>
                
            </div> 
        </div>
    </div> <br/><br/><br/><br/>
    
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
