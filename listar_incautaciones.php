<?php include 'db.php'; ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Incautaciones Registradas</title>
    <link rel="stylesheet" href="estilos.css">
</head>
<body>

<h2>Historial de Incautaciones</h2>
<a href="registrar_incautacion.php">+ Nueva Incautación</a>

<table border="1">
    <tr>
        <th>Fecha</th>
        <th>Ciudadano</th>
        <th>Funcionario</th>
        <th>Lugar</th>
        <th>Número de Serie</th>
        <th>Tipo Arma</th>
        <th>Estado Arma</th>
    </tr>

    <?php
    $sql = "
        SELECT 
            i.fecha,
            c.nombre AS ciudadano,
            f.nombre AS funcionario,
            l.nombre AS lugar,
            a.numero_serie,
            t.nombre AS tipo_arma,
            e.condicion AS estado_arma
        FROM Arma_Incautada ai
        INNER JOIN Arma a ON ai.id_arma = a.id_arma
        INNER JOIN Incautacion i ON ai.id_incautacion = i.id_incautacion
        INNER JOIN Ciudadano c ON i.id_ciudadano = c.id_ciudadano
        INNER JOIN Funcionario f ON i.id_funcionario = f.id_funcionario
        INNER JOIN Lugar l ON i.id_lugar = l.id_lugar
        INNER JOIN Tipo_Arma t ON a.id_tipo_arma = t.id_tipo_arma
        INNER JOIN Estado_Arma e ON a.id_estado_arma = e.id_estado_arma
        ORDER BY i.fecha DESC
    ";

    $resultado = $conexion->query($sql);

    while ($row = $resultado->fetch_assoc()) {
        echo "<tr>
            <td>{$row['fecha']}</td>
            <td>{$row['ciudadano']}</td>
            <td>{$row['funcionario']}</td>
            <td>{$row['lugar']}</td>
            <td>{$row['numero_serie']}</td>
            <td>{$row['tipo_arma']}</td>
            <td>{$row['estado_arma']}</td>
        </tr>";
    }
    ?>
</table>

</body>
</html>
