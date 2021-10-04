
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Respuesta 2 | Examen 324</title>
	<link rel="stylesheet" type="text/css" href="css/estilos.css">
</head>
<body>
	<?php 
		$nombre = $_GET["id"];
		//echo $nombre;
		include "conexion.inc.php";
		//ahora podemos usar comandos SQL
		$sql1 = "SELECT DISTINCT carrera,nombre,paterno,materno FROM persona 
				INNER JOIN nota ON persona.ci=nota.id_persona 
				INNER JOIN materia ON materia.id_materia=nota.materia_fk 
				INNER JOIN carrera ON materia.carrera_fk=carrera.id_carrera WHERE persona.ci='$nombre'";
		$query1 = mysqli_query($conn, $sql1);
		$fila1 = mysqli_fetch_array($query1);
		
	?>
	<div class="table-title">
		<h3>Lista de Notas</h3>
		<h4 style="color: #FFF;">Univ. <?php echo $fila1["nombre"].' '.$fila1["paterno"].' '.$fila1["materno"]; ?></h4>
		<h4 style="color: #FFF;">Carrera: <?php echo $fila1["carrera"]; ?></h4>
	</div>
	<form action="notas.php" method="GET">
		<table class="table-fill">
			<thead>
				<tr>
					<th class="text-left">Materia</th>
					<th class="text-left">Nota 1</th>
					<th class="text-left">Nota 2</th>
					<th class="text-left">Nota 3</th>
					<th class="text-left">Nota Final</th>
					<th class="text-left">Estado</th>

				</tr>
			</thead>
			<tbody class="table-hover">
				<?php 
					//ahora podemos usar comandos SQL
					$sql = "SELECT carrera,sigla,nota1,nota2,nota3,notaFinal FROM persona INNER JOIN nota ON persona.ci=nota.id_persona INNER JOIN materia ON materia.id_materia=nota.materia_fk INNER JOIN carrera ON materia.carrera_fk=carrera.id_carrera WHERE persona.ci='$nombre'";
					$query = mysqli_query($conn, $sql);
					
					while ($fila = mysqli_fetch_array($query)) {
				    	echo '
						<tr>
							<td class="text-left">'.$fila["sigla"].'</td>
							<td class="text-left">'.$fila["nota1"].'</td>
							<td class="text-left">'.$fila["nota2"].'</td>
							<td class="text-left">'.$fila["nota3"].'</td>
							<td class="text-left">'.$fila["notaFinal"].'</td>
							<td class="text-left">';
								if ($fila["notaFinal"]>50) {
									echo 'Aprobado';
								}else{
									echo 'Reprobado';
								}	
								 
						echo '	</td>
						</tr>
						';
							

					}


				 ?>

			</tbody>
		</table>
	</form>
	
</body>
</html>
