<?php
	// primero definimos el canal, servidor, usuario y contrasenia
	$conn = mysqli_connect("localhost", "usuario324", "123456");

	//seleccionamos la base de datos (conexion, nombre de la base de datos)
	mysqli_select_db($conn, "bd_cesar");
?>