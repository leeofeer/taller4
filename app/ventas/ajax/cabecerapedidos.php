<?php

include '../../config/dbhandler.php';

$db=new Database();

	if ($_GET['action']=="cabecera") {
		$result = $db->query($_POST['sql']);
		foreach ($result as $r) {
			echo $r['id'];
		}
		
	}

	if ($_GET['action']=="clientes") {
		$result = $db->query($_POST['sql']);
    	$clientes = $result->fetchAll(PDO::FETCH_ASSOC);
    	echo json_encode($clientes);
		
	}

	if ($_GET['action']=="productos") {
		$result = $db->query($_POST['sql']);
    	$productos = $result->fetchAll(PDO::FETCH_ASSOC);
    	echo json_encode($productos);
		
	}

	if ($_GET['action']=="precio") {
		$result = $db->query($_POST['sql']);
    	$precio = $result->fetchAll(PDO::FETCH_ASSOC);
    	$resultado = 0;
    	foreach ($precio as $p) {
    		$resultado = $p['precio'];
    	}
    	echo $resultado;
		
	}