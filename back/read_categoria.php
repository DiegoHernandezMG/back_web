<?php
$mysqli = include_once "conexion.php";

$sql = "SELECT * FROM categoria";

$result = $mysqli->query($sql);

if ($result) {
    $categorias = array();
    while ($row = $result->fetch_assoc()) {
        $categorias[] = $row;
    }
    echo json_encode(["success" => true, "data" => $categorias]);
} else {
    echo json_encode(["success" => false, "message" => "Error al obtener las categorías"]);
}

$mysqli->close();
?>