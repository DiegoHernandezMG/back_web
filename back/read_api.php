<?php
$mysqli = include_once "conexion.php";

$sql = "SELECT u.*, d.DEPENDENCIA, di.DISTINCION, c.CATEGORIA, a.NOMBRE_ACOMPANIANTE
        FROM usuarios u
        LEFT JOIN dependencia d ON u.DEPENDENCIA = d.ID_DEPENDENCIA
        LEFT JOIN distincion di ON u.DISTINCION = di.ID_DISTINCION
        LEFT JOIN categoria c ON u.CATEGORIA = c.ID_CATEGORIA
        LEFT JOIN acompaniante a ON u.ACOMPANIANTE = a.ID_ACOMPANIANTE";

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
