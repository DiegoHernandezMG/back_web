<?php
$mysqli = include_once "conexion.php";

// Asegúrate de que la solicitud sea PUT (para actualizar)
if ($_SERVER["REQUEST_METHOD"] === "PUT") {
    // Obtener el cuerpo de la solicitud y decodificar JSON
    $data = json_decode(file_get_contents("php://input"), true);

    $id = $data["id"];
    $nombre = $data["nombre"];
    $dependencia = $data["dependencia"];
    $distincion = $data["distincion"];
    $categoria = $data["categoria"];
    $curp = $data["curp"];
    $asistencia = $data["asistencia"];
    $asistenciaAcompaniante = $data["asistenciaAcompaniante"];
    $acompaniante = $data["acompaniante"];

    // Consulta SQL para actualizar el usuario
    $sql = "UPDATE usuarios SET NOMBRE=?, DEPENDENCIA=?, DISTINCION=?, CATEGORIA=?, CURP=?, ASISTENCIA=?, ASISTENCIA_ACOMPANIANTE=?, ACOMPANIANTE=? WHERE ID=?";
    
    $stmt = $mysqli->prepare($sql);
    $stmt->bind_param("siiisiiii", $nombre, $dependencia, $distincion, $categoria, $curp, $asistencia, $asistenciaAcompaniante, $acompaniante, $id);
    
    if ($stmt->execute()) {
        // Actualización exitosa
        header("HTTP/1.1 200 OK");
        echo json_encode(["success" => true, "message" => "Usuario actualizado con éxito"]);
    } else {
        // Error en la actualización
        header("HTTP/1.1 500 Internal Server Error");
        echo json_encode(["success" => false, "message" => "Error al actualizar el usuario"]);
    }

    $stmt->close();
    $mysqli->close();
} else {
    // Método HTTP no permitido
    header("HTTP/1.1 405 Method Not Allowed");
    echo json_encode(["message" => "Método HTTP no permitido"]);
}
?>
