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
    $acompaniante = $data["acompaniante"];

    // Consulta SQL para verificar si el id_acompaniante existe en la tabla acompaniante
    $checkSql = "SELECT COUNT(*) FROM acompaniante WHERE ID_ACOMPANIANTE = ?";
    $checkStmt = $mysqli->prepare($checkSql);
    $checkStmt->bind_param("i", $acompaniante);
    $checkStmt->execute();
    $result = $checkStmt->get_result();
    $rowCount = $result->fetch_row()[0];
    $checkStmt->close();

    if ($rowCount > 0) {
        // El id_acompaniante existe en la tabla acompaniante, procede con la actualización
        $sql = "UPDATE usuarios SET ACOMPANIANTE=? WHERE ID=?";
        $stmt = $mysqli->prepare($sql);
        $stmt->bind_param("ii", $acompaniante, $id);

        if ($stmt->execute()) {
            // Actualización exitosa
            header("HTTP/1.1 200 OK");
            echo json_encode(["success" => true, "message" => "Variable 'acompaniante' actualizada con éxito"]);
        } else {
            // Error en la actualización
            header("HTTP/1.1 500 Internal Server Error");
            echo json_encode(["success" => false, "message" => "Error al actualizar la variable 'acompaniante'"]);
        }

        $stmt->close();
    } else {
        // El id_acompaniante no existe en la tabla acompaniante
        header("HTTP/1.1 404 Not Found");
        echo json_encode(["success" => false, "message" => "El 'id_acompaniante' proporcionado no existe en la tabla 'acompaniante'"]);
    }

    $mysqli->close();
} else {
    // Método HTTP no permitido
    header("HTTP/1.1 405 Method Not Allowed");
    echo json_encode(["message" => "Método HTTP no permitido"]);
}
?>
