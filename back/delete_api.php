<?php
$mysqli = include_once "conexion.php";

// Asegurarse de que la solicitud sea DELETE
if ($_SERVER["REQUEST_METHOD"] === "DELETE") {
    // Obtener el ID del usuario a eliminar desde los parámetros de la URL
    $id = $_GET["id"];

    // Consulta SQL para eliminar el usuario por su ID
    $sql = "DELETE FROM usuarios WHERE ID = ?";
    
    $stmt = $mysqli->prepare($sql);
    $stmt->bind_param("i", $id);
    
    if ($stmt->execute()) {
        // Eliminación exitosa
        header("HTTP/1.1 200 OK");
        echo json_encode(["success" => true, "message" => "Usuario eliminado con éxito"]);
    } else {
        // Error en la eliminación
        header("HTTP/1.1 500 Internal Server Error");
        echo json_encode(["success" => false, "message" => "Error al eliminar el usuario"]);
    }

    $stmt->close();
    $mysqli->close();
} else {
    // Método HTTP no permitido
    header("HTTP/1.1 405 Method Not Allowed");
    echo json_encode(["message" => "Método HTTP no permitido"]);
}
?>
