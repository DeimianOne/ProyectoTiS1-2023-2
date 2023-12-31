7.- Calificar funcionamiento del sistema.(felipe) 

R.7 Calificar funcionamiento del sistema: La calificación del sistema consistirá de 2 partes; Una evaluación de la facilidad del sistema para introducir un ticket de retroalimentación, y, luego de que el ticket sea actualizado a estado ‘Terminado’, una evaluación sobre la atención en la respuesta al ticket.

R.7.1: Calificación del sistema:

Entradas: calificacion_sistema, comentario_sistema, cod_ticket, rut_usuario, correo_electronico.

	RF7.1: calificacion es un entero del 1 al 7 que será la calificación asignada por el usuario.
	RF7.2: comentario es un texto de 500 caracteres no obligatorio que será donde el usuario puede detallar la utilizabilidad de la plataforma.
	RF7.3: Tras el ingreso de un ticket, el sistema rescata de la sesión el correo electronico del usuario, y luego genera y envía un correo electrónico a la dirección además de una notificación en la plataforma.
	RF7.4: El correo electrónico incluirá un mensaje solicitando la calificación del sistema y proporcionará un link que redirige a la página de calificación.
    RF7.5: El módulo de calificación presentará una interfaz donde las personas pueden:
        Ver el numero y asunto del ticket ingresado.
        Seleccionar una calificación numérica del 1 al 7, siendo 1 la calificación más baja y 7 la más alta.
        Ingresar comentarios en un campo de texto para detallar su experiencia con el sistema. Este campo opcional permitirá un máximo de 500 caracteres.
        Presionar un botón de enviar para registrar su feedback.
    RF7.6: Una vez que la persona ha seleccionado una calificación y ha ingresado sus comentarios (si opta por hacerlo), puede presionar el botón de enviar para registrar su feedback en la base de datos del sistema.
    RF7.7: En caso de que calificacion_sistema no haya sido seleccionado, se desplegará el mensaje “Completar calificación”
    RF7.8: Tras el envío exitoso, el sistema mostrará un mensaje de agradecimiento por la retroalimentación proporcionada.

Salida 1: calificacion, comentario
Salida 2: Despliegue de mensaje en RF7.7.
Salida 3: Despliegue de mensaje en RF7.8.

R.7.2: Calificación del sistema (atención):

Entradas: calificacion_atencion, comentario_atencion, cod_ticket, rut_usuario, correo_electronico.

	RF7.1: calificacion_atencion es un entero del 1 al 7 que será la calificación asignada por el usuario.
	RF7.2: comentario_atencion es un texto de 500 caracteres que será donde el usuario puede comentar la calidad de la atención recibida.
	RF7.3: Tras la actualización de un ticket a 'Terminado', el sistema rescata de la sesión el correo electronico del usuario, y luego genera y envía un correo electrónico a la dirección.
	RF7.4: El correo electrónico incluirá un mensaje solicitando la calificación del sistema y proporcionará un link que redirige a la página de calificación.
    RF7.5: El módulo de calificación presentará una interfaz donde las personas pueden:
        Ver el numero y asunto del ticket ingresado.
        Seleccionar una calificación numérica del 1 al 7, siendo 1 la calificación más baja y 7 la más alta.
        Ingresar comentarios en un campo de texto para detallar su experiencia con el sistema. Este campo permitirá un máximo de 500 caracteres.
        Presionar un botón de enviar para registrar su feedback.
    RF7.6: Una vez que la persona ha seleccionado una calificación y ha ingresado sus comentarios (si opta por hacerlo), puede presionar el botón de enviar para registrar su feedback en la base de datos del sistema.
    RF7.7: En caso de que calificacion_atencion no haya sido seleccionado no se registrará el intento, y se desplegará el mensaje “Completar calificación”.
    RF7.8: Tras el envío exitoso, el sistema mostrará un mensaje de agradecimiento por la retroalimentación proporcionada.

Salida 1: calificacion_atencion, comentario_atencion
Salida 2: Despliegue de mensaje en RF7.7.
Salida 3: Despliegue de mensaje en RF7.8.




R.7 Calificar funcionamiento del sistema: Tras el ingreso de un ticket, el sistema enviará un correo electrónico a la persona para solicitar una calificación sobre el funcionamiento del sistema antes de permitirle realizar otro ingreso. La calificación se recoge a través de un link que redirige a la página con el formulario de calificación.

Entradas: calificacion, comentario, rut_usuario, correo_electronico.
RF7.1: calificacion es un entero del 1 al 7 que será la calificación asignada por el usuario.
RF7.2: comentario es un texto de 500 caracteres que será donde el usuario puede comentar la experiencia.
RF7.3: Tras el ingreso de un ticket, el sistema rescata de la sesión el correo electronico del usuario, y luego genera y envía un correo electrónico a la dirección.
RF7.4: El correo electrónico incluirá un mensaje solicitando la calificación del sistema y proporcionará un link que redirige a la página de calificación.
RF7.5: El módulo de calificación presentará una interfaz donde las personas pueden:
Seleccionar una calificación numérica del 1 al 7, siendo 1 la calificación más baja y 7 la más alta.
Ingresar comentarios en un campo de texto para detallar su experiencia con el sistema. Este campo permitirá un máximo de 500 caracteres.
Presionar un botón de enviar para registrar su feedback.
RF7.6: Una vez que la persona ha seleccionado una calificación y ha ingresado sus comentarios (si opta por hacerlo), puede presionar el botón de enviar para registrar su feedback en la base de datos del sistema.
RF7.7: En caso de que calificacion no haya sido seleccionado, se desplegará el mensaje “Completar calificación”
RF7.8: Tras el envío exitoso, el sistema mostrará un mensaje de agradecimiento por la retroalimentación proporcionada.
Salida 1: calificacion, comentario
Salida 2: Despliegue de mensaje en RF7.7.
Salida 3: Despliegue de mensaje en RF7.8.

8.- Visualizar en el mapa la cantidad de felicitaciones, reclamos, sugerencias. (felipe)

Utilizando la API de Google Maps el sistema proporcionará un mapa interactivo donde al seleccionar una municipalidad registrada en el sistema, detalles y estadísticas de ésta serán desplegados.



9.- Analizar estadísticas de calificación del sistema.

Por cada municipalidad se generarán estadisticas acerca del numero de ingresos, numero de casos resueltos, tiempo promedio de espera, numero de departamentos, numero de casos resueltos por departamento, calificaciones, etc.