<?php
$mysqli = include_once "conexion.php";
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
header("Allow: GET, POST, OPTIONS, PUT, DELETE");
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    header('Access-Control-Allow-Origin: *');
    header('Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE');
    header('Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method');
    header('HTTP/1.1 200 OK');
    exit();
}

// Asegurarse de que la solicitud sea DELETE
if ($_SERVER["REQUEST_METHOD"] === "DELETE") {
    // Obtener el ID del usuario a eliminar desde los parámetros de la URL
    $id = $_GET["id"];

    // Consulta SQL para verificar si el ID existe en la tabla usuarios
    $checkSql = "SELECT COUNT(*) FROM usuarios WHERE ID=?";
    $checkStmt = $mysqli->prepare($checkSql);
    $checkStmt->bind_param("i", $id);
    $checkStmt->execute();
    $result = $checkStmt->get_result();
    $rowCount = $result->fetch_row()[0];
    $checkStmt->close();

    if ($rowCount > 0) {
        // El ID existe en la tabla usuarios, procede con la eliminación

        // Eliminar el usuario de la tabla "usuarios" usando su ID
        $deleteUsuarioSql = "DELETE FROM usuarios WHERE ID = ?";
        $stmtDeleteUsuario = $mysqli->prepare($deleteUsuarioSql);
        $stmtDeleteUsuario->bind_param("i", $id);
        $stmtDeleteUsuario->execute();
        $stmtDeleteUsuario->close();

        // Eliminación exitosa
        header("HTTP/1.1 200 OK");
        echo json_encode(["success" => true, "message" => "Registro eliminado con éxito"]);
    } else {
        // El ID no existe en la base de datos
        header("HTTP/1.1 404 Not Found");
        echo json_encode(["success" => false, "message" => "El usuario con el ID proporcionado no existe"]);
    }
} else {
    // Método HTTP no permitido
    header("HTTP/1.1 405 Method Not Allowed");
    echo json_encode(["message" => "Método HTTP no permitido"]);
}
?>
