<?php
$mysqli = include_once "conexion.php";
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
header("Allow: GET, POST, OPTIONS, PUT, DELETE");

// Verificar si se ha proporcionado un ID en la URL
if (isset($_GET["id"])) {
    $idCategoria = $_GET["id"];

    // Consulta SQL para seleccionar una categoría específica por su ID
    $sql = "SELECT * FROM categoria WHERE ID_CATEGORIA = ?";
    
    $stmt = $mysqli->prepare($sql);
    $stmt->bind_param("i", $idCategoria);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $categoria = $result->fetch_assoc();
        echo json_encode(["success" => true, "data" => $categoria]);
    } else {
        echo json_encode(["success" => false, "message" => "No se encontró la categoría con el ID proporcionado"]);
    }

    $stmt->close();
} else {
    echo json_encode(["success" => false, "message" => "Debe proporcionar un ID de categoría"]);
}

$mysqli->close();
?>
