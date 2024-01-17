<?php
$mysqli = include_once "conexion.php";
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
header("Allow: GET, POST, OPTIONS, PUT, DELETE");

$sql = "SELECT u.*, d.DEPENDENCIA, di.DISTINCION, c.CATEGORIA
        FROM usuarios u
        LEFT JOIN dependencia d ON u.DEPENDENCIA = d.ID_DEPENDENCIA
        LEFT JOIN distincion di ON u.DISTINCION = di.ID_DISTINCION
        LEFT JOIN categoria c ON u.CATEGORIA = c.ID_CATEGORIA";

$result = $mysqli->query($sql);

if ($result) {
    $users = array();
    while ($row = $result->fetch_assoc()) {
        $users[] = $row;
    }
    echo json_encode(["success" => true, "data" => $users]);
} else {
    echo json_encode(["success" => false, "message" => "Error al obtener los usuarios"]);
}

$mysqli->close();
?>
