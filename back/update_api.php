<?php
$mysqli=include_once "conexion.php";

$id=$_POST["id"];
$nombre=$_POST["nombre"];
$dependencia=$_POST["dependencia"];
$distincion=$_POST["distincion"];
$categoria=$_POST["categoria"];
$curp=$_POST["curp"];
$asistencia=$_POST["asistencia"];
$asistenciaA=$_POST["asistenciaAcompaniante"];
$acompaniante=$_POST["acompaniante"];

$sentencia=$mysqli->prepare("UPDATE usuarios SET NOMBRE=?,DEPENDENCIA=?,DISTINCION=?,CATEGORIA=?,CURP=?,
ASISTENCIA=?,ASISTENCIA_ACOMPANIANTE=? WHERE ID=?");
$sentencia->bind_param("siiisiii",$nombre,$dependencia,$distincion,$categoria,$curp,$asistencia,$asistenciaA,$id);
$sentencia->execute();


?>