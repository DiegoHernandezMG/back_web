<?php
$mysqli = include_once "conexion.php";

// Asegurarse de que la solicitud sea POST
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    // Obtener el cuerpo de la solicitud y decodificar JSON
    $data = json_decode(file_get_contents("php://input"), true);

    $nombreAcompaniante = $data["nombreAcompaniante"];
    $implemento = $data["implemento"];

    // La columna ID_ACOMPANIANTE es autoincrementable, por lo que no necesitas incluirla en la consulta

    $sentencia = $mysqli->prepare("INSERT INTO acompaniante (NOMBRE_ACOMPANIANTE, IMPLEMENTO) VALUES (?, ?)");
    $sentencia->bind_param("ss", $nombreAcompaniante, $implemento);

    if ($sentencia->execute()) {
        echo json_encode(["success" => true, "message" => "Acompañante creado con éxito"]);
    } else {
        echo json_encode(["success" => false, "message" => "Error al crear el acompañante"]);
    }
} else {
    echo json_encode(["success" => false, "message" => "Método HTTP no permitido. Debe ser una solicitud POST"]);
}
?>