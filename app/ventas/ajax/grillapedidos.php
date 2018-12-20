<?php
if (isset($_GET['accion']) && $_GET['accion']="cargar") { ?>
	<table class="table table-hover">
		<thead>
			<th>Nro. Pedido</th>
			<th>Fecha</th>
			<th>Estado</th>
			<th>Nombre Cliente</th>
			<th>Usuario</th>
            <th>Acciones</th>
		</thead>				
	<tbody>

<?php 
	include '../../config/dbhandler.php';
	$db = new Database();
	$sql = "";

	//comprobacion de fechas
	if (isset($_POST['condicion']) && $_POST['condicion']=='FECHA'){
	    $desde = $_POST['desde'];
	    $hasta = $_POST['hasta'];
	    $sql = "SELECT * FROM vspedidos WHERE fechapedido BETWEEN '$desde' AND '$hasta'  order by nropedido desc";
    }else{
	    $sql = "SELECT * FROM vspedidos order by nropedido desc";
    }

	$result = $db->query($sql);

	foreach ($result as $r) {
		echo '<tr>';

		echo '<td>';
		echo $r['nropedido'];
		echo '</td>';

		echo '<td>';
		echo $r['fechapedido'];
		echo '</td>';

		echo '<td>';
		echo $r['estado'];
		echo '</td>';

		echo '<td>';
		if ($r['nombrecli']=="") {
			echo '<button class="btn btn-warning id="addclient" onclick="">Agregar Cliente</button>';
		}
		echo $r['nombrecli'];
		echo '</td>';

		echo '<td>';
		echo $r['usuario'];
		echo '</td>';

		echo '<td>';
		if ($r['estado']!="FACTURADO") {
			echo '<button class="btn btn-success" onclick="addDetalle('.$r['idpedido'].')">Agregar Detalle</button>';
		}else{
			echo '<button class="btn btn-success" onclick="verDetalle('.$r['idpedido'].')">Ver Detalle</button>';
		}
		echo '</td>';


        if ($r['estado']!="FACTURADO") {
            echo '<td>';
            echo '<button class="btn btn-warning" onclick="facturar('.$r['idpedido'].')">Facturar</button>';
            echo '</td>';
        }else{

        }


		echo '</tr>';
		}
	}
	echo '</tbody>';
	echo '</table>'; 
?>