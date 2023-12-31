<?php
require('database/connection.php');

// If form submitted, insert values into the database.
if (isset($_REQUEST['rut_usuario'])) {
    $rut_usuario = stripslashes($_REQUEST['rut_usuario']);
    $rut_usuario = str_replace('.', '', $rut_usuario);
    $rut_usuario = mysqli_real_escape_string($connection, $rut_usuario);

    // Check if the RUT already exists
    $check_query = "SELECT * FROM usuario WHERE rut_usuario = '$rut_usuario'";
    $check_result = mysqli_query($connection, $check_query);

    if (mysqli_num_rows($check_result) > 0) {
        // RUT already registered, display a message and exit
        echo "<div class='alert alert-danger' role='alert'><strong>Error:</strong> El RUT ya está registrado.</div>";
        exit();
    }

    $nombre_usuario = stripslashes($_REQUEST['nombre_usuario']);
    $nombre_usuario = mysqli_real_escape_string($connection, $nombre_usuario);

    $password_usuario = stripslashes($_REQUEST['password_usuario']);
    $password_usuario = mysqli_real_escape_string($connection, $password_usuario);

    //HASHING USANDO BCRYPT que es el por defecto en la version actual, más apropiado que cd5 o SHA
    $password_hash = password_hash($password_usuario, PASSWORD_DEFAULT);

    $correo_electronico_usuario = stripslashes($_REQUEST['correo_electronico_usuario']);
    $correo_electronico_usuario = mysqli_real_escape_string($connection, $correo_electronico_usuario);

    $correo_electronico_tercero = isset($_REQUEST['correo_electronico_tercero']) ? stripslashes($_REQUEST['correo_electronico_tercero']) : "";
    $correo_electronico_tercero = mysqli_real_escape_string($connection, $correo_electronico_tercero);

    $telefono_usuario = isset($_REQUEST['telefono_usuario']) ? stripslashes($_REQUEST['telefono_usuario']) : "";
    $telefono_usuario = mysqli_real_escape_string($connection, $telefono_usuario);

    $telefono_tercero = isset($_REQUEST['telefono_tercero']) ? stripslashes($_REQUEST['telefono_tercero']) : "";
    $telefono_tercero = mysqli_real_escape_string($connection, $telefono_tercero);

    $trn_date = date("Y-m-d H:i:s");
    $query = "INSERT into `usuario` (rut_usuario, nombre_usuario, password_usuario, correo_electronico_usuario, correo_electronico_tercero, telefono_usuario, telefono_tercero) VALUES ('$rut_usuario', '$nombre_usuario','$password_hash', '$correo_electronico_usuario', '$correo_electronico_tercero', '$telefono_usuario', '$telefono_tercero');";
    $result = mysqli_query($connection, $query);
    $query2 = "INSERT into `usuario_rol` (cod_rol, rut_usuario) VALUES (2,'$rut_usuario')";
    $result2 = mysqli_query($connection, $query2);

    if ($result && $result2) {
        echo "<div class='alert alert-success' role='alert'><strong>Éxito:</strong> Te has registrado correctamente! Haz click aquí para <a href='index.php?p=auth/login'>Logearte</a></div>";
    }
} else {
    ?>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h1 class="text-center">Registrate Aquí</h1>
                    </div>
                    <div class="card-body">
                        <form name="registration" action="" method="post">
                            <div class="form-group mb-3">
                                <label for="rut_usuario" class="form-label">RUT</label>
                                <input type="text" name="rut_usuario" maxlength="11" class="form-control" id="rut_usuario"
                                    required>
                            </div>
                            <div class="form-group mb-3">
                                <label for="nombre_usuario" class="form-label">Nombre</label>
                                <input type="text" name="nombre_usuario" class="form-control" id="nombre_usuario">
                            </div>
                            <div class="form-group mb-3">
                                <label for="password_usuario" class="form-label">Contraseña</label>
                                <input type="password" name="password_usuario" class="form-control" id="password_usuario">
                            </div>
                            <div class="form-group mb-3">
                                <label for="correo_electronico_usuario" class="form-label">Correo Electrónico</label>
                                <input type="email" name="correo_electronico_usuario" class="form-control"
                                    id="correo_electronico_usuario">
                            </div>
                            <div class="form-group mb-3">
                                <label for="correo_electronico_tercero" class="form-label">Correo Electrónico
                                    Tercero</label>
                                <input type="email" name="correo_electronico_tercero" class="form-control"
                                    id="correo_electronico_tercero">
                                <small id="campoOpcional" class="form-text text-muted">Opcional</small>
                            </div>
                            <div class="form-group mb-3">
                                <label for="telefono_usuario" class="form-label">Teléfono</label>
                                <input type="number" name="telefono_usuario" class="form-control" id="telefono_usuario"
                                    pattern="\d*" title="Ingrese solo números">
                            </div>

                            <div class="form-group mb-3">
                                <label for="telefono_tercero" class="form-label">Teléfono Tercero</label>
                                <input type="number" name="telefono_tercero" class="form-control" id="telefono_tercero"
                                    pattern="\d*" title="Ingrese solo números">
                                <small id="campoOpcional" class="form-text text-muted">Opcional</small>
                            </div>

                            <div class="d-grid gap-2">
                                <button type="submit" name="submit" class="btn btn-primary">Registrarse</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>

        function formatRut(value) {
            // First, remove any non-digits and then any leading zeros
            let rut = value.replace(/\D/g, '').replace(/^0+/, '');
            // Reverse the RUT string to start formatting from the end (right side)
            let reversedRut = rut.split('').reverse().join('');
            // Add a dot every three characters
            let formattedRut = reversedRut.match(/.{1,3}/g).join('.');
            // Reverse the string back to its normal order
            formattedRut = formattedRut.split('').reverse().join('');
            return formattedRut;
        }

        function rutFormatter() {
            const inputField = document.getElementById('rut_usuario');
            inputField.addEventListener('input', function () {
                const formattedInputValue = formatRut(this.value);
                this.value = formattedInputValue;
            });
        }

        // Initialize the rutFormatter on window load
        window.addEventListener('load', rutFormatter);


    </script>



    <?php
}
?>