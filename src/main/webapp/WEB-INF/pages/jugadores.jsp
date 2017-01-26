<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="<c:url value="/static/js/jugador.js" />"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Jugadores</title>
</head>
<body>

	<h3>Jugadores</h3>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>Id</th>
				<th>Nombre</th>
				<th>Edad</th>
				<th>Goles</th>
				<th>Equipo</th>
				<th>Editar</th>
				<th>Borrar</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${jugadores}" var="jugador">
				<tr data-id="${jugador.id}">
					<td>${jugador.id}</td>
					<td>${jugador.nombre}</td>
					<td>${jugador.edad}</td>
					<td>${jugador.goles}</td>
					<td>${jugador.equi.nombre}</td>
					<td><a id="editar-juga" class="btn btn-warning">Editar</a></td>
					<td><a class="btn btn-danger open-Modal"
						data-nombre="${jugador.nombre}" data-id="${jugador.id}"
						data-toggle="modal" href='#modal-borrar'>Borrar</a></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="7"><a class="btn btn-primary" data-toggle="modal"
					href='#modal-equipo'>Añadir Equipo</a></td>
			</tr>
		</tbody>
	</table>
	
	
	
	<!-- empiezan la diversion -->

	<div class="modal fade" id="modal-equipo">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">Añadir Equipo</h4>
				</div>
				<div class="modal-body">
					<form method="POST" action="<c:url value="/jugadores"/>"  role="form">
						<legend>Equipo</legend>

						<div class="form-group">
							<label for="Nombre">Nombre</label> <input type="text"
								class="form-control" id="nombre-jugador" name="nombre"
								placeholder="Input field">
						</div>

						<div class="form-group">
							<label for="Edad">Edad</label> <input type="number"
								class="form-control" id="edad-jugador" name="edad"
								placeholder="Input field">
						</div>

						<div class="form-group">
							<label for="Goles">Goles</label> <input type="number"
								class="form-control" id="goles-jugador" name="goles"
								placeholder="Input field">
						</div>
						<input type="hidden" name="id" id="inputId" class="form-control"
							value="">

						<div class="form-group">
							<label for="Equipo">Equipo</label> <select name="equi"
								id="input" class="form-control">
								<c:forEach items="${equipos}" var="equipo">

									<option value="${equipo.id}">${equipo.nombre}</option>

								</c:forEach>

							</select>
						</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
					<button type="submit" class="btn btn-primary">Guardar</button>
				</div>
				</form>
			</div>
		</div>
	</div>


	<!-- Empieza diversion 2 -->

	<div class="modal fade" id="modal-borrar">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">Estas Seguro??</h4>
				</div>
				<div class="modal-body">
					¿Estas seguro de borrar este equipo? <input type="hidden" name=""
						id="jugador" class="form-control" value=""> <strong><span
						id="jugadorNombre"></span></strong>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">No</button>
					<button type="button" class="btn btn-primary btn-borrar"
						data-dismiss="modal">Si</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>