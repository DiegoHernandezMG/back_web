<?php
$mysqli = include_once "conexion.php";

$sql = "SELECT * FROM dependencia";

$result = $mysqli->query($sql);

if ($result) {
    $dependencia = array();
    while ($row = $result->fetch_assoc()) {
        $dependencia[] = $row;
    }
    echo json_encode(["success" => true, "data" => $dependencia]);
} else {
    echo json_encode(["success" => false, "message" => "Error al obtener las dependencias"]);
}

$mysqli->close();
?>