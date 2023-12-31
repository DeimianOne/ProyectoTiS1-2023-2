<?php
include("database/connection.php");  // Incluye la conexión
include("database/auth.php");  // Comprueba si el usuario está logueado, sino lo redirige al login

if (isset($_SESSION['rol_usuario']) && $_SESSION['rol_usuario'] == '1') {

    $query = "SELECT * FROM palabra_ofensiva";
    $result = mysqli_query($connection, $query);

} else {
    header("Location: index.php?p=auth/login");
}
?>

<div class="container-fluid border-bottom border-top bg-body-tertiary">
    <div class=" p-5 rounded text-center">
        <h2 class="fw-normal">Palabras ofensivas</h1>
    </div>
</div>

<script>
    $(document).ready(function () {
        $('#example').DataTable({
            "language": {
                "lengthMenu": "Mostrar _MENU_ registros",
                "zeroRecords": "No se encontraron resultados",
                "info": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                "infoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                "infoFiltered": "(filtrado de un total de _MAX_ registros)",
                "sSearch": "Buscar:",
                "oPaginate": {
                    "sFirst": "Primero",
                    "slast": "Ultimo",
                    "sNext": "Siguiente",
                    "sPrevious": "Anterior",
                },
                "sProcessing": "Procesando...",


            }
        });
    });

    function showDoubleConfirmModal(codDepartamento) {
        $('#doubleConfirmModal').modal('show');

        // Guarda el ID del departamento que se eliminará para usarlo en la función executeDelete
        $('#doubleConfirmModal').data('codDepartamento', codDepartamento);
    }

    function executeDelete() {
        // Obtiene el ID del departamento guardado
        var codDepartamento = $('#doubleConfirmModal').data('codDepartamento');

        // Cierra el modal de doble confirmación
        $('#doubleConfirmModal').modal('hide');

        // Ejecuta la función confirmDelete con el ID del departamento
        confirmDelete(codDepartamento);
    }

    function confirmDelete(cod) {
        window.location.href = 'pages/palabrasofensivas/actions/delete.php?cod_palabra=' + cod;
    }
</script>

<main class="container mt-5">

    <div class="card">
        <div class="card-header">
            <div class="d-flex justify-content-between align-items-center">
                <div class="text-center">
                    <span>Listado de palabras no permitidas en un ticket</span>
                </div>
                <div>
                    <a class="btn btn-sm btn-primary" href="index.php?p=palabrasofensivas/create" role="button">Agregar nuevo</a>
                </div>
            </div>
        </div>
        <div class="card-body table-responsive ">
            <table id="example" class="display table-hover justify-content-center" style="width:100%">
                <thead class="">
                    <tr>
                        <th scope="col">Codigo palabra</th>
                        <th scope="col">Palabra</th>
                        <th scope="col">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <?php while ($fila = mysqli_fetch_array($result)): ?>
                        <tr>
                            <th scope="row">
                                <?= $fila['cod_palabra'] ?>
                            </th>
                            <td>
                                <?= $fila['palabra'] ?>
                            </td>
                            <td>
                                <div class="btn-group" role="group" aria-label="Acciones">
                                    <a href="index.php?p=palabrasofensivas/edit&cod_palabra=<?= $fila['cod_palabra'] ?>"
                                        class="btn btn-sm btn-outline-warning">Editar</a>
                                    <a href="javascript:void(0);" onclick="showDoubleConfirmModal(<?= $fila['cod_palabra'] ?>)"
                                        class="btn btn-sm btn-outline-danger">Eliminar</a>
                                </div>
                            </td>
                        </tr>
                    <?php endwhile; ?>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Double Confirmation Modal -->
    <div class="modal fade" id="doubleConfirmModal" tabindex="-1" aria-labelledby="doubleConfirmModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header bg-danger text-white text-center">
                    <h1 class="modal-title fs-5" id="doubleConfirmModalLabel">
                        Confirmación
                    </h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body text-center">
                    <p><strong>¿Seguro que deseas eliminar esta fila?</strong> <br> Esta acción no se puede deshacer.</p>
                </div>
                <div class="modal-footer justify-content-center">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-danger" onclick="executeDelete()">Eliminar</button>
                </div>
            </div>
        </div>
    </div>
</main>