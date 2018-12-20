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
    $title="Pedidos Nuevo| SSoftware";
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <?php include("head.php");?>
    </head>

    <body>
        <?php include("navbar.php");?> 

    <div class="container">
        <div class="panel panel-info">
        <div class="panel-heading">
            <h4><i class=''></i>Nuevo Pedido</h4>
        </div>
            
        
        <div id="cabecera" >
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <div class="col-md-1">
                            <label class="control-label" for="idpedido">Código</label>
                        </div>

                        <div class="col-md-1">
                            <input type="text" class="form-control " name="idpedido" id="idpedido"  readonly="" />
                            <input  type="hidden" value="PENDIENTE" name="estado" id="estado" class="form-control" />
                        </div>
                            
                        <div class="col-md-1">
                                <label class="control-label" for="fecha">Fecha</label>
                        </div>

                        <div class="col-md-2">
                          <input type="text" class="form-control" name="fecha" id="fecha" value='<?php echo date("j-n-Y")?>' readonly="" />

                        </div>

                        <div class="col-md-1">
                            <label class="control-label" for="nropedido">Nro.</label>
                        </div>

                        <div class="col-md-2">
                            <input type="text" class="form-control" name="nropedido" id="nropedido" value="" placeholder="Autogenerado" readonly="" />
                        </div>
                        <div class="col-md-3">
                            <input type="text" class="form-control" name="cliente" id="cliente" placeholder="Nombre Cliente" required="" disabled="">

                        </div>

                        <div class="col-md-2">
                            <input type="hidden" id="idusuario" name="idusuario" value="<?php echo $_SESSION['idusuario'];?>" readonly="" class="form-control">
                               <input type="text" name="usuario" placeholder="<?php echo $_SESSION['usuario'];?>" readonly="" class="form-control">
                        </div>
                    </div>
                </div>  
            </div>
        </div> 
    </div>      
    

    <div class="panel panel-primary">
        <div class="panel-heading"><strong>Detalles</strong></div>
            <div class="panel-body">
                <div class="form-group">
                    <div class="col-md-1">
                        <label class="control-label" for="producto">Producto</label>
                    </div>
                    <div class="col-md-5">
                        <select class="form-control " name="producto" id="idproducto" disabled="" onchange="cargarPrecio();">
                                           
                        </select>
                    </div>
                    <div class="col-md-1">
                        <label class="control-label" for="precio">Precio</label>
                    </div>
                    <div class="col-md-2">
                        <input type="number" class="form-control" name="preciov" id="preciov" readonly="" />
                    </div>
                    <div class="col-md-1">
                        <label class="control-label" for="cantidad">Cantidad</label>
                    </div>
                    <div class="col-md-2">
                        <input type="number" class="form-control" name="cantidad" id="cantidad" disabled="" />
                    </div>

                </div>
                                        
                <table class="table table-hover" id="grilla">
                    <thead>
                        <tr class="warning">
                            <th>Código</th> 
                            <th>Descripción</th>
                            <th>Cantidad</th>
                            <th>Precio U.</th>
                            <th>Exenta</th>
                            <th>Grav 10%</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th colspan="3">SUB TOTALES</th>
                            <th class="sbt tfoot-body"></th>
                        </tr>
    
                        <tr>
                            <th colspan="5">LIQUIDACION DE IVA</th>
                            <th class="liqui-iva tfoot-body"></th>
                        </tr>
    
                        <tr>
                            <th colspan="5">TOTAL DE IVA</th>
                            <th class="total-iva tfoot-body"></th>
                        </tr>
    
                        <tr class="danger">
                            <th colspan="6"><h4>TOTAL GENERAL</h4></th>
                            <th class="total tfoot-body"><h4></h4></th>

                        </tr>

                    </tfoot>

                </table>    
            </div>
    </div>
    
    <div class="form-group">

        <div class="col-md-2">
            <input id="btnnuevo" type="button" class="form-control btn-primary" value="Nuevo" onclick="nuevo();"/>
        </div>
        <div class="col-md-2">
            <input id="btngrabar" type="button" class="form-control btn-success" value="Grabar" disabled="" onclick="grabar('PENDIENTE');"/>
        </div>
        <div class="col-md-3">
            <input id="btngrabarfactura" type="button" class="form-control btn-warning" value="Grabar & Facturar" disabled="" onclick="grabar();"/>

        </div>

        <div class="col-md-3">
            <input id="btncancelar" type="button" class="form-control btn-alert" value="cancelar" onclick="cancelar();"/>
        </div>

        <div class="col-md-2">

            <a href="index.php"><input id="btnsalir" type="button" class="form-control btn-default" value="Volver"></a>
            
        </div>
    </div>
</div>
    <hr> 
    <?php
    include("footer.php");
    ?>
        <script src="js/nuevopedido.js"></script>
        <script src="js/pedidoventadetalle.js"></script> 
    </body>
</html>
