# Hoja de ruta de Kyro

Estado de las 100 ideas originales en Kyro 0.4.9. **Disponible** indica que el flujo principal ya existe, **parcial** que solo se ha implementado una parte y **pendiente** que todavía no se entrega.

43 disponibles · 30 parciales · 27 pendientes.

## Tareas y trabajo en segundo plano

- **#1 Ficha de tarea** · Disponible · Reúne objetivo, criterios, pasos, propuestas y comprobaciones con sus estados y accesos directos.
- **#2 Criterios de aceptación** · Disponible · Objetivo y criterios editables en Preparar tarea.
- **#3 Plan editable** · Disponible · El plan permite editar y reordenar sus pasos desde el chat.
- **#4 Guardado por paso** · Parcial · Guarda puntos de control durante los tramos de herramientas.
- **#5 Bandeja de decisiones** · Disponible · Bandeja Decisiones pendientes en Ctrl + K.
- **#6 Cola visible** · Disponible · El panel muestra el orden de espera, permite cancelar y da el siguiente turno al trabajo que priorices.
- **#7 Reintento de un paso** · Parcial · Reanuda tareas y prepara un nuevo intento para pruebas fallidas o solicitudes caducadas. Falta el reintento general de cada paso de un agente.
- **#8 Continuar por otra vía** · Disponible · Retoma un mensaje como borrador, conserva el chat original y elige si quieres revertir los cambios posteriores de Kyro.
- **#9 Dependencias entre tareas** · Pendiente
- **#10 Avisos que llevan al sitio correcto** · Parcial · La bandeja y los avisos llevan al chat. Falta navegar desde una notificación del sistema.

## Comprensión del código

- **#11 Índice incremental** · Disponible · Índice incremental con exclusiones por proyecto.
- **#12 Búsqueda por símbolos** · Disponible · Busca declaraciones de funciones, clases y otros símbolos en Ctrl + K.
- **#13 Referencias de funciones** · Parcial · Busca el nombre completo en archivos de código y navega a sus coincidencias. Falta la resolución semántica del símbolo.
- **#14 Mapa de dependencias** · Parcial · Consulta importaciones directas entre archivos JavaScript y TypeScript. Quedan pendientes los alias y las relaciones de varios niveles.
- **#15 Proyectos con varias carpetas** · Pendiente
- **#16 Búsqueda por significado opcional** · Pendiente
- **#17 Contexto visible** · Parcial · Muestra el alcance de lectura de las revisiones, las menciones y los archivos fijados. Falta un inventario de fragmentos por petición.
- **#18 Resumen de chats largos** · Pendiente
- **#19 Citas desactualizadas** · Parcial · Las notas de código detectan fragmentos modificados y buscan coincidencias únicas en el mismo archivo. Falta llevar la comprobación a las citas del chat.
- **#20 Relación entre código y pruebas** · Disponible · En JavaScript y TypeScript enlaza las pruebas Node que importan el módulo y, desde una prueba, los módulos locales que importa. Distingue importaciones y coincidencias de nombre.

## Edición y revisión

- **#21 Propuestas persistentes** · Disponible · Las propuestas pendientes se recuperan del perfil tras reiniciar.
- **#22 Diff agrupado por función** · Pendiente
- **#23 Comentarios sobre líneas** · Disponible · Notas locales de una línea o rango, con búsqueda, estados y cambio de vínculo.
- **#24 Editor lateral ligero** · Disponible · Edita archivos de texto desde el panel, guarda con copia previa y puede revisar el diff antes de escribir.
- **#25 Cambios de nombre y eliminaciones revisables** · Pendiente
- **#26 Comparación a tres bandas** · Disponible · Compara la base de una propuesta, el contenido actual en disco y el resultado propuesto. Resalta los cambios y permite volver a leer el archivo.
- **#27 Agrupar por propósito** · Pendiente
- **#28 Versiones de una propuesta** · Pendiente
- **#29 Recuperación de tandas interrumpidas** · Parcial · Las tandas guardan copias y restauran cambios tras un fallo durante la aplicación. Falta recuperación específica tras un cierre durante la escritura.
- **#30 Exportar un parche** · Disponible · Git permite exportar el diff preparado como parche.

## Git y colaboración

- **#31 Copia Git desde el chat** · Disponible · Al preparar una tarea puedes elegir una copia existente o crear una desde el commit actual. El plan se guarda como borrador en la copia.
- **#32 Preparación de la copia** · Parcial · Puedes ejecutar comprobaciones autorizadas en la copia. Falta un flujo de aprovisionamiento.
- **#33 Inventario de copias** · Disponible · El inventario reúne las copias registradas, muestra origen, base, rama y cambios, y permite abrirlas o revisar su ubicación.
- **#34 Historial de un archivo** · Disponible · Historial de un archivo desde su visor.
- **#35 Stage selectivo** · Parcial · Prepara archivos completos. La selección de bloques existe para aplicar propuestas.
- **#36 Vista previa de commit** · Disponible · Muestra el diff exacto y sugiere un mensaje editable según los archivos preparados.
- **#37 Traspaso del chat entre copias** · Pendiente
- **#38 PR en borrador** · Disponible · Sugiere título y descripción desde los commits y los archivos de la rama comparada. El contenido se edita y confirma antes de publicarlo.
- **#39 Estado de CI** · Disponible · Lista las comprobaciones del PR y abre el resultado en el navegador cuando GitHub proporciona un enlace HTTPS.
- **#40 Revisión de comentarios del PR** · Disponible · Abre el archivo local en su línea y permite vincular una propuesta del mismo archivo a cada comentario.

## Pruebas y pruebas visuales

- **#41 Probar una propuesta en su copia** · Disponible · Aplica propuestas en una copia Git para ejecutar pruebas autorizadas.
- **#42 Comandos de verificación por proyecto** · Disponible · Guarda comprobaciones con programa, argumentos y carpeta.
- **#43 Pruebas dirigidas** · Disponible · Desde el visor, Kyro localiza pruebas Node por archivo y permite ejecutar una sola con autorización.
- **#44 Resultados navegables** · Disponible · Enlaza ubicaciones reconocidas en la salida de pruebas a archivos locales y a su línea.
- **#45 Comparación antes y después** · Parcial · Compara dos ejecuciones de una rutina. Falta vincularlas automáticamente a los cambios y al commit de referencia.
- **#46 Errores previos y nuevos** · Disponible · Compara casos individuales en las salidas TAP de Node, unittest y Cargo. Distingue fallos nuevos, persistentes y corregidos.
- **#47 Vista web local** · Pendiente
- **#48 Capturas comparables** · Pendiente
- **#49 Consola del navegador** · Pendiente
- **#50 Informe de entrega** · Disponible · Exporta el plan, cambios y pruebas reales a Markdown.

## Agentes y personalización

- **#51 Reglas del proyecto** · Disponible · Importación de AGENTS.md con revisión previa en los ajustes del proyecto.
- **#52 Reglas por carpeta** · Pendiente
- **#53 Skills locales** · Parcial · Las rutinas manuales guardan un plan y comprobaciones del proyecto. Falta un formato de skills.
- **#54 Selector `/`** · Disponible · Abre acciones de proyecto, biblioteca, ajustes y plantillas desde el compositor, con ratón o teclado.
- **#55 Plantillas de tarea** · Disponible · Plantillas iniciales y personales para preparar tareas.
- **#56 Revisor independiente** · Parcial · Las revisiones contrastan hallazgos con el código. Falta un agente aislado que revise el diff.
- **#57 Delegación con contexto separado** · Pendiente
- **#58 Permisos por perfil** · Parcial · Programar respeta los permisos de edición y la confirmación global o por proyecto. Falta una matriz editable por agente y proyecto.
- **#59 Hooks locales declarativos** · Pendiente
- **#60 Memoria con fuentes** · Disponible · Conserva notas generales y notas individuales. Una nota puede llevar de vuelta a su respuesta o a la línea del código que la originó.

## Modelos locales y rendimiento

- **#61 Pruebas de capacidad por modelo** · Parcial · Prueba fija de lectura y propuesta exacta. Falta una batería de proyectos con ejecución de pruebas.
- **#62 Ficha de compatibilidad** · Parcial · Catálogo por uso, estimaciones de memoria y medición de herramientas/código. Falta una ficha de capacidades completa.
- **#63 Comparación en la misma tarea** · Pendiente
- **#64 Diagnóstico de lentitud** · Parcial · Mide memoria, primer token y velocidad. Falta separar tiempos de carga, contexto y generación por tarea.
- **#65 Ajuste por batería y memoria** · Pendiente
- **#66 Estimación antes de enviar** · Parcial · Estima el ajuste a RAM/VRAM en biblioteca y el modelo automático previsto. Falta estimar el reparto CPU/GPU antes de cada envío.
- **#67 Recuperación tras falta de memoria** · Pendiente
- **#68 Asignación por fase** · Pendiente
- **#69 Historial de mediciones** · Parcial · Hay mediciones y se indica si el modelo estaba cargado. Falta comparar su historial por contexto.
- **#70 Gestión del almacenamiento** · Parcial · Permite elegir la carpeta de descargas y consultar su espacio disponible. Falta trasladar los modelos existentes desde Kyro.

## Interfaz y uso diario

- **#71 Pestañas laterales persistentes** · Parcial · Fija archivos. Falta fijar diffs y pruebas y conservar sus posiciones.
- **#72 Panel redimensionable** · Disponible · Panel ajustable por arrastre y teclado.
- **#73 Barra de resultados del chat** · Disponible · El chat muestra accesos directos a archivos leídos, propuestas y comprobaciones cuando hay resultados.
- **#74 Búsqueda dentro del historial** · Disponible · Búsqueda de palabras y frases en los mensajes guardados.
- **#75 Menú al seleccionar código** · Disponible · Permite editar exactamente las líneas seleccionadas, citar, pedir una explicación, añadir notas y buscar referencias.
- **#76 Contexto visible en el editor** · Disponible · Cada mención de archivo o carpeta aparece como una ficha que se puede retirar antes de enviar.
- **#77 Explorador de archivos por árbol** · Disponible · Carpetas desplegables que se recuerdan por proyecto, filtro por ruta y paginación.
- **#78 Dos chats lado a lado** · Disponible · Abre una segunda conversación con su actividad en directo, filtra por chat o proyecto e intercambia ambas conservando los borradores.
- **#79 Atajos configurables y navegación completa con teclado** · Parcial · Atajos documentados, tecla de envío configurable y controles de teclado en los selectores. Falta configuración completa.
- **#80 Vistas Inicio y Desarrollo** · Parcial · El chat personal se abre con el compositor centrado y los proyectos mantienen el compositor al pie y el panel de trabajo opcional. Imágenes tiene su propio espacio.

## Integraciones y automatizaciones

- **#81 Abrir en tu editor** · Disponible · Salto a línea en VS Code, VSCodium o Cursor si se detectan.
- **#82 Enviar una selección desde el editor** · Pendiente
- **#83 CLI local** · Pendiente
- **#84 MCP de lectura** · Pendiente
- **#85 Permisos por integración** · Parcial · Permiso revocable para GitHub por repositorio. Falta un panel común de integraciones.
- **#86 Importar una incidencia** · Disponible · Importa una incidencia de GitHub como borrador de tarea editable.
- **#87 Automatizaciones locales optativas** · Parcial · Las rutinas se inician manualmente. Falta la programación.
- **#88 Historial de ejecuciones programadas** · Parcial · Historial de rutinas manuales. Falta registrar ejecuciones programadas y su próxima fecha.
- **#89 Paquetes de configuración** · Pendiente
- **#90 Visores para salidas habituales** · Disponible · Vista previa de PNG, JPEG y WebP con dimensiones. Markdown y JSON alternan entre vista previa y código numerado. El panel de pruebas mantiene sus resultados navegables.

## Instalación, privacidad y fiabilidad

- **#91 Base de datos local con migración** · Disponible · Migración de JSON a SQLite y búsqueda en el historial.
- **#92 Actualizaciones firmadas** · Parcial · Kyro descarga la actualización y verifica tamaño y SHA-256 desde la app. Falta firma Authenticode y verificación del publicador.
- **#93 Volver a la versión anterior** · Pendiente
- **#94 Canal estable y beta** · Pendiente
- **#95 Diagnóstico exportable** · Disponible · Exporta versión, hardware y estado de Ollama a JSON desde Datos y privacidad. El informe omite chats, ubicaciones y nombres de proyectos o modelos.
- **#96 Copias de seguridad configurables** · Parcial · Exporta una copia del perfil SQLite y JSON. Faltan selección de contenido y restauración guiada.
- **#97 Protección del historial local** · Pendiente
- **#98 Aislamiento real para ejecutar pruebas** · Pendiente
- **#99 Instalación probada en equipos limpios** · Parcial · Instalación y actualización probadas con perfiles Windows aislados. Faltan pruebas en otros equipos Windows limpios.
- **#100 Asistente de primer arranque** · Parcial · Prepara Ollama automáticamente y reutiliza modelos instalados. Falta un asistente de primer arranque.

