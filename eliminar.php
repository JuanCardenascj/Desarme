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
$conexion->query("DELETE FROM Arma WHERE id_arma=$id");
header("Location: index.php");
?>
