$(document).ready(function(){
	$(document).on("click", ".open-Modal", function () {
		var Fede = $(this).data('id');
		var nomfede =$(this).data('nombre');
		$(".modal-body #equipo").val( Fede);
		$(".modal-body #equipoNombre").text( nomfede);
		});
	
	$(".btn-borrar").on("click",function(){
		var id=$(".modal-body #equipo").val();
		$.ajax({
			url : "/Pinkfloyd/equipos/" + id,
			type : 'DELETE',
			success : function(result) {
				$('tr[data-id="' + id + '"]').remove();
			}
		});
	})
})