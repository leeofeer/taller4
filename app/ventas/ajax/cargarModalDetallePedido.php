<?php
/**
 * Created by PhpStorm.
 * User: Leo Fernandez
 * Date: 17/12/2018
 * Time: 19:11
 */

include '../../config/dbhandler.php';

$db=new Database();

if ($_GET['action']=="detallePedido") {
    $query = $db->query($_POST['sql']);
    $detalles = $query->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($detalles);

}