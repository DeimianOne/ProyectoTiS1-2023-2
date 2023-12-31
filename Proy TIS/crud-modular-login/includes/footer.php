<?php if (!$_SESSION['is_ajax_request']): ?>
    <div class="container mt-auto">

        <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
            <div class="col-md-4 d-flex align-items-center">
                <a href="/" class="mb-3 me-2 mb-md-0 text-body-secondary text-decoration-none lh-1">
                    <svg class="bi" width="30" height="24">
                        <use xlink:href="#bootstrap"></use>
                    </svg>
                </a>
                <span class="mb-3 mb-md-0 text-body-secondary">© 2023 Company, Inc</span>
            </div>

            <ul class="nav col-md-4 justify-content-end list-unstyled d-flex">
                <li class="ms-3">
                    <a class="text-body-secondary" href="#">
                        <i class="fa-brands fa-x-twitter"></i>
                    </a>
                </li>
                <li class="ms-3">
                    <a class="text-body-secondary" href="#">
                        <i class="fa-brands fa-facebook"></i>
                    </a>
                </li>
                <li class="ms-3">
                    <a class="text-body-secondary" href="#">
                        <i class="fa-brands fa-instagram"></i>
                    </a>
                </li>
            </ul>
        </footer>

    </div>
    <!-- Scripts de Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>

    <!-- DataTables JS -->
    <script type="text/javascript" src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.13.7/js/dataTables.bootstrap5.min.js"></script>

    <!--Full Calendar -->
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <!--InputMask -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/5.0.8/jquery.inputmask.min.js"></script>

    <!--Maps API -->

    <script
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBWTchPkQp1ZRiaRZwNqHkz98Jc64z4-4Y&libraries=places&callback=initMapCallback"
        async defer></script>

    <script>
        function initMapCallback() {
            if (typeof initCreateMap === 'function') {
                initCreateMap();
            } else if (typeof initLoadMap === 'function') {
                initLoadMap();
            } else if (typeof initTicketMap === 'function') {
                initTicketMap();
            }
            // Puedes agregar más condicionales para otras páginas/mapas
        }</script>
    </body>

    </html>

<?php endif; ?>

<script>
    const temaOscuro = () => {
        document.querySelector("body").setAttribute("data-bs-theme", "dark");
        document.querySelector("#d1-icon").setAttribute("class", "bi bi-sun-fill");
        // Save theme preference to localStorage
        localStorage.setItem("theme", "dark");
    }

    const temaClaro = () => {
        document.querySelector("body").setAttribute("data-bs-theme", "light");
        document.querySelector("#d1-icon").setAttribute("class", "bi bi-moon-fill");
        // Save theme preference to localStorage
        localStorage.setItem("theme", "light");
    }

    const cargarTemaActual = () => {
        // Retrieve theme preference from localStorage
        const temaGuardado = localStorage.getItem("theme");
        if (temaGuardado === "dark") {
            temaOscuro();
        } else {
            temaClaro();
        }
    }

    const cambiarTema = () => {
        document.querySelector("body").getAttribute("data-bs-theme") === "light" ? temaOscuro() : temaClaro();
    }

    // Load the theme when the page is ready
    document.addEventListener("DOMContentLoaded", cargarTemaActual);
</script>
