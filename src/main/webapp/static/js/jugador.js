$(document).ready(function(){
	$(document).on("click", ".open-Modal", function () {
		var Fede = $(this).data('id');
		var nomfede =$(this).data('nombre');
		$(".modal-body #jugador").val( Fede);
		$(".modal-body #jugadorNombre").text( nomfede);
		});
	
	$(".btn-borrar").on("click",function(){
		var id=$(".modal-body #jugador").val();
		$.ajax({
			url : "/Pinkfloyd/jugadores/" + id,
			type : 'DELETE',
			success : function(result) {
				$('tr[data-id="' + id + '"]').remove();
			}
		});
	})
})