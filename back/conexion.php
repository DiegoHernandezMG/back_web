<?php
$host = "localhost";
$usuario = "root";
$password = "ItDontMatter1";
$base_de_datos = "db_proyecto_web";

// Crear la conexión
$mysqli = new mysqli($host, $usuario, $password, $base_de_datos);

// Verificar la conexión
if ($mysqli->connect_errno) {
    echo "Fallo la conexión a MySQL: (". $mysqli->connect_errno . ")" .  $mysqli->connect_errno;
}
return $mysqli;

?>