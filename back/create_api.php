<?php
$mysqli=include_once "conexion.php";
$nombre=$_POST["nombre"];
$dependencia=$_POST["dependencia"];
$distincion=$_POST["distincion"];
$categoria=$_POST["categoria"];
$curp=$_POST["curp"];
$asistencia=$_POST["asistencia"];
$asistenciaA=$_POST["asistenciaAcompaniante"];
$acompaniante=$_POST["acompaniante"];

$sentencia=$mysqli->prepare("INSERT INTO usuarios (NOMBRE, DEPENDENCIA, DISTINCION, CATEGORIA, CURP, ASISTENCIA, 
ASISTENCIA_ACOMPANIANTE) VALUES (?,?,?,?,?,?,?)");
$sentencia->bind_param("siiisii",$nombre,$dependencia,$distincion,$categoria,$curp,$asistencia,$asistenciaA);
$sentencia->execute();

?>