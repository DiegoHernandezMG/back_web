<?php
$mysqli=include_once "conexion.php";

// Verificar si la solicitud es POST
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    // Obtener el CURP del cuerpo de la solicitud
    $curp = $_POST["curp"];

// Preparar la consulta SQL con JOIN
$sql = "SELECT u.*, d.DEPENDENCIA, di.DISTINCION, c.CATEGORIA, a.NOMBRE_ACOMPANIANTE
        FROM usuarios u
        LEFT JOIN dependencia d ON u.DEPENDENCIA = d.ID_DEPENDENCIA
        LEFT JOIN distincion di ON u.DISTINCION = di.ID_DISTINCION
        LEFT JOIN categoria c ON u.CATEGORIA = c.ID_CATEGORIA
        LEFT JOIN acompaniante a ON u.ACOMPANIANTE = a.ID_ACOMPANIANTE
        WHERE u.CURP = ?";

    
    // Preparar la declaración
    $stmt =$mysqli->prepare($sql);
    $stmt->bind_param("s", $curp);
    
    // Ejecutar la consulta
    $stmt->execute();
    
    // Obtener el resultado
    $result = $stmt->get_result();
    
    // Verificar si se encontraron resultados
    if ($result->num_rows > 0) {
        // Obtener los datos del usuario
        $row = $result->fetch_assoc();

        // Devolver solo los valores del usuario como arreglo
        echo json_encode(array_values($row));
    } else {
        // Devolver un arreglo vacío como respuesta JSON
        echo json_encode([]);
    }
    
    // Cerrar la conexión y liberar recursos
    $stmt->close();
    $mysqli->close();
}
?>