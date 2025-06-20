<?php include 'db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $fecha = $_POST['fecha'];
    $id_lugar = $_POST['id_lugar'];
    $id_funcionario = $_POST['id_funcionario'];
    $id_ciudadano = $_POST['id_ciudadano'];
    $numero_serie = $_POST['numero_serie'];
    $origen = $_POST['origen'];
    $fabricante = $_POST['fabricante'];
    $id_tipo_arma = $_POST['id_tipo_arma'];
    $id_estado_arma = $_POST['id_estado_arma'];

    
    $sql = "CALL RegistrarIncautacionCompleta(
        '$fecha', $id_lugar, $id_funcionario, $id_ciudadano,
        '$numero_serie', '$origen', '$fabricante', $id_tipo_arma, $id_estado_arma
    )";

    if ($conexion->query($sql)) {
        echo "<p><strong>✔ Incautación registrada correctamente.</strong></p>";
    } else {
        echo "<p><strong>✖ Error:</strong> " . $conexion->error . "</p>";
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registrar Incautación</title>
    <link rel="stylesheet" href="estilos.css">
</head>
<body>

<h2>Registrar Nueva Incautación</h2>

<form method="POST">
    <label>Fecha:</label>
    <input type="date" name="fecha" required><br>

    <label>ID Lugar:</label>
    <input type="number" name="id_lugar" required><br>

    <label>ID Funcionario:</label>
    <input type="number" name="id_funcionario" required><br>

    <label>ID Ciudadano:</label>
    <input type="number" name="id_ciudadano" required><br>

    <label>Número de Serie:</label>
    <input type="text" name="numero_serie" required><br>

    <label>Origen:</label>
    <input type="text" name="origen" required><br>

    <label>Fabricante:</label>
    <input type="text" name="fabricante"><br>

    <label>ID Tipo de Arma:</label>
    <input type="number" name="id_tipo_arma" required><br>

    <label>ID Estado de Arma:</label>
    <input type="number" name="id_estado_arma" required><br>

    <button type="submit">Registrar Incautación</button>
</form>

<a href="index.php">← Volver</a>

</body>
</html>
