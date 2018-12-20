		$(document).ready(function(){
			cargar();
			
		});

		function cargar(){
			$.ajax({
				url:'./ajax/grillapedidos.php?accion=cargar',

				 beforeSend: function(objeto){
				 $('#loader').html('<img src="../img/ajax-loader.gif"> Cargando...');
			  },
				success:function(data){
					$("#grilla-pedido").html(data).fadeIn('slow');
					
				}
			})
		}

	
		
	/*		function eliminar (id)
		{
			var q= $("#q").val();
		if (confirm("Realmente deseas eliminar la factura")){	
		$.ajax({
        type: "GET",
        url: "./ajax/buscar_facturas.php",
        data: "id="+id,"q":q,
		 beforeSend: function(objeto){
			$("#resultados").html("Mensaje: Cargando...");
		  },
        success: function(datos){
		$("#resultados").html(datos);
		load(1);
		}
			});
		}
		}
		
		function imprimir_factura(id_factura){
			VentanaCentrada('./pdf/documentos/ver_factura.php?id_factura='+id_factura,'Factura','','1024','768','true');
		}
		*/

function cargarFecha() {
	var desde = $("#desde").val();
	var hasta = $("#hasta").val();
    $.ajax({
        url:'./ajax/grillapedidos.php?accion=cargar',
        method: 'post',
        data: {condicion: "FECHA", desde: desde, hasta: hasta},

        beforeSend: function(objeto){
            $('#loader').html('<img src="../img/ajax-loader.gif"> Cargando...');
        },
        success:function(data){
            $("#grilla-pedido").html(data).fadeIn('slow');

        }
    })
     
}

function verDetalle(id){
    $('#modalVerDetalle').modal("show");
    $("#modalVerDetalleTitle").html("Detalles Pedido ID: "+id);
    $("#grillaVerDetalle tbody tr").remove();
    $("#grillaVerDetalle tfoot .tfoot-body").html("");

    var sql = "SELECT * FROM vsdetallepedido WHERE idpedido="+id;

    $.ajax({
        url: "./ajax/cargarModalDetallePedido.php?action=detallePedido",
        method: "post",
        dataType: "json",
        data: {sql: sql},

        success: function (data) {
            var gravada = 0;
            var iva10 = 0;
            var total = 0;

            $.each(data, function (i, v) {

                var markup = '<tr>';
                markup += '<td>' +v.idproducto +'</td>';
                markup += '<td>' +v.cantidad +'</td>';
                markup += '<td>' +v.descripcion +'</td>';
                markup += '<td>'+'Gs. '+ v.precio +'</td>';
                markup += '</tr>';
                console.log(markup);
                $("#grillaVerDetalle tbody").append(markup);

                iva10 = iva10+ Math.round(v.precio/11);
                gravada = gravada+ (parseInt(v.precio)-Math.round(v.precio/11));
                total = iva10+gravada;

               // console.log("iva10: "+iva10+" gravada: "+gravada);


            });
            $("#grillaVerDetalle .sbt").append("Gs. "+gravada);
            $("#grillaVerDetalle .total-iva").append("Gs. "+iva10);
            $("#grillaVerDetalle .total").append("Gs. "+total);
            console.log("iva10: "+iva10+" gravada: "+gravada+" total: "+total);

        }
    });

}