<%-- 
    Document   : ventas
    Created on : 28-nov-2017, 13:49:41
    Author     : Martin
--%>

<%@page import="prg.Metodo"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="prg.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Joyeria</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <!-- Favicon -->
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.min.css">
    <!-- Fonts from Font Awsome -->
    <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/alertify.min.css">
    <link rel="stylesheet" type="text/css" href="css/alertify.core.css">
    <link rel="stylesheet" type="text/css" href="css/alertify.default.css">
    <!-- CSS Animate -->
    <link rel="stylesheet" href="css/animate.css">
    <!-- Custom styles for this theme -->
    <link rel="stylesheet" href="css/main.css">
    <!-- iCheck-->
    <link rel="stylesheet" href="plugins/icheck/css/_all.css">
    <!-- Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,900,300italic,400italic,600italic,700italic,900italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
    <!-- Feature detection -->
    <script src="js/modernizr-2.6.2.min.js"></script>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="assets/js/html5shiv.js"></script>
    <script src="assets/js/respond.min.js"></script>
    <![endif]-->
    </head>
    <body>
        <body>
    <section id="container">
         
        <header id="header">
            <!--logo start-->
            <div class="brand">
                <a class="logo"><span>Joyeria</span>San</a>
                
            </div>
            <!--logo end-->
            <div class="toggle-navigation toggle-above">
                <button type="button" class="btn btn-default" id="toggle-left" data-toggle="tooltip" data-placement="right" title="Pantalla Completa">
                  
                    <i class="fa fa-bars"></i>
                     
                </button>
                <img src="img/Captura.PNG" border="0" width="1050" height="75">
            </div>
            
        </header>
         
        <!--sidebar start-->
        <aside class="sidebar">
            <div id="leftside-navigation" class="nano">
                <ul class="nano-content">
                    
                    <li class="sub-menu">
                        <a href="javascript:void(0);"><i class="fa fa-cogs"></i><span>Menu</span><i class="arrow fa fa-angle-right pull-right"></i></a>
                        <ul>
                  <li><a href="ultimasfacturas.jsp"><i class=""></i>&nbsp;&nbsp; Facturas</a></li>

                        </ul>
                    </li>
                 
                  
                    
                    <script LANGUAGE="JavaScript">
                        function ponerMayuscula (nombre) {
                            nombre.value=nombre.value.toUpperCase();
                        }    
                    </script>
                    
                    
                </ul>
            </div>

        </aside>
        <!--sidebar end-->
        <!--main content start-->
        <section class="main-content-wrapper">
            <section id="main-content">
                <div class="row">
                    <div class="col-md-12">
                        <!--breadcrumbs start -->
                        <ul class="breadcrumb">
                            <li><a href="#">Movimiento</a>
                            </li>
                           
                            <h1 class="h1">Factura Venta</h1>
                      
                        </ul>
                        <!--breadcrumbs end -->
                       
                    </div>
                </div>
                <div class="row">
                    
                      <div class="container-fluid">
            <div class="container-flat-form">
              
                
              <div class="row">
                <div class="col-md-12">
                  <form action="operaciones_bd" method="post" class="form-horizontal">  
                      <div class="form-group">
                          <div class="col-md-1">
                                <label class="control-label" for="codigo">Código</label>
                            </div>
                          <div class="col-md-1">
                                <input type="text" class="form-control" name="txtcodigo" id="txtcodigo"  disabled/>
                            </div>
                         <input  type="hidden" value="PENDIENTE" name="idestado" id="idestado" class="form-control" placeholder="&#128272; Autoincrementable" disabled/>

                          
                          <div class="col-md-1">
                                <label class="control-label" for="fecha">Fecha Venta</label>
                            </div>
                            <div class="col-md-2">
                          <input type="date" class="form-control" name="txtfecha" id="txtfecha" value="<%= Metodo.formatoFecha(new java.util.Date())%>" disabled/>

                            </div>
                          <div class="col-md-1">
                                <label class="control-label" for="nrofactura">Nro. Factura</label>
                            </div>
                            <div class="col-md-2">
                                <input type="text" class="form-control" name="txtnrofactura" id="txtnrofactura" placeholder="Autogenerado" disabled/>
                            </div>
                          <div class="col-md-1">
                                <label class="control-label" for="timbrado">Timbrado</label>
                            </div>
                            <div class="col-md-2">
                                <select class="form-control" name="cbotimbrado" id="cbotimbrado" disabled="">
                                    <%
                                        Conexion cn = new Conexion();
                                        cn.conectar();
                                        ResultSet tim = cn.consultar("select * from timbrado order by idtimbrado");
                                        while (tim.next()) {
                                    %>
                                    <option value="<%= tim.getString("idtimbrado")%>"><%= tim.getString("descripcion")%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                        </div>
                                
                            <div class="form-group">
                            <div class="col-md-1">
                                <label class="control-label" for="cbocliente">Cliente</label>
                            </div>
                            <div class="col-md-3">
                                <select class="form-control chosen-select" name="cbocliente" id="cbocliente" disabled>
                                    <%
                                        ResultSet rsoc = cn.consultar("select * from clientes order by idcliente");
                                        while (rsoc.next()) {
                                    %>

                                    <option value="<%= rsoc.getString("idcliente")%>"><%= rsoc.getString("nombre")%></option>     

                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                                 <div class="col-md-1">
                                <label class="control-label" for="usuario">Usuario</label>
                            </div>
                             <div class="col-md-3">
                                <select class="form-control chosen-select" name="cbousuario" id="cbousuario" disabled>
                                    <%
                                        ResultSet rusu = cn.consultar("select * from usuario order by idusuario");
                                        while (rusu.next()) {
                                    %>

                                    <option value="<%= rusu.getString("idusuario")%>"><%= rusu.getString("usuario")%></option>     

                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                       
                            <div class="col-md-1">
                                <label class="control-label" for="cbodeposito">Deposito</label>
                            </div>
                            <div class="col-md-3">
                                <select class="form-control chosen-select" name="cbodeposito" id="cbodeposito" >
                                    <%
                                        ResultSet dep = cn.consultar("select * from deposito order by iddeposito");
                                        while (dep.next()) {
                                    %>

                                    <option value="<%= dep.getString("iddeposito")%>"><%= dep.getString("descripcion")%></option>     

                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                                
                            </div>
                            <div class="form-group">
                        <div class="col-md-1">
                                <label class="control-label" for="apertura">Apertura</label>
                            </div>
                            <div class="col-md-2">
                                <select class="form-control" name="cboapertura" id="cboapertura" disabled="">
                                    <%
                                        Conexion ap = new Conexion();
                                        ap.conectar();
                                        ResultSet m = ap.consultar("select * from apertura_cierre order by id_apertura");
                                        while (m.next()) {
                                    %>
                                    <option value="<%= m.getString("id_apertura")%>"><%= m.getString("fecha_apertura")%></option>
                                    <%
                                        }
                                    %>
                                </select>
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
                                        <select class="form-control chosen-select" name="cboproducto" id="cboproducto" disabled onchange="selectproductoss();">
                                             <%
                                                ResultSet rsmercaderias = cn.consultar("select * from precioproductos order by idproducto");
                                                while (rsmercaderias.next()) {
                                            %>

                                            <option value="<%= rsmercaderias.getString("idprecio")%>"><%= rsmercaderias.getString("descripcion")%></option>


                                            <%
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="col-md-1">
                                        <label class="control-label" for="precio">Precio</label>
                                    </div>
                                    <div class="col-md-2">
                                        <input type="number" class="form-control" name="txtpreciov" id="txtpreciov" disabled/>
                                    </div>
                                    <div class="col-md-1">
                                        <label class="control-label" for="cantidad">Cantidad</label>
                                    </div>
                                    <div class="col-md-2">
                                        <input type="number" class="form-control" name="txtcantidad" id="txtcantidad"/>
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
                                            <th>Grav 5%</th>
                                            <th>Grav 10%</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
    

                                    </tbody>
                                    <tfoot>

                                    </tfoot>
                                </table>      
                            </div>
                 </div>
                           <div class="form-group">

                            <div class="col-md-2">
                                <input id="btnnuevo" type="button" class="form-control btn-primary" value="Nuevo" onclick="agregar();"/>
                            </div>
                            <div class="col-md-2">
                                <input id="btnmodificar" type="button" class="form-control btn-warning" value="Modificar" onclick="modificar();"/>
                            </div>
                            <div class="col-md-2">
                                <input id="btnborrar" type="button" class="form-control btn-danger" value="Anular" onclick="borrar();"/>
                            </div>
                            <div class="col-md-2">
                                <input id="btncancelar" type="button" class="form-control btn-info" value="Cancelar" disabled="" onclick="cancelar();"/>
                            </div>
                            <div class="col-md-2">
                                <input id="btngrabar" type="button" class="form-control btn-success" value="Grabar" disabled="" onclick="grabar();"/>
                            </div>
                            <div class="col-md-2">
                                <a href="MENUP.jsp"><input id="btnsalir" type="button" class="form-control btn-default" value="Salir"></a>
                            </div>


                        </div> 
                              
                                              

                            </div>
                        </div>            
                                        
                                        
             
                                        
                </div>
     
            </div>
                 <input type="hidden" id="operacion"/>
            </div>
        </div>
       
       
    </div>
            
    <script src="js/jquery-1.10.2.min.js"></script>
    <script src="plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="plugins/waypoints/waypoints.min.js"></script>
    <script src="js/application.js"></script>
    <script src="plugins/icheck/js/icheck.min.js"></script>
    <script src="plugins/validation/js/jquery.validate.min.js"></script>
    <script src="plugins/validation/js/jquery.validate.min.js"></script>
    <script src="js/jquery-1.12.2.min.js"></script> 
        <script src="js/bootstrap.min.js"></script> 
        <script src="js/chosenselect.js"></script> 
           <script src="js/alertify.js"></script> 

       <script src="venta.js"></script> 
    </body>
</html>
