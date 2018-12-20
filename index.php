<?php

if (!isset($_SESSION['idusuario'])) {
	header("Location: app/login.php");
}else{
	header("Location: app/init.php");
}