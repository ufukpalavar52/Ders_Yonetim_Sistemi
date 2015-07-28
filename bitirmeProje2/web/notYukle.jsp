<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page import="com.bitirmeProje.DAO.ConnectionDB"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.fileupload.*, org.apache.commons.fileupload.servlet.ServletFileUpload, org.apache.commons.fileupload.disk.DiskFileItemFactory, org.apache.commons.io.FilenameUtils, java.util.*, java.io.File, java.lang.Exception,org.apache.commons.fileupload.disk.DiskFileItemFactory.*"%>
<%
    request.setCharacterEncoding("ISO-8859-9");
    response.setCharacterEncoding("ISO-8859-9");
%>
<%if (session.getAttribute("yetki") != null && session.getAttribute("oturum")!=null ) { %>
<!DOCTYPE HTML >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Upload</title>


<style>
.gizli {
	display: none;
}
</style>

</head>
<body>
	<br/>
	<div class="container panel">
		<div class="row">
			<div class="col-md-12">
				<%@include file="menu.jsp"%>
			</div>
		</div>
	</div>
	<br />
	<br />





	<div class="container">
		<div class="row">
			<div class="col-md-6">


				<%

String ogrenciNo = (String)session.getAttribute("oturumNo");
   
if (ServletFileUpload.isMultipartContent(request)){
    ServletFileUpload servletFileUpload = new ServletFileUpload(new DiskFileItemFactory());
    List fileItemsList = servletFileUpload.parseRequest(request);

   String optionalFileName = "";
   FileItem fileItem = null;

   Iterator it = fileItemsList.iterator();
   while (it.hasNext()){
      FileItem fileItemTemp = (FileItem)it.next();

if (fileItemTemp.isFormField()){

if (fileItemTemp.getFieldName().equals("yol"))//notSec.jsp sayfamızdaki dosya yolunun “name” i
optionalFileName = fileItemTemp.getString();//resmin yolunu alıyoruz
}
else
fileItem = fileItemTemp;
}

if (fileItem!=null){//Yüklenen dosyanın ismini değiştirdik. Eğer gerekmiyorsa değiştirmeyebiliriz
String tip="";
if( fileItem.getName().indexOf(".")!=-1 ){
tip=fileItem.getName().substring(fileItem.getName().indexOf("."));
}
String fileName = fileItem.getName().substring(0, fileItem.getName().indexOf("."))+tip;


String file = "../bitirmeProje2/belgeler/" + fileName;

//bu kısım isim değiştirme kısmıdır. İstediğiniz gibi //değiştirebilirsiniz. Ben sayfamdaki Admin_session adında sessiondan aldığım bilgiye göre //değiştirdim.
%>

				<h3>
					<b>Sisteme Yuklenen Dosya Bilgileri:</b>
				</h3>
				<hr />
				<br /> <label>Tipi:</label>
				<%= fileItem.getContentType() %><br /> <label>Alan ismi:</label>
				<%= fileItem.getFieldName() %><br /> <label>Dosya ismi:</label>
				<%= fileName %><br /> <label>Dosya Boyutu: </label><%= fileItem.getSize()/1024 %>&nbsp;KB<br />
				<br />


				<%
long dosyaBoyutu = fileItem.getSize()/1024;
if (fileItem.getSize() > 0){//yüklenen dosyanın boyutu sıfırdan büyükse
if (optionalFileName.trim().equals(""))
fileName = FilenameUtils.getName(fileName);
else
fileName = optionalFileName;

String dirName = "C:\\Users\\toshıba\\Documents\\NetBeansProjects\\bitirmeProje2\\web\\belgeler\\";
File saveTo = new File(dirName + fileName);
String kaydetFile = dirName + fileName;

try {
fileItem.write(saveTo);

   
   

        ConnectionDB connect = new ConnectionDB();
	    Connection conn = connect.baglanti();
                
                String INSERT = "INSERT into dosya(dosyaYolu) values(?)";
                PreparedStatement pstatement = conn.prepareStatement(INSERT);
                pstatement.setString(1,file);
                
                
                %>
			</div>

			<br />
			<br />
			<br />
			<br />
			<div class="col-md-6">


				<form action="updateData" method="POST" class="form-horizontal">
					<input type="text" name="dosyaBoyutu" class="gizli"
						value="<%out.println(dosyaBoyutu);%>"> <input type="text"
						name="ogrenciNo" class="gizli" value="<%out.println(ogrenciNo);%>">
					<input type="text" name="pdf" class="gizli"
						value="<%out.println(file);%>">
                                        <input type="text" name="dosyaTipi" class="gizli" value="<%out.println(tip);%>">    
					<%      
                                       int updateQuery = pstatement.executeUpdate();
  
}
catch (Exception e){//herhangi bir hata da hata mesajını yazdırıyoruz
out.print(e.getMessage());
}}}}
              %>
					<div class="form-group">
						<label for="name" class="col-sm-2 control-label">File Ad:</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="pdfAd"
								placeholder="Ad Soyad Girin.." required autofocus />
						</div>
					</div>

					<div class="form-group">
						<label for="name" class="col-sm-2 control-label">Aciklama:</label>
						<div class="col-sm-6">
							<textarea type="text" class="form-control" name="notAciklama"
								placeholder="Not icin Aciklama Girin.." required autofocus></textarea>
						</div>
					</div>

					<div class="form-group">
						<label for="year" class="col-sm-2 control-label">Yil</label>
						<div class="col-sm-6">
							<select class="form-control" name="yil">
								<option value="2011-2012">2011-2012</option>
								<option value="2012-2013">2012-2013</option>
								<option value="2013-2014">2013-2014</option>
								<option value="2014-2015">2014-2015</option>
								<option value="2015-2016">2015-2016</option>
							</select>
						</div>
					</div>


					<div class="form-group">
						<label for="fakulte" class="col-sm-2 control-label">Fakulte</label>
						<div class="col-sm-6">
							<select class="form-control" name="fakulte">
								<option value="Muhendislik">Mühendislik</option>
								<option value="Fen Edebiyat">Fen Edebiyat</option>
								<option value="Egitim">Eğitim</option>
								<option value="Ziraat">Ziraat</option>
								<option value="Tip">Tıp</option>
							</select>
						</div>
					</div>




					<div class="form-group">
						<label for="fakulte" class="col-sm-2 control-label">Bolum</label>
						<div class="col-sm-6">
							<select class="form-control" name="bolum">
								<option value="" selected>Bolumler</option>
								<option value="Bilgisayar Muhendisligi">Bilgisayar
									Muhendisligi</option>
								<option value="Malzeme Muhendisligi">Malzeme
									Muhendisligi</option>
								<option value="Istatistik bolumu">Istatistik bolumu</option>
								<option value="Ziraat bolumu">Ziraat bolumu</option>
								<option value="Tip bolumu">Tıp bolumu</option>
							</select>
						</div>
					</div>

					<%
                    try{
                     Connection con2 = null;
                     Statement stm2 = null;
                     ResultSet rs2 = null;

                     ConnectionDB connect = new ConnectionDB();
	                 Connection conn = connect.baglanti();
                
                     String SQL = "select * from ders where dersId in (select ders_dersId from donem, ders_has_akademisyan where akademisyan_akademisyenNo = ? and donem_donemId = donemId and aktifMi = 1);";
                     PreparedStatement pstatement2 = conn.prepareStatement(SQL);
                     pstatement2.setString(1,ogrenciNo);
                
                	 rs2 = pstatement2.executeQuery();
                
                
                
                    
                    %>
					<div class="form-group">
						<label for="fakulte" class="col-sm-2 control-label">Ders
							Kategorisi</label>
						<div class="col-sm-6">
							<select class="form-control" name="dersId">
								<option value="" selected>Ders kategorisi</option>
								<%
                                while(rs2.next()){
                                    
                                %>
								<option value="<%=rs2.getString("dersId")%>">
									<%out.println(rs2.getString("dersAd"));%>
								</option>

								<%
                                }
                                 %>

							</select>
						</div>
					</div>


					<button type="submit" class="btn btn-primary" style="float: right;">Ekle</button>
				</form>

				

			</div>
                                 <%}catch(Exception ex){
                                     out.print(ex);
                                 }
                                 %>

		</div>
		</div>

		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />



		<%@include file="asagiMenu.jsp"%>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
		<script src="dist/js/bootstrap.min.js"></script>
</body>
</html>
<% } else
       response.sendRedirect("index.jsp");

%>