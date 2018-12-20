function cargarPrecio(){
    var idproducto = $("#idproducto").val();
    var id = idproducto.split("-");
    var sql = "SELECT precio FROM vsproductos where id ="+idproducto[0];
    console.log(sql);
    $.ajax({
        url: "ajax/cabecerapedidos.php?action=precio",
        method: "post",
        data: {sql: sql},
        
        success: function(data){
            console.log(data);  
            $("#preciov").val(data);

        }
    });
}

//validacion de cantidad vacio
$("#cantidad").keypress(function(e) {
       if(e.which == 13) {
          // Acciones a realizar.
         $cantidad = $("#cantidad").val();
         if ($("#cantidad").val().length < 1) {
            alert("ingrese cantidad");
         }else{
            cargarGrillaDetalle();
         }
         
         
       }
    });

function verificarRepetidoGrilla(){
    var repetido = false; //variable para analizar contenido de la tabla
    $("#grilla tbody tr").each(function (index){
    var idproducto;
    $(this).children("td").each(function(index2){
        switch (index2){
            case 0:
                idproducto = $(this).text();
            break;

        }
        console.log(idproducto);
    }); //funcion que recorre la tabla y guarda el contenido de las filas en variables
    
    var productos = $("#idproducto").val();
    var resultado = productos.split("-");
    var id = resultado[0];
    console.log(id);
    if (id==idproducto) {
        alert("YA FUE SELECCIONADO");
        repetido = true;
        } //condicional que compara los registros de la tabla con los introducidos
    });
    return repetido;
}

function cargarGrillaDetalle(){

    repetido = verificarRepetidoGrilla();
    if (repetido == false) {
    $("#btngrabar").prop("disabled", false);
    var productos = $("#idproducto").val();
    var resultado = productos.split("-");

    var idproducto = resultado[0];
    var descripcion = resultado[1];
    var cantidad = $("#cantidad").val();
    var precio = $("#preciov").val(); //precio de la bd
    var iva10 = Math.round((precio/11)); //iva10 desde precio
    var gravada = (precio - iva10); //gravada que muestra en tabla

    //codigo html para la nueva fila
    var markup = 
    '<tr> <td>'+idproducto+'</td> <td>'+descripcion+'</td>'
    +'<td>'+cantidad+'</td> <td>Gs. '+gravada+'</td>'
    +'<td>0</td> <td>Gs. '+iva10+'</td>'
    +'<td><button class="delete-row btn btn-xs btn-warning" >Eliminar</button></td></tr>';

    $("#grilla tbody").append(markup); //agrega la fila a la tabla

    calcularTotales();
    
    }

}


//funcion para eliminar fila
$(document).on('click', '.delete-row', function(event){
    event.preventDefault();
    $(this).closest('tr').remove();
    calcularTotales();
});



function calcularTotales() {
    var cant = 0;
    var precio = 0;
    var exe = 0;
    var g10 = 0;
    var total = 0;

    $("#grilla tbody tr").each(function (fila) {
        $(this).children("td").each(function (col) {
            if(col === 2){
                cant = parseInt($(this).text()); //saca cantidad por cada fila
            }
            if(col === 3){
                var fila = $(this).text(); //saca precio de cada fila
                var preciov = fila.split(" "); //separa el gs del precio
                precio = precio + (cant*parseInt(preciov[1])); //multiplica el precio por la cantidad
                
            }
            if(col === 4){
                exe = exe + parseInt($(this).text());
            }
            if(col === 5){ //lo mismo que el precio pero en iva
                var fila = $(this).text();
                var iva = fila.split(" ");
                g10 = g10 + (cant*parseInt(iva[1]));
            }
        });
    });
    total = precio+g10; //suma total
        //inserta en las filas del tfoot
    $(".sbt").html("Gs. "+precio);
    $(".liqui-iva").html("Gs. "+g10);
    $(".total-iva").html("Gs. "+g10);
    $(".total").html("Gs. "+total);
    //$("#total").val(total);
    console.log(precio+" iva10: "+g10);
    console.log("TOTAL: "+total);
    
}


function grabar(estado){

    if (estado!="FACTURADO") {
        var id = $("#idpedido").val()
        var nropedido = $("#nropedido").val();
        var nombrecli = $("#cliente").val();
        var idusuario = $("#idusuario").val();
        
        if (nombrecli=="") {
        alert("INTRODUZCA CLIENTE");
        $("#cliente").focus();

        }else{


            var sql='INSERT INTO pedidos (id,nropedido,fechapedido,estado,nombrecli,idusuario) VALUES ';
            sql += '('+id+', '+nropedido+', CURRENT_DATE() ,"'+estado+'", "'+nombrecli+'", '+idusuario+');';
            

            $.ajax({
                url: "./ajax/guardarpedidos.php?accion=guardarPedido",
                method: "post",
                data: {sql, id},
                success: function(id){
                    grabarDetalle(id, "pedidodetalle");
                }
            });

        }
     //   cancelar();

    }

}

  function grabarDetalle(idpedido,tabla){ 
	    var guardado = false;
        var tabla = $("#grilla tbody tr");

        //ciclo que genera cada insert
        tabla.each(function(index){
            var idproducto, cantidad;

            $(this).children("td").each(function(fila){ //ciclo que toma los datos
                if (fila===0) {
                    idproducto = $(this).text();
                }
           
                if (fila===2) {
                    cantidad = $(this).text();
                }
            }); //fin de ciclo que toma datos

            //generar sql
            var sql = "INSERT INTO pedidodetalle ";
            sql += " (idpedido,idproducto,cantidad,precio) ";
            sql += " VALUES ("+idpedido+","+idproducto+","+cantidad+",(SELECT precio FROM productos WHERE id="+idproducto+"));";
        
        //enviar sql
            $.ajax({
                url: "./ajax/guardarpedidos.php?accion=guardarDetalle",
                method: "post",
                data: {sql},
                success: function(data){
                   // console.log(data);
                    if (data=="GUARDADO") {
                        guardado = true;
                        console.log(guardado);
                        cancelar();
                    }//fin de if
                }

            }); //fin de ajax
        console.log(guardado);
        
    }); //fin del ciclo

}
