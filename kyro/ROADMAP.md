# Hoja de ruta de Kyro

Estado de las 100 ideas originales en Kyro 0.4.28. **Disponible** indica que el flujo principal ya existe, **parcial** que queda trabajo o validación del criterio, y **pendiente** que todavía no se entrega.

98 disponibles · 2 parciales · 0 pendientes.

## Tareas y trabajo en segundo plano

- **#1 Ficha de tarea** · Disponible · Reúne objetivo, criterios, pasos, propuestas y comprobaciones con sus estados y accesos directos.
- **#2 Criterios de aceptación** · Disponible · Objetivo y criterios editables en Preparar tarea.
- **#3 Plan editable** · Disponible · El plan permite editar y reordenar sus pasos desde el chat.
- **#4 Guardado por paso** · Disponible · Persiste el estado de cada paso del plan, su resultado y el punto de continuación tras cierres forzados.
- **#5 Bandeja de decisiones** · Disponible · Bandeja Decisiones pendientes en Ctrl + K.
- **#6 Cola visible** · Disponible · El panel muestra el orden de espera, permite cancelar y da el siguiente turno al trabajo que priorices.
- **#7 Reintento de un paso** · Disponible · Permite reintentar pasos del agente desde la ficha de tarea conservando intentos anteriores y comprobando dependencias, permisos y cambios en disco.
- **#8 Continuar por otra vía** · Disponible · Retoma un mensaje como borrador, conserva el chat original y elige si quieres revertir los cambios posteriores de Kyro.
- **#9 Dependencias entre tareas** · Disponible · Vincula conversaciones de un proyecto, sigue sus estados y marca su finalización. El envío y la reanudación esperan a que se completen las dependencias directas e indirectas. Los enlaces circulares se bloquean.
- **#10 Avisos que llevan al sitio correcto** · Disponible · La bandeja, los avisos internos y las notificaciones de Windows abren Kyro, seleccionan el chat y muestran la decisión o resultado correspondiente.

## Comprensión del código

- **#11 Índice incremental** · Disponible · Índice incremental con exclusiones por proyecto.
- **#12 Búsqueda por símbolos** · Disponible · Busca declaraciones de funciones, clases y otros símbolos en Ctrl + K.
- **#13 Referencias de funciones** · Disponible · Resolución semántica para JavaScript y TypeScript (importaciones, alias locales y de `tsconfig.json`/`jsconfig.json`, reexportaciones, ámbitos y símbolos homónimos), conservando la búsqueda literal para el resto de lenguajes.
- **#14 Mapa de dependencias** · Disponible · Importaciones directas e indirectas hasta cuatro niveles en JavaScript y TypeScript. Resuelve alias locales declarados en el tsconfig.json o jsconfig.json de la raíz.
- **#15 Proyectos con varias carpetas** · Disponible · Agrupa carpetas desde la configuración del proyecto y alterna entre ellas desde la barra lateral. Cada carpeta conserva sus permisos, sus chats y su contexto de trabajo.
- **#16 Búsqueda por significado opcional** · Disponible · Alterna la búsqueda literal y la clasificación de fragmentos con EmbeddingGemma local. El modelo se descarga a petición y la búsqueda indica el alcance leído.
- **#17 Contexto visible** · Disponible · Cada ejecución muestra los fragmentos de archivo enviados al modelo, con enlace a su primera línea.
- **#18 Resumen de chats largos** · Disponible · Genera un resumen local de objetivos, decisiones y pendientes. Indica cuántos mensajes entraron en el contexto y permite copiar el resultado.
- **#19 Citas desactualizadas** · Disponible · Comprueba los fragmentos leídos que cita el chat. Detecta cambios y sigue coincidencias únicas desplazadas en el mismo archivo.
- **#20 Relación entre código y pruebas** · Disponible · En JavaScript y TypeScript enlaza las pruebas Node que importan el módulo y, desde una prueba, los módulos locales que importa. Distingue importaciones y coincidencias de nombre.

## Edición y revisión

- **#21 Propuestas persistentes** · Disponible · Las propuestas pendientes se recuperan del perfil tras reiniciar.
- **#22 Diff agrupado por función** · Disponible · Agrupa los bloques por declaración de función reconocible en el archivo. Los bloques que abarcan varios ámbitos aparecen aparte.
- **#23 Comentarios sobre líneas** · Disponible · Notas locales de una línea o rango, con búsqueda, estados y cambio de vínculo.
- **#24 Editor lateral ligero** · Disponible · Edita archivos de texto desde el panel, guarda con copia previa y puede revisar el diff antes de escribir.
- **#25 Cambios de nombre y eliminaciones revisables** · Disponible · El visor de texto permite revisar el nombre de destino o retirar un archivo. La recuperación conserva el archivo y evita sobrescribir otro.
- **#26 Comparación a tres bandas** · Disponible · Compara la base de una propuesta, el contenido actual en disco y el resultado propuesto. Resalta los cambios y permite volver a leer el archivo.
- **#27 Agrupar por propósito** · Disponible · Asigna un propósito a cada cambio y revisa la tanda agrupada por ese campo.
- **#28 Versiones de una propuesta** · Disponible · Consulta versiones del mismo archivo y ubicación de proyecto, con su chat de origen y estado.
- **#29 Recuperación de tandas interrumpidas** · Disponible · Guarda el estado de cada operación antes y después de escribir, detecta tandas incompletas al arrancar con vista previa y conserva conflictos externos al recuperar.
- **#30 Exportar un parche** · Disponible · Git permite exportar el diff preparado como parche.

## Git y colaboración

- **#31 Copia Git desde el chat** · Disponible · Al preparar una tarea puedes elegir una copia existente o crear una desde el commit actual. El plan se guarda como borrador en la copia.
- **#32 Preparación de la copia** · Disponible · Detecta dependencias (`package.json`/lockfiles, `Cargo.toml`, `requirements.txt`) y plantillas `.env.example` dentro de la copia Git, permitiendo autorizar, seguir en directo y reintentar cada paso sin tocar el repositorio original.
- **#33 Inventario de copias** · Disponible · El inventario reúne las copias registradas, muestra origen, base, rama y cambios, y permite abrirlas o revisar su ubicación.
- **#34 Historial de un archivo** · Disponible · Historial de un archivo desde su visor.
- **#35 Stage selectivo** · Disponible · Selecciona bloques de texto de un archivo modificado para prepararlos en el índice de Git. Kyro vuelve a comprobar el diff al aplicar.
- **#36 Vista previa de commit** · Disponible · Muestra el diff exacto y sugiere un mensaje editable según los archivos preparados.
- **#37 Traspaso del chat entre copias** · Disponible · Copia los mensajes y el plan a la carpeta original u otra copia Git registrada. El nuevo chat enlaza con su conversación de origen.
- **#38 PR en borrador** · Disponible · Sugiere título y descripción desde los commits y los archivos de la rama comparada. El contenido se edita y confirma antes de publicarlo.
- **#39 Estado de CI** · Disponible · Lista las comprobaciones del PR y abre el resultado en el navegador cuando GitHub proporciona un enlace HTTPS.
- **#40 Revisión de comentarios del PR** · Disponible · Abre el archivo local en su línea y permite vincular una propuesta del mismo archivo a cada comentario.

## Pruebas y pruebas visuales

- **#41 Probar una propuesta en su copia** · Disponible · Aplica propuestas en una copia Git para ejecutar pruebas autorizadas.
- **#42 Comandos de verificación por proyecto** · Disponible · Guarda comprobaciones con programa, argumentos y carpeta.
- **#43 Pruebas dirigidas** · Disponible · Desde el visor, Kyro localiza pruebas Node por archivo y permite ejecutar una sola con autorización.
- **#44 Resultados navegables** · Disponible · Enlaza ubicaciones reconocidas en la salida de pruebas a archivos locales y a su línea.
- **#45 Comparación antes y después** · Disponible · Compara dos ejecuciones de una rutina y vincula cada resultado con su commit, copia Git y cambios sin commit, manteniendo accesibles las ejecuciones antiguas.
- **#46 Errores previos y nuevos** · Disponible · Compara casos individuales en las salidas TAP de Node, unittest y Cargo. Distingue fallos nuevos, persistentes y corregidos.
- **#47 Vista web local** · Disponible · Guarda la dirección por proyecto, comprueba su puerto y abre una vista de Kyro limitada al origen local o el navegador externo.
- **#48 Capturas comparables** · Disponible · Compara dos PNG, JPEG o WebP del proyecto en paralelo o superpuestas con un deslizador. La selección de las imágenes es manual.
- **#49 Consola del navegador** · Disponible · La vista local de Kyro abre las herramientas del navegador para consultar la consola y la red.
- **#50 Informe de entrega** · Disponible · Exporta el plan, cambios y pruebas reales a Markdown.

## Agentes y personalización

- **#51 Reglas del proyecto** · Disponible · Importación de AGENTS.md con revisión previa en los ajustes del proyecto.
- **#52 Reglas por carpeta** · Disponible · Guarda reglas relativas al proyecto y aplica la más específica a las rutas que correspondan.
- **#53 Skills locales** · Disponible · Formato local `SKILL.md` en `.kyro/skills/` o perfil global con nombre, alcance de agentes/rutas e instrucciones revisables, habilitable por proyecto y seleccionable desde el chat bajo los permisos de Kyro.
- **#54 Selector `/`** · Disponible · Abre acciones de proyecto, biblioteca, ajustes y plantillas desde el compositor, con ratón o teclado.
- **#55 Plantillas de tarea** · Disponible · Plantillas iniciales y personales para preparar tareas.
- **#56 Revisor independiente** · Disponible · Revisa el diff desde la tarea original en un contexto separado y de solo lectura sin herramientas de escritura, con modelo configurable y hallazgos vinculados a líneas.
- **#57 Delegación con contexto separado** · Disponible · Prepara un encargo independiente para otro agente y conserva el enlace de vuelta al chat. El usuario revisa y envía el nuevo encargo.
- **#58 Permisos por perfil** · Disponible · Matriz editable por agente y proyecto con visualización del permiso efectivo, aplicación coherente en chat, tareas en curso, reintentos y delegación, y migración de perfiles previos.
- **#59 Hooks locales declarativos** · Disponible · Los modos Programar, Revisar y Planificar pueden preparar una comprobación guardada al completar una tarea. Cada ejecución requiere autorización.
- **#60 Memoria con fuentes** · Disponible · Conserva notas generales y notas individuales. Una nota puede llevar de vuelta a su respuesta o a la línea del código que la originó.

## Modelos locales y rendimiento

- **#61 Pruebas de capacidad por modelo** · Disponible · Batería reproducible de 3 proyectos con lectura de contexto, edición exacta y ejecución real de `node --test`, guardando modelo, cuantización, contexto, tiempo y puntuación para comparar.
- **#62 Ficha de compatibilidad** · Disponible · Los modelos instalados muestran capacidades, familia, parámetros, cuantización y contexto declarado por Ollama, junto a las pruebas locales de Kyro.
- **#63 Comparación en la misma tarea** · Disponible · Dos modelos instalados reciben la misma pregunta y el mismo contexto de conversación. Muestra las respuestas y el tiempo, con alcance de texto.
- **#64 Diagnóstico de lentitud** · Disponible · Cada ejecución distingue carga, procesamiento del contexto y generación según las métricas del motor.
- **#65 Ajuste por batería y memoria** · Disponible · El ajuste opcional reduce el contexto y libera al terminar según batería y RAM libre.
- **#66 Estimación antes de enviar** · Disponible · El compositor permite consultar antes de enviar el modelo elegido, su contexto y el reparto orientativo de memoria entre CPU y GPU.
- **#67 Recuperación tras falta de memoria** · Disponible · Prepara un reintento de chat con contexto reducido. Qwen Imágenes permite reducir la resolución, leer pesos desde disco o ejecutar en CPU.
- **#68 Asignación por fase** · Disponible · Puede usarse un modelo diferente para contrastar el informe final con los archivos, y se identifica en la respuesta.
- **#69 Historial de mediciones** · Disponible · Guarda pruebas por modelo y permite comparar contexto, estado de carga, velocidad, primer token y memoria.
- **#70 Gestión del almacenamiento** · Disponible · Permite cambiar la carpeta, consultar espacio libre y trasladar modelos descargados entre carpetas o unidades con verificación SHA-256, progreso, cancelación segura y comprobación posterior en Ollama.

## Interfaz y uso diario

- **#71 Pestañas laterales persistentes** · Disponible · Fija archivos, propuestas y pruebas vinculadas a un chat. El panel guarda el orden por proyecto y vuelve al chat de origen cuando hace falta.
- **#72 Panel redimensionable** · Disponible · Panel ajustable por arrastre y teclado.
- **#73 Barra de resultados del chat** · Disponible · El chat muestra accesos directos a archivos leídos, propuestas y comprobaciones cuando hay resultados.
- **#74 Búsqueda dentro del historial** · Disponible · Búsqueda de palabras y frases en los mensajes guardados.
- **#75 Menú al seleccionar código** · Disponible · Permite editar exactamente las líneas seleccionadas, citar, pedir una explicación, añadir notas y buscar referencias.
- **#76 Contexto visible en el editor** · Disponible · Cada mención de archivo o carpeta aparece como una ficha que se puede retirar antes de enviar.
- **#77 Explorador de archivos por árbol** · Disponible · Carpetas desplegables que se recuerdan por proyecto, filtro por ruta y paginación.
- **#78 Dos chats lado a lado** · Disponible · Abre una segunda conversación con su actividad en directo, filtra por chat o proyecto e intercambia ambas conservando los borradores.
- **#79 Atajos configurables y navegación con teclado** · Disponible · Personaliza o desactiva los atajos de acciones principales, restaura los valores iniciales y configura la tecla de envío. Los selectores y diálogos admiten teclado.
- **#80 Vistas Inicio y Desarrollo** · Disponible · Inicio abre el chat personal. Desarrollo recupera el proyecto y la conversación al cambiar de vista, manteniendo los borradores. Imágenes tiene su propio espacio.

## Integraciones y automatizaciones

- **#81 Abrir en tu editor** · Disponible · Salto a línea en VS Code, VSCodium o Cursor si se detectan.
- **#82 Enviar una selección desde el editor** · Disponible · La extensión para VS Code envía las líneas guardadas para revisarlas y añadirlas al borrador del proyecto.
- **#83 CLI local** · Disponible · `kyro-cli.exe` enumera proyectos vinculados, lista y lee sus archivos visibles y puede enviar una selección a Kyro.
- **#84 MCP de lectura** · Disponible · `kyro-cli.exe mcp <id>` expone dos herramientas de lectura por stdio, limitadas a un único proyecto vinculado.
- **#85 Permisos por integración** · Disponible · Ajustes reúne las autorizaciones revocables de GitHub por proyecto y los accesos a la configuración de los motores locales.
- **#86 Importar una incidencia** · Disponible · Importa una incidencia de GitHub como borrador de tarea editable.
- **#87 Automatizaciones locales optativas** · Disponible · Activa, edita, pausa y desactiva horarios por rutina y proyecto con políticas para equipo cerrado/suspendido y solapamientos, manteniendo la autorización de comprobaciones.
- **#88 Historial de ejecuciones programadas** · Disponible · Muestra la próxima fecha con zona horaria y guarda programación, estado ejecutado/omitido, duración, resultado y chat generado.
- **#89 Paquetes de configuración** · Disponible · Guarda e importa un paquete JSON con apariencia, atajos, modelos por agente y plantillas personales.
- **#90 Visores para salidas habituales** · Disponible · Vista previa de PNG, JPEG y WebP con dimensiones. Markdown y JSON alternan entre vista previa y código numerado. El panel de pruebas mantiene sus resultados navegables.

## Instalación, privacidad y fiabilidad

- **#91 Base de datos local con migración** · Disponible · Migración de JSON a SQLite y búsqueda en el historial.
- **#92 Actualizaciones firmadas** · Parcial · El empaquetado puede firmar con Authenticode. El actualizador verifica la firma con Windows y contrasta el certificado con una huella configurada al compilar. Falta el certificado del proyecto y una publicación firmada de principio a fin.
- **#93 Volver a la versión anterior** · Disponible · El instalador guarda la versión reemplazada compatible. Ajustes permite restaurar la aplicación y conservar el perfil. Las versiones previas al cifrado requieren un historial sin protección.
- **#94 Canal estable y beta** · Disponible · Ajustes permite elegir el canal. Beta incluye la versión estable si no se ha publicado una beta más reciente.
- **#95 Diagnóstico exportable** · Disponible · Exporta versión, hardware y estado de Ollama a JSON desde Datos y privacidad. El informe omite chats, ubicaciones y nombres de proyectos o modelos.
- **#96 Copias de seguridad configurables** · Disponible · Selección de contenido y vista previa para restaurar perfiles portátiles. Los proyectos se vinculan a sus carpetas desde Ajustes. También se puede guardar una copia SQLite del perfil.
- **#97 Protección del historial local** · Disponible · Cifrado opcional de chats guardados y puntos de control con la cuenta de Windows. La búsqueda del historial protegido se hace en memoria.
- **#98 Aislamiento real para ejecutar pruebas** · Disponible · En equipos con Windows Sandbox, las pruebas integradas de Node se ejecutan con una copia del proyecto y sin red. La salida aparece en la ventana aislada.
- **#99 Instalación probada en equipos limpios** · Parcial · Probada con perfiles aislados limpios y migración Gema/Kyro → SQLite en el Windows x64 de pruebas. Queda pendiente probar en otro Windows limpio, incluida una instalación sin WebView2.
- **#100 Asistente de primer arranque** · Disponible · Comprueba equipo y motor, permite descargar o reutilizar modelos, ajusta tema y movimiento y abre chat, proyectos o imágenes. Se puede recuperar desde Ajustes.

## Mejoras del historial en 0.4.20

Además de los puntos #18 y #63, Kyro incorpora ocho mejoras de uso diario.

- Archivar y restaurar conversaciones.
- Fijar conversaciones en la barra lateral.
- Añadir, quitar y filtrar etiquetas.
- Guardar mensajes y volver a su posición en el chat.
- Buscar dentro de un chat y pasar entre coincidencias con Ctrl + F.
- Exportar el texto de una conversación a Markdown con el modelo registrado.
- Recuperar los borradores de chats y proyectos tras reiniciar.
- Consultar un historial con filtros combinables de proyecto y modo y ordenar por nombre o actividad.

## Herramientas de proyectos en 0.4.20

- Buscar texto en archivos con resultados que abren la línea exacta.
- Navegar por las declaraciones de un archivo desde Símbolos.
- Saltar a un número de línea en el visor.
- Reabrir archivos recientes por proyecto, en la última línea que se abrió.
- Fijar proyectos favoritos arriba en la barra lateral.
- Exportar a Markdown el inventario de archivos visibles.
- Comparar capturas en paralelo o con un deslizador.
- Comprobar y abrir la web local desde el proyecto.
- Explorar cadenas de importaciones indirectas.
- Resolver alias JavaScript y TypeScript declarados en la configuración de la raíz.

