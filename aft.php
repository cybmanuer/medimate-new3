<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
     <link rel="stylesheet" type="text/css" href="css/login.css">
    <title>Login</title>
  </head>
  <body>
    <?php
    if($login){
    echo ' <div class="alert alert-success alert-dismissible fade show" role="alert">
        <strong>Success!</strong> You are logged in
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">×</span>
        </button>
    </div> ';
    }
    if($showError){
                   echo "<script>alert(' Email or Password is Wrong.')</script>";
                 }
    ?>

    <div class="center">
        <form action="login.php" method="post">
          
            <h1 align="center"> LOGIN</h1>
    <p align="center">please fill your credentials to log in</p>
    <form method="post">
    <div class="txt_field">
   <input type="text" name="username" id="username" required>
   <span></span>
   <label>USERNAME</label>
    </div>
  
    <div class="txt_field">
   <input type="password" name="password" id="password" required>
   <span></span>
   <label>PASSWORD</label>
    </div>
            <div class="input-group">
            <input type="submit" value="login">
           
            </div>
            <p class="login-register-text">Don't have an account? <a href="register.php">Register Here</a>.</p>
        </form>
    </div>

  </body>
</html>