<?php
session_start();
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: login.php");
    exit;
}
$id = $_SESSION["id"];
require_once "inc/config.php";
$new_password = $confirm_password = "";
$new_password_err = $confirm_password_err = "";
if($_SERVER["REQUEST_METHOD"] == "POST"){
    if(empty(trim($_POST["new_password"]))){
        $new_password_err = "please enter the new password";
    } elseif(strlen(trim($_POST["new_password"])) < 6){
        $new_password_err = "password must have at least 6 characters";
    } else{
        $new_password = trim($_POST["new_password"]);
    }
    if(empty(trim($_POST["confirm_password"]))){
        $confirm_password_err = "please confirm the password";
    } else{
        $confirm_password = trim($_POST["confirm_password"]);
        if(empty($new_password_err) && ($new_password != $confirm_password)){
            $confirm_password_err = "password did not match";
        }
    }
    if(empty($new_password_err) && empty($confirm_password_err)){
        $sql = "UPDATE users SET password = ? WHERE id = ?";
        if($stmt = mysqli_prepare($link, $sql)){
            mysqli_stmt_bind_param($stmt, "si", $param_password, $param_id);
            $param_password = password_hash($new_password, PASSWORD_DEFAULT);
            $param_id = $_SESSION["id"];
            if(mysqli_stmt_execute($stmt)){
                session_destroy();
                header("location: login.php");
                exit();
            } else{
                echo "something went wrong...";
            }
            mysqli_stmt_close($stmt);
        }
    }
    mysqli_close($link);
}
?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>DKC wallbox</title>
		<meta charset="utf-8" />
		<meta content="IE=edge" http-equiv="X-UA-Compatible" />
		<meta content="width=device-width, initial-scale=1" name="viewport" />
		<link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/reset.css" rel="stylesheet">
		<link href="favicon.ico" rel="icon" type="image/x-icon" />
		<link href="favicon.png" rel="icon" type="image/png" />
	</head>
	<body>
    <nav class="navbar navbar-expand-md navbar-dark sticky-top bg-dark">
			<img src="img/dkc.png" width="54" height="30" class="ms-2">
      <div class="navbar-brand ms-3" href="#">wallbox webserver</div>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ms-auto">
					<li class="nav-item">
						<a class="nav-link" href="login.php">back</a>
					</li>
          <li class="nav-item">
            <a class="nav-link disabled" href="#">add user</a>
          </li>
					<li class="nav-item me-2">
            <a class="nav-link active" href="logout.php">sign out</a>
          </li>
        </ul>
      </div>
    </nav>
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-4">
          <h3 class="display-6">RESET PASSWORD</h3>
					<form class="form-signin" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
			      <div class="form-floating <?php echo (!empty($new_password_err)) ? 'has-error' : ''; ?>">
			        <input type="password" name="new_password" class="form-control" placeholder="new password" id="floatingPassword" value="<?php echo $new_password; ?>">
			        <label for="new_password" class="sr-only">new password</label>
			        <span class="help-block"><?php echo $new_password_err; ?></span>
			      </div>
			      <div class="form-floating <?php echo (!empty($confirm_password_err)) ? 'has-error' : ''; ?>">
			        <input type="password" name="confirm_password" class="form-control" placeholder="confirm password" id="floatingPassword">
			        <label for="password" class="sr-only">confirm password</label>
			        <span class="help-block"><?php echo $confirm_password_err; ?></span>
			      </div>
			        <button class="w-100 btn btn-lg btn-primary my-2" type="submit">submit</button>
							<a class="w-100 btn btn-lg btn-secondary" href="login.php">cancel</a>
			    </form>
				</div>
			</div>
		</div>
		<script src="js/jquery.slim.min.js"></script>
		<script src="js/bootstrap.bundle.min.js"></script>
	</body>
</html>