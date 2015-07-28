<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <script src="dist/js/jsajax1.10.2"></script>

    </head>
    <body>
    <div class="modal hide fade" id="ogrenci" aria-hidden="true">
        <div class="modal-header">

            <h3>Öğrenci Girişi</h3>
        </div>
        <div class="modal-body">
            <form>
                <label>Email</label>
                <input type="email" class="span4" required autofocus/><br/>
                <label>Şifre</label>
                <input type="password" class="span4" required autofocus/><br/><br/>
                <button type="submit" class="btn btn-success">Giriş</button>
                <button type="reset" class="btn">Temizle</button>
            </form>
        </div>

        <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true">Kapat</button>
        </div>
    </div>
    <div class="modal hide fade" id="akademikpersonal" aria-hidden="true">
        <div class="modal-header">

            <h3>Akademik Personal  Girişi</h3>
        </div>
        <div class="modal-body">
            <form>
                <label>Email</label>
                <input type="email" class="span4" required autofocus/><br/>
                <label>Şifre</label>
                <input type="password" class="span4" required autofocus/><br/><br/>
                <button type="submit" class="btn btn-success">Giriş</button>
                <button type="reset" class="btn">Temizle</button>
            </form>
        </div>

        <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true">Kapat</button>
        </div>
    </div>

</body>
</html>

