# QuickDeck Pro — web HTML

Destino: https://ivanb12.github.io/quickdeckpro/

## Subir a GitHub Pages

1. Usa el repositorio público `ivanb12/ivanb12.github.io`, rama `main`.
2. Sube **el contenido de esta carpeta dentro de `quickdeckpro/`**, de modo que quede `quickdeckpro/index.html`, junto a `brand/`, `images/`, `downloads/` y `legal/`. Conserva el resto del repositorio y las descargas anteriores.
3. Mantén GitHub Pages sirviendo la rama `main` desde `/ (root)`; la web de QuickDeck ocupa su subcarpeta.
4. Espera a que GitHub publique la página en la URL indicada. No necesitas npm, React ni un paso de compilación.

El archivo `index.html` incluye todos los estilos y el código JavaScript del contador, menú y copia del hash. Los archivos gráficos y las descargas son recursos locales con rutas relativas, compatibles con `/quickdeckpro/`. No subas las fuentes privadas de la aplicación ni la carpeta padre de este proyecto.

## Contador

Cuenta clics en los enlaces al instalador y al portable. Los saltos a la sección Descargar, las visitas, los hashes y la licencia no incrementan el contador. No cuenta usuarios únicos ni confirma que se termine de descargar el archivo.

El código está dentro del propio HTML, bajo el comentario `Contador global de CLICS`. El total compartido se guarda en una base de datos del servicio de Sites en `https://quickdeck-pro.pithymandrill1.chatgpt.site/api/download-clicks`. Este servicio debe seguir publicado para que todos los visitantes vean el mismo número. El HTML y las descargas siguen funcionando si el contador no está disponible; no se inventa una cifra.

No requiere GitHub Releases, un token de GitHub ni claves en el navegador. No usa localStorage. El contador empieza con los clics recibidos por este servicio; no estima los clics anteriores a su puesta en marcha. Cada clic válido puede incrementar el total, también los repetidos por una misma persona. Es una estadística simple, no una medición antifraude.

## Versión

La versión pública es v1.0.0 y la revisión interna es 1.0.17. Añade tareas nativas de carpetas y documentos .txt, corrige el cierre del halo y permite mantener Qwen preparado tres minutos con activación opcional. Corregida la esfera durante los errores y reforzada la apertura del panel, con sus controles de voz. Corregida la carga del reconocimiento cuando la carpeta de usuario de Windows contiene tildes, ñ u otros caracteres Unicode. Si siguen faltando archivos, usa Reparar reconocimiento en Preferencias → Voz. El modelo de conversación local y los datos se conservan. Gema recupera apodos y varios gustos, también entre conversaciones; el modelo local utiliza los recuerdos permitidos sin enviarlos a Groq. Incorpora detección local de voz, corrección de nombres de aplicaciones, rutinas de energía, aperturas y recordatorios, y controles nativos de sonido, reproducción, ventanas, carpetas y dictado con confirmación. Se activan y gestionan en Voz → Conversación. QuickDeck debe permanecer abierto para ejecutar las rutinas; no hay control universal de cualquier aplicación. Se añade un modo local de conversación en prueba: Voz → Conversación → En este PC · prueba → Preparar (2,52 GB) → Guardar cambios. Qwen3-4B funciona sin cuentas ni cuota de Groq; se recomiendan 16 GB de RAM. Las muestras de este equipo tardaron 11–13 segundos y alcanzaron unos 5 GB de RAM del proceso. De inicio se libera después de cada respuesta; la opción Mantener el modelo preparado lo conserva hasta tres minutos sin actividad. El tiempo y las noticias necesitan permiso para consultar sus fuentes en Internet. Se optimizan las transcripciones cortas y la comprobación de llamadas. Los fallos del servicio se muestran como avisos y se excluyen del contexto. Acerca de muestra el tamaño del instalador de las nuevas actualizaciones antes de descargarlo. La esfera de Gema tiene ojos que siguen el ratón por el escritorio y color configurable en Voz → Activación. Usa la paleta o un color personalizado y Guarda los cambios. El seguimiento se detiene al cerrar el asistente. Gema incorpora un panel a la izquierda con una esfera renovada, activación local más cuidada y órdenes tras «Ey Gema» en la misma frase. Las respuestas son más breves y el tiempo se resume en lo esencial. Clara (opción A) y DaveFX (opción C) son las nuevas voces de español de España: se preparan desde el selector de Voz, comparten una descarga opcional de unos 171 MB y funcionan localmente, sin cuentas ni servicios de voz de pago. Pulsa Usar y Guardar cambios para aplicar la elección. Las voces anteriores y la configuración existente se conservan. Los botones de minimizar, maximizar y cerrar se integran en la barra superior sin la cápsula de fondo. Toda la aplicación comparte una nueva estética de carbón, gris, blanco y azul: lanzador, preferencias, editores, actualizador, voces y chat. Se mantienen el modo claro y el acento personalizado. QuickDeck comprueba automáticamente las actualizaciones una vez al iniciarse y muestra Actualizar junto a Acerca de cuando hay una revisión nueva. No descarga ni instala automáticamente. Si no hay conexión, permite reintentar y el buscador sigue disponible. Los datos y modelos de voz se conservan; la voz seleccionada se aplica con Guardar cambios. Las limitaciones de reconocimiento acústico, cancelación de eco y cuota gratuita de IA se mantienen.

La primera instalación de esta revisión se hace con el setup. Después puedes buscar actualizaciones en Preferencias → Acerca de, ver el tamaño del instalador, descargarlas y confirmar su instalación. La edición portable se actualiza manualmente. También puedes cerrar QuickDeck desde la bandeja y ejecutar el nuevo setup, sin desinstalar antes.

Sube también `latest.json` y `downloads/updates/`, incluidos en esta carpeta. No borres las rutas de revisiones anteriores mientras existan clientes que puedan estar descargándolas. Publica primero el instalador y su `.sig`, y el manifiesto `latest.json` al final. El manifiesto usa la revisión interna para comparar versiones y contiene la firma del instalador.

Los paquetes del actualizador llevan una firma criptográfica de QuickDeck. Esto es independiente de la firma Authenticode de Windows: el instalador todavía no tiene certificado Authenticode. Lee `legal/licencia.txt`.


También puedes activar «Aceptar también el nombre solo» en Voz → Activación y Guardar cambios: di «Gema» a solas y espera a la esfera. Esta opción queda desactivada de inicio para evitar llamadas accidentales al hablar con otras personas.
