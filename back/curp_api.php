<?php
$mysqli = include_once "conexion.php";
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
header("Allow: GET, POST, OPTIONS, PUT, DELETE");

// Verificar si la solicitud es GET
if ($_SERVER["REQUEST_METHOD"] === "GET" && isset($_GET["curp"])) {
    $curp = $_GET["curp"];

    // Preparar la consulta SQL con JOIN
    $sql = "SELECT u.*, d.DEPENDENCIA, di.DISTINCION, c.CATEGORIA
    FROM usuarios u
    LEFT JOIN dependencia d ON u.DEPENDENCIA = d.ID_DEPENDENCIA
    LEFT JOIN distincion di ON u.DISTINCION = di.ID_DISTINCION
    LEFT JOIN categoria c ON u.CATEGORIA = c.ID_CATEGORIA
    WHERE u.CURP = ?";


    // Preparar la declaración
    $stmt =$mysqli->prepare($sql);
    $stmt->bind_param("s", $curp);

    // Ejecutar la consulta
    $stmt->execute();

    // Obtener el resultado
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        echo json_encode(["success" => true, "data" => $row]);
    } else {
        echo json_encode(["success" => false, "message" => "No se encontraron datos"]);
    }

    // Cerrar la conexión y liberar recursos
    $stmt->close();
    $mysqli->close();
} else {
    echo json_encode(["success" => false, "message" => "Método no permitido o parámetro faltante"]);
}
?>