<?php
$mysqli = include_once "conexion.php";

$sql = "SELECT * FROM acompaniante";

$result = $mysqli->query($sql);

if ($result) {
    $acompaniante = array();
    while ($row = $result->fetch_assoc()) {
        $acompaniante[] = $row;
    }
    echo json_encode(["success" => true, "data" => $acompaniante]);
} else {
    echo json_encode(["success" => false, "message" => "Error al obtener la informacion de los acompaniantes"]);
}

$mysqli->close();
?>