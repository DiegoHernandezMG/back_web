<?php
$mysqli = include_once "conexion.php";
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
header("Allow: GET, POST, OPTIONS, PUT, DELETE");

// Asegurarse de que la solicitud sea PUT (para actualizar)
if ($_SERVER["REQUEST_METHOD"] === "PUT") {
    // Obtener el cuerpo de la solicitud y decodificar JSON
    $data = json_decode(file_get_contents("php://input"), true);

    $id = $data["id"];
    $nombreA = $data["nombreAcompaniante"];
    $implemento = $data["implemento"];

    // Consulta SQL para verificar si el ID existe en la tabla usuarios
    $checkIdSql = "SELECT COUNT(*) FROM usuarios WHERE ID=?";
    $checkIdStmt = $mysqli->prepare($checkIdSql);
    $checkIdStmt->bind_param("i", $id);
    $checkIdStmt->execute();
    $idResult = $checkIdStmt->get_result();
    $idRowCount = $idResult->fetch_row()[0];

    if ($idRowCount > 0) {
        // El ID existe, procede con la actualización de "NOMBRE_ACOMPANIANTE" e "IMPLEMENTO"
        $updateSql = "UPDATE usuarios SET NOMBRE_ACOMPANIANTE=?, IMPLEMENTO=? WHERE ID=?";
        $stmt = $mysqli->prepare($updateSql);   
        $stmt->bind_param("ssi", $nombreA, $implemento, $id);

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
    } else {
        // El ID no existe en la base de datos
        header("HTTP/1.1 404 Not Found");
        echo json_encode(["success" => false, "message" => "El usuario con el ID proporcionado no existe"]);
    }

    $checkIdStmt->close();
    $mysqli->close();
} else {
    // Método HTTP no permitido
    header("HTTP/1.1 405 Method Not Allowed");
    echo json_encode(["message" => "Método HTTP no permitido"]);
}
?>
