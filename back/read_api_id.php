<?php
$mysqli = include_once "conexion.php";
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
header("Allow: GET, POST, OPTIONS, PUT, DELETE");

// Verificar si el ID del usuario se ha pasado a través de la URL
if (isset($_GET["id"])) {
    $userId = $_GET["id"];

    $sql = "SELECT u.*, d.DEPENDENCIA, di.DISTINCION, c.CATEGORIA, a.NOMBRE_ACOMPANIANTE
            FROM usuarios u
            LEFT JOIN dependencia d ON u.DEPENDENCIA = d.ID_DEPENDENCIA
            LEFT JOIN distincion di ON u.DISTINCION = di.ID_DISTINCION
            LEFT JOIN categoria c ON u.CATEGORIA = c.ID_CATEGORIA
            LEFT JOIN acompaniante a ON u.ACOMPANIANTE = a.ID_ACOMPANIANTE
            WHERE u.ID = ?";

    $stmt = $mysqli->prepare($sql);
    $stmt->bind_param("i", $userId);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        echo json_encode(["success" => true, "data" => $row]);
    } else {
        echo json_encode(["success" => false, "message" => "No se encontraron datos para el usuario con ese ID"]);
    }

    $stmt->close();
} else {
    echo json_encode(["success" => false, "message" => "Debe proporcionar un ID de usuario"]);
}

$mysqli->close();
?>
