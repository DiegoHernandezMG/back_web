<?php
$mysqli=include_once "conexion.php";

$nombre=$_POST["nombre"];

$sentencia=$mysqli->prepare("DELETE FROM usuarios WHERE NOMBRE=?");
$sentencia->bind_param("s",$nombre);
$sentencia->execute();

?>