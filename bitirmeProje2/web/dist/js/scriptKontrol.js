
$(document).ready(function() {
    //listens for typing on the desired field
    $("#email").keyup(function() {
        //gets the value of the field
        var email = $("#email").val();
        $("#emailError").html('<img alt="" src="/images/loader.gif" />');

 
        //here is where you send the desired data to the PHP file using ajax
        $.post("AkadmeiyenEmailKontrol", {email:email},
            function(result) {
                if(result == 1) {
                    //the email is available
                    $("#emailError").html("Uygundur");
                }
                if(result == 0) {
                    //the email is not available
                    $("#emailError").html("Bu eposta kullanılmaktadır");
                }
            });
     });
})