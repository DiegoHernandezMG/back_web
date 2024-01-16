<?php
$mysqli = include_once "conexion.php";

// Asegurarse de que la solicitud sea POST
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    // Obtener el cuerpo de la solicitud y decodificar JSON
    $data = json_decode(file_get_contents("php://input"), true);

    $nombre = $data["nombre"];
    $dependencia = $data["dependencia"];
    $distincion = $data["distincion"];
    $categoria = $data["categoria"];
    $curp = $data["curp"];
    $asistencia = $data["asistencia"];
    $asistenciaA = $data["asistenciaAcompaniante"];
    $acompaniante = $data["acompaniante"];

    $sentencia=$mysqli->prepare("INSERT INTO usuarios (NOMBRE, DEPENDENCIA, DISTINCION, CATEGORIA, CURP, ASISTENCIA, 
    ASISTENCIA_ACOMPANIANTE) VALUES (?,?,?,?,?,?,?)");
    $sentencia->bind_param("siiisii",$nombre,$dependencia,$distincion,$categoria,$curp,$asistencia,$asistenciaA);

    if ($sentencia->execute()) {
        echo json_encode(["success" => true, "message" => "Usuario creado con éxito"]);
    } else {
        echo json_encode(["success" => false, "message" => "Error al crear el usuario"]);
    }
}
?>
