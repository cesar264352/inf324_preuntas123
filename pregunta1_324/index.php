<?php include 'validar_sesion.inc.php'; ?>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Pregunta 1 | Examen 324</title>
	<link rel="stylesheet" type="text/css" href="css/estilos.css">
	<!-- FontAwesome -->
	<script src="https://kit.fontawesome.com/67828a9840.js" crossorigin="anonymous"></script>
</head>
<body>
	<form action="" method="POST" class="fom-login">
		<div class="login">
			<div class="login-screen">
				<div class="app-title">
					<i class="fas fa-user-lock" style=" font-size: 50px;"></i>
					<h2>Acceso a la Facultad</h2>
				</div>

				<div class="login-form">
					<div class="control-group">
					<input type="text" class="login-field" value="" placeholder="Usuario" id="login-name" name="usuario">
					<label class="login-field-icon fui-user" for="login-name"></label>
					</div>

					<div class="control-group">

					<input type="password" class="login-field" value="" placeholder="Contraseña" id="login-pass" name="password">
					<label class="login-field-icon fui-lock" for="login-pass"></label>
					</div>

					<input type="submit" name="" value="INGRESAR" class="btn btn-primary btn-large btn-block">
					
					<!-- Alerta -->
					<?php 
						if ($alerta != '') {
							echo '<div class="alerta">'.$alerta.'</div>';
						}else{
							echo '<div class="alerta">¡Bienvenido al sistema!</div>';
						}
					 ?>
					
				</div>
			</div>
		</div>
	</form>
</body>
</html>