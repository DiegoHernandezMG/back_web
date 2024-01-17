<?php
$mysqli = include_once "conexion.php";
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
header("Allow: GET, POST, OPTIONS, PUT, DELETE");

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