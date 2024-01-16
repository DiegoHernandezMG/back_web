<?php
$mysqli = include_once "conexion.php";

// Verificar si se ha proporcionado un ID en la URL
if (isset($_GET["id"])) {
    $idAcompaniante = $_GET["id"];

    // Consulta SQL para seleccionar un acompañante específico por su ID
    $sql = "SELECT * FROM acompaniante WHERE ID_ACOMPANIANTE = ?";
    
    $stmt = $mysqli->prepare($sql);
    $stmt->bind_param("i", $idAcompaniante);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $acompaniante = $result->fetch_assoc();
        echo json_encode(["success" => true, "data" => $acompaniante]);
    } else {
        echo json_encode(["success" => false, "message" => "No se encontró el acompañante con el ID proporcionado"]);
    }

    $stmt->close();
} else {
    echo json_encode(["success" => false, "message" => "Debe proporcionar un ID de acompañante"]);
}

$mysqli->close();
?>