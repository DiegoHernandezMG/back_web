<?php
$mysqli=include_once "conexion.php";

// Verificar si la solicitud es POST
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    // Obtener el ID del usuario del cuerpo de la solicitud
    $userId = $_POST["userId"];

    // Preparar la consulta SQL con JOIN
    $sql = "SELECT u.*, d.DEPENDENCIA, di.DISTINCION, c.CATEGORIA
            FROM usuarios u
            LEFT JOIN dependencia d ON u.DEPENDENCIA = d.ID_DEPENDENCIA
            LEFT JOIN distincion di ON u.DISTINCION = di.ID_DISTINCION
            LEFT JOIN categoria c ON u.CATEGORIA = c.ID_CATEGORIA
            WHERE u.ID = ?";
    
    // Preparar la declaración
    $stmt = $mysqli->prepare($sql);
    $stmt->bind_param("i", $userId); // Suponiendo que el ID es un entero
    
    // Ejecutar la consulta
    $stmt->execute();
    
    // Obtener el resultado
    $result = $stmt->get_result();
    
    // Verificar si se encontraron resultados
    if ($result->num_rows > 0) {
        // Obtener los datos del usuario con descripciones relacionadas
        $row = $result->fetch_assoc();

        // Crear un fragmento de HTML con los datos del usuario
        $html = "<ul>";
        foreach ($row as $key => $value) {
            $html .= "<li><strong>$key:</strong> $value</li>";
        }
        $html .= "</ul>";

        // Devolver el fragmento de HTML como respuesta
        echo $html;
    } else {
        // Devolver un mensaje indicando que no se encontraron datos
        echo "No se encontraron datos para el usuario con ese ID.";
    }
    
    // Cerrar la conexión y liberar recursos
    $stmt->close();
    $mysqli->close();
}
?>