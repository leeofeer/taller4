<?php

	session_start();
	if (!isset($_SESSION['idusuario'])) {
        header("location: login.php");
		exit;
      }
	
	$active_pedidos="active";
	$active_facturas="";
	$active_productos="";
	$active_clientes="";
	$active_usuarios="";	
	$title="Pedidos | SSoftware";
?>
<!DOCTYPE html>
<html lang="en">
  <head>
	<?php include("head.php");?>

  </head>
  <body>
	<?php
	include("navbar.php");
	?>  
    <div class="container">

		<div class="panel panel-info">

            <div class="panel-heading">
                <div class="btn-group pull-right">
                    <a  href="nuevopedido.php" target="_blanck" class="btn btn-info" ><span class="glyphicon glyphicon-plus" ></span> Nuevo Pedido</a>
                </div>

                <h4>Lista de Pedidos</h4>
                <div class="form-group row">

                    <label for="filtroFecha" class="col-md-1 control-label">Filtro Fecha</label>
                    <label class="col-md-1 control-label">Desde</label>
                    <div class="col-md-2">

                        <input type="date" class="form-control" id="desde" min="2018-09-01" value="<?php echo date("Y-m-d");?>">
                    </div>

                    <label class="col-md-1 control-label">Hasta</label>
                    <div class="col-md-2">

                        <input type="date" class="form-control" id="hasta" value="<?php echo date("Y-m-d");?>">
                    </div>

                    <div class="col-md-2">

                        <input type="button" class="btn btn-success" id="buscar" value="Aceptar" onclick="cargarFecha();">
                    </div>
                </div>

            </div>

			<div class="panel-body">

				<div id="grilla-pedido">


				</div>

			<!--	<form class="form-horizontal" role="form" id="datos_cotizacion">
              <a  href="nuevopedido.php" target="_blanck" class="btn btn-info" ><span class="glyphicon glyphicon-plus" ></span> Nuevo Pedido</a>

						<div class="form-group row">
							<label for="q" class="col-md-2 control-label">Cliente o # de Pedido</label>
							<div class="col-md-5">
								<input type="text" class="form-control" id="q" placeholder="Nombre del cliente o # de pedido" onkeyup='load(1);'>
							</div>



							<div class="col-md-3">
								<button type="button" class="btn btn-default" onclick='load(1);'>
									<span class="glyphicon glyphicon-search" ></span> Buscar</button>
								<span id="loader"></span>
							</div>
							
						</div>
				
				
				
			</form> 
		-->
				<div id="resultados"></div><!-- Carga los datos ajax -->
				<div class='outer_div'></div><!-- Carga los datos ajax -->
			</div>
		</div>	
		
	</div>
	<hr>
    <?php
    include("modals/modalVerDetalle.html");
    ?>

	<?php
	include("footer.php");
	?>
	<script type="text/javascript" src="js/pedidos.js"></script>
  </body>
</html>