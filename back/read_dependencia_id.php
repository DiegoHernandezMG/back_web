<?php
$mysqli = include_once "conexion.php";

// Verificar si se ha proporcionado un ID en la URL
if (isset($_GET["id"])) {
    $idDependencia = $_GET["id"];

    // Consulta SQL para seleccionar una dependencia específica por su ID
    $sql = "SELECT * FROM dependencia WHERE ID_DEPENDENCIA = ?";
    
    $stmt = $mysqli->prepare($sql);
    $stmt->bind_param("i", $idDependencia);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $dependencia = $result->fetch_assoc();
        echo json_encode(["success" => true, "data" => $dependencia]);
    } else {
        echo json_encode(["success" => false, "message" => "No se encontró la dependencia con el ID proporcionado"]);
    }

    $stmt->close();
} else {
    echo json_encode(["success" => false, "message" => "Debe proporcionar un ID de dependencia"]);
}

$mysqli->close();
?>