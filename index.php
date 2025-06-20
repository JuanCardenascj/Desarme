<?php include 'db.php'; ?>
<!DOCTYPE html>
<html>
<head>
    <title>Lista de Armas</title>
    <link rel="stylesheet" href="estilos.css">
</head>
<body>
    <h2>Gestión de Armas Incautadas</h2>
    <a href="crear.php">+ Agregar Arma</a>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Número de Serie</th>
            <th>Origen</th>
            <th>Fabricante</th>
            <th>ID Tipo Arma</th>
            <th>ID Estado Arma</th>
            <th>Acciones</th>
        </tr>
        <?php
        $resultado = $conexion->query("SELECT * FROM Arma");
        while ($fila = $resultado->fetch_assoc()) {
            echo "<tr>
                    <td>{$fila['id_arma']}</td>
                    <td>{$fila['numero_serie']}</td>
                    <td>{$fila['origen']}</td>
                    <td>{$fila['fabricante']}</td>
                    <td>{$fila['id_tipo_arma']}</td>
                    <td>{$fila['id_estado_arma']}</td>
                    <td>
                        <a href='editar.php?id={$fila['id_arma']}'>Editar</a> |
                        <a href='eliminar.php?id={$fila['id_arma']}'>Eliminar</a>
                    </td>
                </tr>";
        }
        ?>
    </table>
</body>
</html>
