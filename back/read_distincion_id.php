<?php
$mysqli = include_once "conexion.php";
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
header("Allow: GET, POST, OPTIONS, PUT, DELETE");

// Verificar si se ha proporcionado un ID en la URL
if (isset($_GET["id"])) {
    $idDistincion = $_GET["id"];

    // Consulta SQL para seleccionar una distinción específica por su ID
    $sql = "SELECT * FROM distincion WHERE ID_DISTINCION = ?";
    
    $stmt = $mysqli->prepare($sql);
    $stmt->bind_param("i", $idDistincion);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $distincion = $result->fetch_assoc();
        echo json_encode(["success" => true, "data" => $distincion]);
    } else {
        echo json_encode(["success" => false, "message" => "No se encontró la distinción con el ID proporcionado"]);
    }

    $stmt->close();
} else {
    echo json_encode(["success" => false, "message" => "Debe proporcionar un ID de distinción"]);
}

$mysqli->close();
?>