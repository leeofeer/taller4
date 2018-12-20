$(document).ready(function(){
    $(".chosen-select").chosen({no_results_text:'No hay resultados para '});

});

function nuevo() {
    
    cargarIdPedido();
    cargarNroPedido();
    cargarCliente();
    cargarProductos();
    $("#cantidad").prop("disabled", false);
    $("#btngrabar").prop("disabled", false);
    $("#btngrabarfactura").prop("disabled", false);
    $("#btnnuevo").prop("disabled", true);
    $("#cliente").prop("disabled", false);
    $("#cliente").focus();
}

function cancelar(){
    $("#btnnuevo").prop("disabled", false);
    $("#btngrabar").prop("disabled", true);
    $("#btngrabarfactura").prop("disabled", true);
    $("#idpedido").val("");
    $("#cliente").val("");
    $("#nropedido").val("");
    $("#idproducto").empty();
    $("#idproducto").trigger("chosen:updated");
    $("#idproducto").prop("disabled", true);
    $("#preciov").val("");
    $("#cantidad").val("");
    $("#cantidad").prop("disabled", true);
    $("#grilla tbody tr").remove();
    $("#grilla tfoot .tfoot-body").html("");
    
    
}


function cargarIdPedido(){
    $.ajax({
        url: "ajax/cabecerapedidos.php?action=cabecera",
        method: "post",
        data: {sql: "SELECT COALESCE(MAX(id),0)+1 AS id FROM pedidos"} ,
        success: function(data){
            $("#idpedido").val(data);
            console.log(data);
        }
    });
}

function cargarNroPedido(){
    $.ajax({
        url: "ajax/cabecerapedidos.php?action=cabecera",
        method: "post",
        data: {sql: "SELECT COALESCE(MAX(nropedido),0)+1 AS id FROM pedidos"} ,
        success: function(data){
            $("#nropedido").val(data);
            console.log(data);
        }
    });
}

function cargarCliente(){
    $.ajax({
        url: "ajax/cabecerapedidos.php?action=clientes",
        method: "post",
        dataType:"json",
        data: {sql: "SELECT * FROM vsclientes"} ,
        
        success: function(data){
            $.each(data, function(i, v){
                var markup = '<option value="'+v.id+'"> '+v.razonsocial+' </option>';
                console.log(markup);
                $("#idcliente").append(markup);

            });
            $("#idcliente").prop("disabled", false);
            $("#idcliente").trigger("liszt:updated");
            $("#idcliente").chosen({ width: "95%" });
        }
    });
}

function cargarProductos(){
    $.ajax({
        url: "ajax/cabecerapedidos.php?action=productos",
        method: "post",
        dataType:"json",
        async: false,
        data: {sql: "SELECT id, descripcion FROM vsproductos"} ,
        
        success: function(data){
            $.each(data, function(i, v){
                var markup = '<option value="'+v.id+"-"+v.descripcion+'"> '+v.descripcion+' </option>';
                console.log(markup);
                $("#idproducto").append(markup);

            });
            $("#idproducto").prop("disabled", false);
            $("#idproducto").trigger("chosen:updated");
            $("#idproducto").chosen({ width: "95%" });
        }
    });
    cargarPrecio();
}

