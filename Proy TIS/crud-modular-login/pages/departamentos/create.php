<?php
    include("database/auth.php");
?>

<div class="container-fluid border-bottom border-top bg-body-tertiary">
    <div class="p-5 rounded text-center">
        <h2 class="fw-normal">Añadir Departamento</h2>
    </div>
</div>

<main class="container mt-5">
    <div class="card">
        <form action="pages/departamentos/actions/store.php" method="POST">
            <div class="card-body">
                <div class="row">
                
                    <div class="col-md-12 mb-3">
                        <label for="cod_departamento" class="form-label">Código Departamento</label>
                        <input type="text" class="form-control" id="cod_departamento" name="cod_departamento" required>
                    </div>

                    <div class="col-md-12 mb-3">
                        <label for="cod_municipalidad" class="form-label">Código Municipalidad</label>
                        <input type="text" class="form-control" id="cod_municipalidad" name="cod_municipalidad" required>
                    </div>

                    <div class="col-md-12 mb-3">
                        <label for="nombre_departamento" class="form-label">Nombre Departamento</label>
                        <input type="text" class="form-control" id="nombre_departamento" name="nombre_departamento" required>
                    </div>

                    <div class="col-md-12 mb-3">
                        <label for="telefono_departamento" class="form-label">Teléfono Departamento</label>
                        <input type="tel" class="form-control" id="telefono_departamento" name="telefono_departamento" required>
                    </div>
                </div>
            </div>

            <div class="card-footer text-body-secondary text-end">
                <button type="submit" class="btn btn-primary">Guardar</button>
            </div>
        </form>
    </div>
</main>