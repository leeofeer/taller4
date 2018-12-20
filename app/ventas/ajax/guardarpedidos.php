<?php
include "../../config/dbhandler.php";
$db = new Database();


if ($_GET['accion']=="guardarPedido") {
	$insert = $db->query($_POST['sql']);
	if($insert){
		echo $_POST['id'];
	}
}

if ($_GET['accion']=="guardarDetalle") {

    $insertDetalle = $db->query($_POST['sql']);
    if($insertDetalle){
        echo 'GUARDADO';
    }
}