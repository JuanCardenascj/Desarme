<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestión de Armas</title>
    <link rel="stylesheet" href="estilos.css">
</head>
<body>


<?php
$host = "localhost";
$user = "root";
$pass = "";
$db = "control_armas"; 

$conexion = new mysqli($host, $user, $pass, $db);

if ($conexion->connect_error) {
    die("Conexión fallida: " . $conexion->connect_error);
}
?>
