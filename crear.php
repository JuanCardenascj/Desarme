<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestión de Armas</title>
    <link rel="stylesheet" href="estilos.css">
</head>
<body>


<?php include 'db.php';

if ($_POST) {
    $numero_serie = $_POST['numero_serie'];
    $origen = $_POST['origen'];
    $fabricante = $_POST['fabricante'];
    $id_tipo_arma = $_POST['id_tipo_arma'];
    $id_estado_arma = $_POST['id_estado_arma'];

    $conexion->query("INSERT INTO Arma (numero_serie, origen, fabricante, id_tipo_arma, id_estado_arma)
                      VALUES ('$numero_serie', '$origen', '$fabricante', $id_tipo_arma, $id_estado_arma)");
    header("Location: index.php");
}
?>

<form method="POST">
    <h2>Agregar Nueva Arma</h2>
    Número de Serie: <input type="text" name="numero_serie" required><br>
    Origen: <input type="text" name="origen" required><br>
    Fabricante: <input type="text" name="fabricante"><br>
    Tipo de Arma (ID): <input type="number" name="id_tipo_arma"><br>
    Estado del Arma (ID): <input type="number" name="id_estado_arma"><br>
    <button type="submit">Guardar</button>
</form>
<a href="index.php">← Volver</a>
