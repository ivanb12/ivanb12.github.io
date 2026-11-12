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

La versión pública es v1.0.0 y la revisión interna es 1.0.9. Los botones de minimizar, maximizar y cerrar se integran en la barra superior sin la cápsula de fondo. Toda la aplicación comparte una nueva estética de carbón, gris, blanco y azul: lanzador, preferencias, editores, actualizador, voces y chat. Se mantienen el modo claro y el acento personalizado. QuickDeck comprueba automáticamente las actualizaciones una vez al iniciarse y muestra Actualizar junto a Acerca de cuando hay una revisión nueva. No descarga ni instala automáticamente. Si no hay conexión, permite reintentar y el buscador sigue disponible. Los datos y modelos de voz se conservan; la voz seleccionada se aplica con Guardar cambios. Las limitaciones de reconocimiento acústico, cancelación de eco y cuota gratuita de IA se mantienen.

La primera instalación de esta revisión se hace con el setup. Después puedes buscar actualizaciones en Preferencias → Acerca de, descargarlas y confirmar su instalación. La edición portable se actualiza manualmente. También puedes cerrar QuickDeck desde la bandeja y ejecutar el nuevo setup, sin desinstalar antes.

Sube también `latest.json` y `downloads/updates/`, incluidos en esta carpeta. No borres las rutas de revisiones anteriores mientras existan clientes que puedan estar descargándolas. Publica primero el instalador y su `.sig`, y el manifiesto `latest.json` al final. El manifiesto usa la revisión interna para comparar versiones y contiene la firma del instalador.

Los paquetes del actualizador llevan una firma criptográfica de QuickDeck. Esto es independiente de la firma Authenticode de Windows: el instalador todavía no tiene certificado Authenticode. Lee `legal/licencia.txt`.
