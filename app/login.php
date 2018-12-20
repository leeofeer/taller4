<?php
if ($_SERVER['REQUEST_METHOD'] != "POST") {
    ?>


    <!DOCTYPE html>
    <html lang="en">
    <head>
        <title>Login::LomiSoft</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="./resources/vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="./resourcesfonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="./resourcesfonts/iconic/css/material-design-iconic-font.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="./resources/vendor/animate/animate.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="./resources/vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="./resources/vendor/animsition/css/animsition.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="./resources/vendor/select2/select2.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="./resources/vendor/daterangepicker/daterangepicker.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="./resources/css/util.css">
        <link rel="stylesheet" type="text/css" href="./resources/css/main.css">

    </head>


    <body>

    <div class="limiter">
        <div class="container-login100">
            <div class="wrap-login100">
					<span class="login100-form-title p-b-26">
						Bienvenido
					</span>
                <span class="login100-form-title p-b-48">
						<i class="zmdi zmdi-font"></i>
					</span>
                <form id="acceder" method="post">
                    <div class="wrap-input100 validate-input">
                        <input class="input100" type="hidden" name="accion" value="login" id="accion">

                        <input class="input100" type="text" name="user" placeholder="Username" id="user">

                    </div>

                    <div class="wrap-input100 validate-input">
                        <input class="input100" type="password" placeholder="Password" name="pass" id="pass">

                    </div>


                    <div class="text-center p-t-10" style="display:none;" id="error">
						<span class="txt1">
						Credenciales incorrectas. Reintente
						</span>
                    </div>
                </form>
                <div class="container-login100-form-btn">
                    <div class="wrap-login100-form-btn">
                        <div class="login100-form-bgbtn"></div>
                        <button class="login100-form-btn" onclick="login()">
                            Acceder
                        </button>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <script src="./resources/js/jquery.min.js"></script>
    <script src="./resources/js/bootstrap.min.js"></script>
    <script src="./login.js"></script>


    </body>
    </html>
    <?php
} else {
    require 'config/dbhandler.php';
    $db = new Database();

    if ($_POST['accion'] == "login") {
        $sql = "SELECT idusuario, usuario, passwrd, idnivel, nivel, nombres, idempleado FROM vsusuario
				WHERE usuario='" . $_POST['user'] . "' AND passwrd='" . $_POST['pass'] . "'";
        $result = $db->query($sql);
        $access = false;
        foreach ($result as $r) {
            if (count($r) > 0) {
                $access = true;
                session_start();
                $_SESSION['idusuario'] = $r['idusuario'];
                $_SESSION['usuario'] = $r['usuario'];
                $_SESSION['idnivel'] = $r['idnivel'];
                $_SESSION['nivel'] = $r['nivel'];
                $_SESSION['nombres'] = $r['nombres'];
                $_SESSION['idempleado'] = $r['idempleado'];


            }

        }

        if ($access == false) {
            echo 'denied';
        } else {
            echo $_SESSION['nivel'];
        }
    }

}
?>