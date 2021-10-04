<?php 
	session_start();
	if (empty($_SESSION['active'])) {
		header('../');
	}
 ?>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Pregunta 1 | Ingreso</title>
	<link rel="stylesheet" type="text/css" href="css/estilos.css">
	<!-- FontAwesome -->
	<script src="https://kit.fontawesome.com/67828a9840.js" crossorigin="anonymous"></script>
</head>
<body>
	<div class="login">
		<div class="login-screen">
			
			<!--Recibiendo datos POST-->
			<?php 
				$persona = $_SESSION['idPersona'];
				
				include "../conexion.inc.php";

				$sql1 = "Select * FROM persona,usuario WHERE persona.ci='$persona' && persona.ci=usuario.id_persona && usuario.rol_fk='1'";
				$query1 = mysqli_query($conn, $sql1);
				$result1 = mysqli_num_rows($query1);
				

				if ($result1 > 0){
					$sql2 = "SELECT ci,nombre,paterno,materno,f_nacimiento,departamento,rol FROM persona,departamento,rol,usuario WHERE persona.ci='$persona' && persona.departamento_fk=departamento.cod_ine &&  usuario.id_persona=persona.ci && usuario.rol_fk=rol.id_rol";
					$query2 = mysqli_query($conn, $sql2);
					$result2 = mysqli_num_rows($query2);
					
					if ($result2 > 0) {
						$data2 = mysqli_fetch_array($query2);
						
						//variables de sesion
						
						$_SESSION['active'] = true;
						$_SESSION['ci'] = $data2['ci'];
						$_SESSION['nombre'] = $data2['nombre'];
						$_SESSION['paterno'] = $data2['paterno'];
						$_SESSION['materno'] = $data2['materno'];
						$_SESSION['f_nac'] = $data2['f_nacimiento'];
						$_SESSION['dpto'] = $data2['departamento'];
						$_SESSION['carrera'] = "-----";
						$_SESSION['rol'] = $data2['rol'];
					}
				}else{
					$sql = "SELECT ci,nombre,paterno,materno,f_nacimiento,departamento,carrera,rol FROM persona,departamento,materia,nota,carrera,rol,usuario WHERE persona.ci='$persona' && persona.departamento_fk=departamento.cod_ine && persona.ci= nota.id_persona && nota.materia_fk=materia.id_materia && materia.carrera_fk=id_carrera && usuario.id_persona=persona.ci && usuario.rol_fk=rol.id_rol";
					$query = mysqli_query($conn, $sql);
					$result = mysqli_num_rows($query);
					
					if ($result > 0) {
						$data = mysqli_fetch_array($query);
						//variables de sesion
						
						$_SESSION['active'] = true;
						$_SESSION['ci'] = $data['ci'];
						$_SESSION['nombre'] = $data['nombre'];
						$_SESSION['paterno'] = $data['paterno'];
						$_SESSION['materno'] = $data['materno'];
						$_SESSION['f_nac'] = $data['f_nacimiento'];
						$_SESSION['dpto'] = $data['departamento'];
						$_SESSION['carrera'] = $data['carrera'];
						$_SESSION['rol'] = $data['rol'];
					}
				}
				



			 ?>
			<div class="app-title">
				<i class="fas fa-user" style=" font-size: 50px;"></i>
				<h2><?php echo $_SESSION['rol']; ?></h2>
				<h3> <?php echo $_SESSION['nombre']." ".$_SESSION['paterno']." ".$_SESSION['materno']; ?></h3>
			</div>
			<div class="login-form">
				<div class="control-group">
					<p class="referencia">Canet de Identidad:</p> 
					<input type="text" class="login-field" value="" placeholder="<?php echo $_SESSION['ci']; ?>" id="login-pass" disabled>
					<label class="login-field-icon fui-lock" for="login-pass"></label>
				</div>
				<div class="control-group">
					<p class="referencia">Fecha de Nacimiento:</p> 
					<input type="text" class="login-field" value="" placeholder="<?php echo $_SESSION['f_nac']; ?>" id="login-pass" disabled>
					<label class="login-field-icon fui-lock" for="login-pass"></label>
				</div>
				<div class="control-group">
					<p class="referencia">Departamento:</p> 
					<input type="text" class="login-field" value="" placeholder="<?php echo $_SESSION['dpto']; ?>" id="login-pass" disabled>
					<label class="login-field-icon fui-lock" for="login-pass"></label>
				</div>
				<div class="control-group">
					<p class="referencia">Carrera:</p> 
					<input type="text" class="login-field" value="" placeholder="<?php echo $_SESSION['carrera']; ?>" id="login-pass" disabled>
					<label class="login-field-icon fui-lock" for="login-pass"></label>
				</div>
				
				<?php 
					if ($_SESSION['rol']=='DOCENTE') {
						
						echo '<form action="notas_dpto.php.php" method="GET">';
						echo '<a href="notas_dpto.php?id='.$_SESSION['ci'].'" class="button">Ver Notas por Dpto.</a>';
						echo '</form>';
					}else{
						echo '<form action="notas.php" method="GET">';
						echo '<a href="notas.php?id='.$_SESSION['ci'].'" class="button">Ver Notas</a>';
						echo '</form>';
					}

				 ?>
					
						
				
				<a href="salir.php" class="btn btn-primary btn-large btn-block">
					SALIR <i class="fas fa-sign-out-alt"></i>
				</a>
				
				
			</div>
		</div>
	</div>
</body>
</html>

