<?php

// Pequeña lógica para capturar la pagina que queremos abrir
$pagina = isset($_GET['p']) ? strtolower($_GET['p']) : 'home';

session_start();

// Define una variable para identificar las solicitudes AJAX
$_SESSION['is_ajax_request'] = $_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['municipalidad']);

// El fragmento de html que contiene la cabecera de nuestra web
require_once 'includes/header.php';


/* Estamos considerando que el parámetro enviando tiene el mismo nombre del archivo a cargar, si este no fuera así
    se produciría un error de archivo no encontrado */
require_once 'pages/' . $pagina . '.php';

// Otra opción es validar usando un switch, de esta manera para el valor esperado le indicamos que página cargar


// El fragmento de html que contiene el pie de página de nuestra web
require_once 'includes/footer.php';

// Al final de tu script, restablece la variable
$_SESSION['is_ajax_request'] = false;

?>