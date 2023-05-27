<?php 
include"connection.php";
include"session.php";

//$UserID=1;
date_default_timezone_set('Asia/Calcutta');
$timestamp =date('y-m-d H:i:s');
$Date = date('Y-m-d',strtotime($timestamp));


?>

<!doctype html>
    <html lang="en">

    <head>

        <meta charset="utf-8" />
        <title>Login</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
        <meta content="Themesdesign" name="author" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="assets/images/cyruslogo.png">

        <!-- Bootstrap Css -->
        <link href="assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
        <!-- Icons Css -->
        <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <!-- App Css-->
        <link href="assets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />
        <link href="assets/libs/sweetalert2/sweetalert2.min.css" rel="stylesheet" type="text/css" />

    </head>

    <body class="authentication-bg d-flex align-items-center min-vh-100 py-5">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="text-center">
                        <a href="" class="d-block auth-logo" style="margin-top:-20px; margin-bottom:-20px; margin-right: 150px;">
                            <img src="assets/images/cyruslogo.png" alt="" height="45" class="logo logo-dark mx-auto">
                            <img src="assets/images/cyruslogo.png" alt="" height="45" class="logo logo-light mx-auto">
                            
                        </a><h1 style="margin-top:-40px;">CYRUS</h1>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-md-8 col-lg-6 col-xl-5 ">
                    <div class="p-4">
                        <div class="card overflow-hidden mt-2 ">
                            <div class="auth-logo text-center bg-primary position-relative">
                                <div class="img-overlay"></div>
                                <div class="position-relative pt-4 py-5 mb-1">
                                    <h5 class="text-white">Welcome Back !</h5>
                                    <p class="text-white-50 mb-0">Sign in to continue to Cyrus.</p>
                                </div>
                            </div>
                            <div class="card-body position-relative ">
                                <div class="p-4 mt-n5 card rounded">
                                    <form class="form-horizontal rounded-corner" action="">

                                        <div class="mb-3">
                                            <label for="username" class="form-label">Username</label>
                                            <input type="text" class="form-control rounded-corner" name="username" id="username" placeholder="Enter username">
                                        </div>

                                        <div class="mb-3">
                                            <label for="userpassword">Password</label>
                                            <input type="password" class="form-control rounded-corner" name="Password" id="password" placeholder="Enter password">        
                                        </div>

                                        <div class="mt-3">
                                            <button type="button" class="btn btn-primary w-100 waves-effect waves-light Login">Log IN</button>
                                        </div>

                                        <div class="mt-4 text-center" >
                                            <a href="arecoverpw.php" class="text-muted"><i class="mdi mdi-lock me-1"></i> Forgot your password?</a>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <div class="mt-5 text-center">
                            <p>© <script>document.write(new Date().getFullYear())</script> Cyrus Electronics</p>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <!-- JAVASCRIPT -->
        <script src="assets/libs/jquery/jquery.min.js"></script>
        <script src="assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/libs/metismenu/metisMenu.min.js"></script>
        <script src="assets/libs/simplebar/simplebar.min.js"></script>
        <script src="assets/libs/node-waves/waves.min.js"></script>
        <script src="assets/js/app.js"></script>
        <script src="assets/libs/sweetalert2/sweetalert2.min.js"></script>
        <script type="text/javascript">
//
function err(msg){
    Swal.fire({
        title: 'error!',
        text: msg,
        icon: 'error',

    })
}


$(document).on('click', '.Login', function(){

    var username=document.getElementById("username").value;
    username = username.replace(/\\/g, "/");

    var Password=document.getElementById("password").value;
    Password = Password.replace(/\\/g, "/");
    if(username && Password){

        if (username.indexOf('%') > -1){
            err("Do not use % sign in user name");
      }else if (Password.indexOf('%') > -1){
          err("Do not use % sign in password");
      }else if((username.indexOf("/") > -1)){
        err("Do not use forwardslash or backslash in user name");
    }else if((Password.indexOf("/") > -1)){
        err("Do not use forwardslash or backslash in Password");
    }else{

        $.ajax({
          type:'POST',
          url:'verification.php',
          data:{'UserName':username, 'Password':Password},
          success:function(result){
            if (result==1) {
                location.href = "route.php";
            }else{
                err(result);
            }

        }
    }); 
    }
}
});
</script>

</body>
</html>
