<?php 

session_start();
if (!empty($_SESSION['active'])){

	header('location: sistema/');
}else{

	$alerta = '';
	if (!empty($_POST)) {
		
		if (empty($_POST['usuario']) || empty($_POST['password'])) {
			
			$alerta = 'Ingrese su usuario y contraseña';
		}else{
			require_once "conexion.inc.php";
			//verificamos si existe el usuario
			$user = $_POST['usuario'];
			$pass = $_POST['password'];

			//ahora podemos usar comandos SQL
			$sql = "SELECT * FROM usuario WHERE usuario='$user' AND password='$pass'";
			$query = mysqli_query($conn, $sql);
			$result = mysqli_num_rows($query);

			if ($result > 0) {
				$data = mysqli_fetch_array($query);
				//variables de sesion
				
				$_SESSION['active'] = true;
				$_SESSION['idUser'] = $data['id_usuario'];
				$_SESSION['idPersona'] = $data['id_persona'];
				$_SESSION['user'] = $data['usuario'];
				$_SESSION['rol'] = $data['rol_fk'];

				header('location: sistema/');
			}else{
				$alerta = "El usuario o la contraseña son incorrectos";
				session_destroy();
			}
		}
	}
}
 ?>