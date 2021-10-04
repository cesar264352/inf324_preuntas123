<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Pregunta 2 | Examen 324</title>
	<link rel="stylesheet" type="text/css" href="css/estilos.css">
</head>
<body>
	
	<div class="table-title">
		<h3>Lista de Universitarios</h3>
	</div>
	<form action="notas.php" method="GET">
		<table class="table-fill">
			<thead>
				<tr>
					<th class="text-left">Carnet</th>
					<th class="text-left">Ap. Paterno</th>
					<th class="text-left">Ap. Materno</th>
					<th class="text-left">Nombres</th>
					<th class="text-left">Usuario</th>
					<th class="text-left">Notas</th>

				</tr>
			</thead>
			<tbody class="table-hover">
				<?php 
					include "conexion.inc.php";
					//ahora podemos usar comandos SQL
					$sql = "SELECT ci,paterno,materno,nombre,usuario FROM persona INNER JOIN usuario ON persona.ci=usuario.id_persona INNER JOIN rol ON usuario.rol_fk=rol.id_rol WHERE rol.id_rol=2";
					$query = mysqli_query($conn, $sql);
					
					while ($fila = mysqli_fetch_array($query)) {
				    	echo '
						<tr>
							<td class="text-left">'.$fila["ci"].'</td>
							<td class="text-left">'.$fila["paterno"].'</td>
							<td class="text-left">'.$fila["materno"].'</td>
							<td class="text-left">'.$fila["nombre"].'</td>
							<td class="text-left">'.$fila["usuario"].'</td>
							<td class="text-left">
								<a href="notas.php?id='.$fila["ci"].'" class="button">Ver Notas</a>
								 
							</td>
						</tr>
						';

					}


				 ?>

			</tbody>
		</table>
	</form>
	
</body>
</html>
