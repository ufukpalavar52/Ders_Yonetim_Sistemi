<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../docs-assets/ico/favicon.png">

        <!--Bootsrap Linkkleri -->
        <!-- Bootstrap -->
        <link href="dist/css/bootstrap.min.css" rel="stylesheet">
            <link href="dist/css/nanophp.css" rel="stylesheet">
                <link href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/3.2.1/css/font-awesome.min.css" rel="stylesheet">
                    <!--[if IE 7]>
                    <link href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/3.2.1/css/font-awesome-ie7.min.css" rel="stylesheet">
                    <![endif]-->
                    <!--<link href="/css/style.css?version=03f82d768c8366b01cc7366f3c2628e0ec9a8021" rel="stylesheet">-->
                    <link href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.1/css/bootstrap-responsive.min.css" rel="stylesheet">

                        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
                        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
                        <!--[if lt IE 9]>
                          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
                          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
                        <![endif]-->
                        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">


                            <link href="http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">




                                </head>
                                <body>
                                <div class="anaMenu" >
                                    <div class="navbar navbar-default navbar-fixed-top" >
                                        <div class="container">
                                            <div class="navbar-header">
                                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                                    <span class="icon-bar"></span>
                                                    <span class="icon-bar"></span>
                                                    <span class="icon-bar"></span>

                                                </button>

                                                <a href="#" class="navbar-brand" style="color: #269abc;"><img src="img/ondokuzmayis_universitesi-logo.jpg" style="width: 30px;height: 30px; " >&nbsp;&nbsp;ONDOKUZ MAYIS UNIVERSITESI MUHENDISLIK FAKULTESI</a>
                                            </div>

                                            <div class="navbar-collapse collapse">
                                                <ul class="nav navbar-nav" >
                                                    <li><a href="index.jsp" style="color: ">AnaSayfa</a></li>
                                                    <li><a href="#">Hakkimizda</a></li>
                                                    <li><a href="iletisim.jsp">Iletisim</a></li>
                                                    <li class="dropdown" >
                                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"  >Ayarlar<b class="caret"></b></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="#" >Profil</a></li>
                                                            <li><a href="#" >Cikis Yap</a></li>


                                                        </ul>
                                                    </li>

                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <br/><br/><br/>


                                <div class="container">
                                    <div class="row">
                                        <div class="cold-md-12">
                                            <h2>Contact Home</h2><hr/>

                                            <form class="form-horizontal">
                                                <div class="form-group">
                                                    <label for="name" class="col-sm-2 control-label">Name</label>
                                                    <div class="col-sm-4">
                                                        <input type="text" class="form-control" placeholder="Enter Name..." required autofocus/>
                                                    </div>


                                                </div>

                                                <div class="form-group">
                                                    <label for="email" class="col-sm-2 control-label">Email</label>
                                                    <div class="col-sm-4">
                                                        <input type="email" class="form-control" placeholder="Enter Email..."/>
                                                    </div>


                                                </div>

                                                <div class="form-group">
                                                    <label for="mesage" class="col-sm-2 control-label">Message</label>
                                                    <div class="col-sm-4">
                                                        <textarea class="form-control" row="3" placeholder="Enter Message..." ></textarea>
                                                    </div>


                                                </div>

                                                <div class="form-group">
                                                    <label for="website" class="col-sm-2 control-label">Website</label>
                                                    <div class="col-sm-4">
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" value="option1"/>Youtube
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" value="option2"/>Twitter
                                                        </label>

                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" value="option3"/>Face
                                                        </label>
                                                    </div>

                                                </div>

                                                <div class="form-group">
                                                    <label for="gender" class="col-sm-2 control-label">gender</label>
                                                    <div class="col-sm-4">
                                                        <label class="radio-inline">
                                                            <input type="radio" name="genderRadio" value="option1"/>Man
                                                        </label>
                                                        <label class="radio-inline">
                                                            <input type="radio" name="genderRadio" value="option2"/>Woman
                                                        </label>

                                                    </div>


                                                </div>

                                                <div class="form-group">
                                                    <label for="city" class="col-sm-2 control-label">City</label>
                                                    <div class="col-sm-4">
                                                        <select class="form-control">
                                                            <option>London</option>
                                                            <option>Baku</option>
                                                            <option>Istanbul</option>

                                                        </select>

                                                    </div>


                                                </div>

                                                <div class="form-group">

                                                    <div class="col-sm-offset-2 col-sm-4">

                                                        <button type="submit" class="btn btn-primary">Submit</button>
                                                        <button type="reset" class="btn btn-default">Clear</button>
                                                    </div>


                                                </div>





                                            </form>

                                        </div>

                                    </div>


                                </div>

                                <!--Gooter and Modal
                                ======-->
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <hr/>
                                            <p>Copyright &copy:Creativy Tuts.
                                                <a data-toggle="modal" href="#myModal">Terms and Conditions</a>
                                            </p>

                                            <!--Modal-->
                                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h2>Terms and Conditions</h2>
                                                        </div>

                                                        <div class="modal-body">
                                                            <p>The text will go here...</p>
                                                        </div>

                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>


                                </body>
                                </html>
