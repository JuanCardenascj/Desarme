<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestión de Armas</title>
    <link rel="stylesheet" href="estilos.css">
</head>
<body>


<?php
include 'db.php';
$id = $_GET['id'];
$arma = $conexion->query("SELECT * FROM Arma WHERE id_arma=$id")->fetch_assoc();

if ($_POST) {
    $numero_serie = $_POST['numero_serie'];
    $origen = $_POST['origen'];
    $fabricante = $_POST['fabricante'];
    $id_tipo_arma = $_POST['id_tipo_arma'];
    $id_estado_arma = $_POST['id_estado_arma'];

    $conexion->query("UPDATE Arma SET 
        numero_serie='$numero_serie', 
        origen='$origen', 
        fabricante='$fabricante', 
        id_tipo_arma=$id_tipo_arma, 
        id_estado_arma=$id_estado_arma 
        WHERE id_arma=$id");

    header("Location: index.php");
}
?>

<form method="POST">
    <h2>Editar Arma</h2>
    Número de Serie: <input type="text" name="numero_serie" value="<?= $arma['numero_serie'] ?>"><br>
    Origen: <input type="text" name="origen" value="<?= $arma['origen'] ?>"><br>
    Fabricante: <input type="text" name="fabricante" value="<?= $arma['fabricante'] ?>"><br>
    Tipo de Arma (ID): <input type="number" name="id_tipo_arma" value="<?= $arma['id_tipo_arma'] ?>"><br>
    Estado del Arma (ID): <input type="number" name="id_estado_arma" value="<?= $arma['id_estado_arma'] ?>"><br>
    <button type="submit">Actualizar</button>
</form>
<a href="index.php">← Volver</a>

