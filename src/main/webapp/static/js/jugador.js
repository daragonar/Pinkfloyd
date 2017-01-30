$(document).ready(function() {
	editarJugador();
	borraJug();
})

var limpiarModal=function(){
	$('.modal-title').text("Añadir Jugador");
	$('#nombre-jugador').val('');
	$('#edad-jugador').val('');
	$('#imagen-jugador').val('');
	$('#goles-jugador').val('');
	$('#inputId').val('');
	$('#equipo').val('');
}

var cogerId=function(){
	$(document).on("click", ".open-Modal", function() {
		var putita = $(this).data('id');
		var nomfede = $(this).data('nombre');
		$(".modal-body #jugador").val(putita);
		$(".modal-body #jugadorNombre").text(nomfede);
	});
}

var borraJug=function(){
	cogerId();
	
	$(".btn-borrar").on("click", function() {
		var id = $(".modal-body #jugador").val();
		$.ajax({
			url : "/Pinkfloyd/jugadores/" + id,
			type : 'DELETE',
			success : function(result) {
				$('tr[data-id="' + id + '"]').remove();
			}
		});
	})
}

var editarJugador= function() {
	cogerId();
	
	$(".editar-juga").on('click', function() {
		var id = $(this).parents('tr').data('id');
		var url = '/Pinkfloyd/jugadores/' + id;
		console.log("hola");

		$.get(url).done(function(jugador) {
			$('.modal-title').text("Editar Jugador");
			$('#nombre-jugador').val(jugador.nombre);
			$('#edad-jugador').val(jugador.edad);
			$('#imagen-jugador').val(jugador.imagen);
			$('#goles-jugador').val(jugador.goles);
			$('#inputId').val(jugador.id);
			$('#equipo').val(jugador.equi.id);
			
			$('#modal-jugador').modal('show');
		})
		$('#modal-jugador').on('hide.bs.modal', limpiarModal);

	})

}



