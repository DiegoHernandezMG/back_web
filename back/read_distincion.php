<?php
$mysqli = include_once "conexion.php";

$sql = "SELECT * FROM distincion";

$result = $mysqli->query($sql);

if ($result) {
    $distincion = array();
    while ($row = $result->fetch_assoc()) {
        $distincion[] = $row;
    }
    echo json_encode(["success" => true, "data" => $distincion]);
} else {
    echo json_encode(["success" => false, "message" => "Error al obtener las distincion"]);
}

$mysqli->close();
?>