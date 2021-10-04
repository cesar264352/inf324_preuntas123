
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Respuesta 3 | Examen 324</title>
	<link rel="stylesheet" type="text/css" href="css/estilos.css">
</head>
<body>
	<?php 
		$nombre = $_GET["id"];
		//echo $nombre;
		include "conexion.inc.php";
		//ahora podemos usar comandos SQL
		
		
	?>
	<div class="table-title">
		<h3>Lista de Notas</h3>
		
	</div>
	<form action="notas.php" method="GET">
		<table class="table-fill">
			<thead>
				<tr>
					<th class="text-left">Departamento</th>
					<th class="text-left">Materia</th>
					<th class="text-left">Promedio</th>
				</tr>
			</thead>
			<tbody class="table-hover">
				<?php 
					//ahora podemos usar comandos SQL
					


					for ($i=1; $i <= 9; $i++) { 
						$contador = 0;
						$promedio = 0;
						for ($j=1; $j <= 9; $j++) { 
							$dpto = '0'.$j;
							$sql = "SELECT id_materia,sigla,cod_ine,departamento,notaFinal FROM docente 
									INNER JOIN materia ON docente.materia_fk=materia.id_materia
									INNER JOIN nota ON nota.materia_fk=materia.id_materia
									INNER JOIN persona ON persona.ci=nota.id_persona
									INNER JOIN departamento ON persona.departamento_fk=departamento.cod_ine
									WHERE docente.docente_fk='$nombre'
									ORDER BY departamento";
							$query = mysqli_query($conn, $sql);
							while ($fila = mysqli_fetch_array($query)) {
								if ($fila["id_materia"]==$i && $fila["cod_ine"]==$dpto) {
									$materia = $fila["sigla"];
									$departamento = $fila["departamento"];
									$promedio = $promedio+$fila["notaFinal"];
									$contador++;
								}
							}
							if ($contador>0) {
								$promedio = $promedio/$contador;
								echo '<tr>';
								echo	'<td class="text-left">'.$materia.'</td>';
								echo	'<td class="text-left">'.$departamento.'</td>';
								echo	'<td class="text-left">'.$promedio.'</td>';
								echo '</tr>';	
								
							}
							$contador = 0;
							$promedio = 0;					
						}
						
					}
						
					


				 ?>

			</tbody>
		</table>
	</form>
	
</body>
</html>
