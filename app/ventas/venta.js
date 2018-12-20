/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function agregar() {
     $("#cboproducto").removeAttr("disabled").trigger("chosen:updated");
    $("#txtcantidad").removeAttr("disabled");
    $("#txtprecio").removeAttr("disabled");
    $("#cbotimbrado").removeAttr("disabled").trigger("chosen:updated");
 //   $("#cbodeposito").removeAttr("disabled").trigger("chosen:updated");
    $("#cbocliente").removeAttr("disabled").trigger("chosen:updated");
    $("#cbousuario").removeAttr("disabled").trigger("chosen:updated");
    $("#cboapertura").removeAttr("disabled").trigger("chosen:updated");
    $("#txtfecha").removeAttr("disabled");

    $("#btngrabar").removeAttr("disabled");
    $("#btncancelar").removeAttr("disabled");
    $("#btnnuevo").attr("disabled", "true");
    $("#btnmodificar").attr("disabled", "true");
    $("#btnborrar").attr("disabled", "true");
    $("#btnsalir").attr("disabled", "true");

    $("#operacion").val("1");
    $.post("autonumerico", {campo: "idfactura_v",   tabla: "factura_venta"})
            .done(function (data) {
                $("#txtcodigo").val(data);
            
            });
    
    $.post("autonumerico", {campo: "nro_factura",   tabla: "factura_venta"})
            .done(function (data) {
                $("#txtnrofactura").val(data);
            
            });   
    $.post("autonumerico", {campo: "idcuenta_acobrar",   tabla: "cuentas_a_cobrar"})
            .done(function (data) {
                $("#txtidcuenta").val(data);
            
            });        
           
    
          
}

function modificar () {
      $("#txtcantidad").removeAttr("disabled");
    $("#cboproducto").removeAttr("disabled").trigger("chosen:updated");
    $("#cbotimbrado").removeAttr("disabled").trigger("chosen:updated");
    $("#cbocliente").removeAttr("disabled").trigger("chosen:updated");
    $("#cbodeposito").removeAttr("disabled").trigger("chosen:updated");


    $("#btngrabar").removeAttr("disabled");
    $("#btncancelar").removeAttr("disabled");
    $("#btnagregar").attr("disabled", "true");
    $("#btnmodificar").attr("disabled", "true");
    $("#btnborrar").attr("disabled", "true");
    $("#btnsalir").attr("disabled", "true");
    $("#operacion").val("2");
}
function borrar() {
      $("#btngrabar").removeAttr("disabled");
    $("#btncancelar").removeAttr("disabled");
    $("#btnnuevo").attr("disabled", "true");
    $("#btnmodificar").attr("disabled", "true");
    $("#btnborrar").attr("disabled", "true");
    $("#btnsalir").attr("disabled", "true");
    $("#operacion").val("3");
}
function cancelar() {
      $("#txtcodigo").val("");
    $("#txtfecha").val("");
    $("#txtnrofactura").val("");
    $("#cboproducto").val("");
    $("#txtpreciov").val("");
    $("#txtcantidad").val("");
    $("#cboapertura").val("");
  //  $("#cbodeposito").val("");
    $("#cbocliente").val("");
    $("#cbotimbrado").val("");
    $("#cbousuario").val("");

    




    $("#cboproducto").attr("disabled", "true").trigger("chosen:updated");
    $("#cbocliente").attr("disabled", "true").trigger("chosen:updated");
    $("#cbousuario").attr("disabled", "true").trigger("chosen:updated");
 //   $("#cbodeposito").attr("disabled", "true").trigger("chosen:updated");
    $("#cbotimbrado").attr("disabled", "true").trigger("chosen:updated");
    $("#cboapertura").attr("disabled", "true").trigger("chosen:updated");
    $("#txtcantidad").attr("disabled", "true");
    $("#txtfecha").attr("disabled", "true");


    $("#grilla tbody").html("");

    $("#btngrabar").attr("disabled", "true");
    $("#btncancelar").attr("disabled", "true");
    $("#btnnuevo").removeAttr("disabled");
    $("#btnmodificar").removeAttr("disabled");
    $("#btnborrar").removeAttr("disabled");
    $("#btnsalir").removeAttr("disabled");
    

}

function grabar() {
    var d = $.trim($("#txtnrofactura").val());
    var c = $.trim($("#txtcodigo").val());
    
    if (d === "" || c === "") {
        alertify.alert('DEBE LLENAR TODOS LOS CAMPOS');
    } else {
        var sql = "";
        var men = "";
        var conf = "";
        var sqlfinal = "";
       
        
         
        if ($("#operacion").val() === "1") {
            sql = "insert into factura_venta values(" + $("#txtcodigo").val() + ", ('" + $("#txtfecha").val()+ "'), '" + $("#cbotimbrado").val() + "', '" + $("#txtnrofactura").val() + "', '" + $("#cbocliente").val() + "', " + $("#cboapertura").val() + "," + $("#cbousuario").val() + ",'" + $("#idestado").val() + "');";
            conf = "DESEA GUARDARLO?";
            men = "LA NUEVA VENTA FUE REGISTRADA CON EXITO";

        }
        if ($("#operacion").val() === "2") {
            sql = "update detalle_factura set idproducto where idfactura_v = " + $("#txtcodigo").val();
            conf = "DESEA ANULAR LA VENTA";
            men = "LA VENTA FUE ANULADA CON EXITO";
        }
        
        
       alertify.confirm(conf, function (e) {
            if (e) {
                sqlfinal = sqlfinal + sql;

                $("#grilla tbody tr").each(function (fila) {
                    var codigo = $("#txtcodigo").val();
                    var depcod = $("#cbodeposito").val();
                    var mercod = "";
                    var cantidad = "";
                    var costo = $("#txtpreciov")
                    $(this).children("td").each(function (columna) {
                        if (columna === 0) {
                            mercod = $(this).text();
                        }
                        if (columna === 2) {
                            cantidad = $(this).text();
                        }
                        if (columna === 3) {
                            costo = $(this).text();
                        }
                    });
                    if ($("#operacion").val() === "1") {
                        var sqldet = "insert into detalle_factura values("  + codigo + "," + mercod + "," + depcod + "," + cantidad + "," + costo + ");";
                        //alertify.alert(sqldet);
                        sqlfinal = sqlfinal + sqldet;
                    }
                    

                });
                alertify.alert(sqlfinal);
                $.post("operaciones_bd", {sql: sqlfinal, men: men})
                        .done(function (mensajefinal) {
                            alertify.alert(mensajefinal);
                        cancelar();
                        });
            }
        });
    }
}
function get_detalles(filtro) {
    var sql = "select * from calculoimpuesto where idfactura_v = " + filtro + " order by idproducto";
    $.post("calcular_impuesto", {sql: sql})
            .done(function (data) {
                $("#grilla tbody").html(data);
            });
}
function get_detalles_ven(filtro) {
    var sql = "select * from mirar where idfactura_v = " + filtro + " order by descripcion";
    $.post("traer_detalles", {sql: sql})
            .done(function (data) {
              $("#grilla tbody").html(data);
              calcularTotales();
            });
    
}

function eliminarFilas(contenedor) {
    $(contenedor).remove();
    calcularTotales();
}

function selectproductoss(){
    var datos = $('#cboproducto').val();
    var separado = datos.split('-');
    $('#txtpreciov').val(separado[1]);
    
}


function calcularTotales() {
    var exe = 0;
    var g5 = 0;
    var g10 = 0;

    $("#grilla tbody tr").each(function (fila) {
        $(this).children("td").each(function (col) {
            if(col === 4){
                exe = exe + parseInt($(this).text());
            }
            if(col === 5){
                g5 = g5 + parseInt($(this).text());
            }
            if(col === 6){
                g10 = g10 + parseInt($(this).text());
            }
        });
    });
    
    
    
    var totales = "<tr>";
    totales += "<th colspan=\"4\">SUB TOTALES</th>";
    totales += "<th>"+exe+"</th>";
    totales += "<th>"+g5+"</th>";
    totales += "<th>"+g10+"</th>";
    totales += "<th></th>";
    totales += "</tr>";
    
    totales += "<tr>";
    totales += "<th colspan=\"5\">LIQUIDACION DE IVA</th>";
    totales += "<th>"+Math.round((g5/21))+"</th>";
    totales += "<th>"+Math.round((g10/11))+"</th>";
    totales += "<th></th>";
    totales += "</tr>";
    
    totales += "<tr>";
    totales += "<th colspan=\"6\">TOTAL DE IVA</th>";
    totales += "<th>"+Math.round((g5/21)+(g10/11))+"</th>";
    totales += "<th></th>";
    totales += "</tr>";
    
    totales += "<tr class=\"danger\">";
    totales += "<th colspan=\"6\"><h4>TOTAL GENERAL</h4></th>";
    totales += "<th><h4>"+(exe+g5+g10)+"</h4></th>";
    totales += "<th><h4></h4></th>";
    totales += "</tr>";

    $("#grilla tfoot").html(totales);
}


function editarValorGrilla(campo){
    alertify.prompt("INGRESE VALOR", function(evt){
        if(evt){
            //alertify.alert($("#alertify-text").val());
            campo.text($("#alertify-text").val());
            calcularSubtotales();
            calcularTotales();
        }
    });
}

function calcularSubtotales(){
    $("#grilla tbody tr").each(function(fila){
        var cantidad = 0;
        var costo = 0;
        $(this).children("td").each(function(col){
            if(col === 2){
                cantidad = parseInt($(this).text());
            }
            if(col === 3){
                costo = parseInt($(this).text());
            }
            if(col === 4){
                if(parseInt($(this).text())>0){
                    $(this).text(cantidad*costo);
                }
            }
            if(col === 5){
                if(parseInt($(this).text())>0){
                    $(this).text(cantidad*costo);
                }
            }
            if(col === 6){
                if(parseInt($(this).text())>0){
                    $(this).text(cantidad*costo);
                }
            }
            
        });
    });
}
$(function () {
    
    selectproductoss();
 $("chosen-select").chosen({width: "100%"});

    get_detalles_ven($('#cboproducto').val());

    $("#txtcantidad").keypress(function (evt) {
        if (evt.which === 13) {
            //alertify.alert("pulsó enter");
            var codigo = $("#cboproducto").val();
            var descri = $("#cboproducto option:selected").html();
            var cantidad = $("#txtcantidad").val();
            var repetido = false;
            var cod = "";

            $("#grilla tbody tr").each(function (fila) {
                $(this).children("td").each(function (col) {
                    if (col === 0) {
                        cod = $(this).text();
                    }
                });
                if (parseInt(cod) === parseInt(codigo)) {
                    repetido = true;
                }
            });

            if (repetido) {
                alertify.alert("ESTA MERCADRIA YA FUE SELECCIONADA");
            } else {
                if (parseInt(cantidad) > 0) {
                    var datos = $('#cboproducto').val();
                    var separado = datos.split('-');
                    var preciou = parseInt(separado[1]);
                    var exe = 0;
                    var g5 = 0;
                    var g10 = 0;
                    
                    if(separado[2]==='3'){
                        exe = preciou * cantidad;
                        g5 = 0;
                        g10 = 0;
                    }
                    if(separado[2]==='1'){
                        exe = 0;
                        g5 = preciou * cantidad;
                        g10 = 0;
                    }
                    if(separado[2]==='2'){
                        exe = 0;
                        g5 = 0;
                        g10 = preciou * cantidad;
                    }
                    
                    $("#grilla > tbody:last").append('<tr><td>' + separado[0] + '</td><td>' + descri + '</td><td>' + cantidad + '</td><td>' + preciou + '</td><td>' + exe + '</td><td>' + g5 + '</td><td>' + g10 + '</td><td onclick="eliminarFilas($(this).parent());">Eliminar</td></tr>');
                    calcularSubtotales();
                    calcularTotales();
                } else {
                    alertify.alert("LA CANTIDAD DEBE SER MAYOR A CERO");
                }
            }
            //alertify.alert(descri);
        }
    });
});

