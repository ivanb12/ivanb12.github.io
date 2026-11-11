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

La versión pública es v1.0.0 y la revisión interna es 1.0.6. Las preferencias de voz se organizan en Activación, Voz, Conversación y Memoria. La llamada «Ey» más el nombre del asistente se genera automáticamente; basta con activarla o desactivarla con el interruptor. El inicio de la escucha tiene estados claros, límite de espera y reintento. Al abrir una aplicación se cierra el asistente; el cierre de aplicaciones solicita cerrar sus ventanas sin forzar procesos. Las acciones de energía requieren confirmación y después una cuenta atrás cancelable de veinte segundos. Se conserva el panel de mensajes de alto contraste y el reconocimiento Whisper local. La ampliación respecto al reconocedor anterior a 1.0.5 descarga unos 189 MiB; desde 1.0.5 no se necesita otro modelo. El audio y los recuerdos guardados permanecen en el PC. El AEC de Windows sigue dependiendo del dispositivo; las pruebas de reconocimiento usan audio sintético. La IA por Internet mantiene una cuota gratuita compartida. La actualización conserva los datos anteriores.

La primera instalación de esta revisión se hace con el setup. Después puedes buscar actualizaciones en Preferencias → Acerca de, descargarlas y confirmar su instalación. La edición portable se actualiza manualmente. También puedes cerrar QuickDeck desde la bandeja y ejecutar el nuevo setup, sin desinstalar antes.

Sube también `latest.json` y `downloads/updates/`, incluidos en esta carpeta. No borres las rutas de revisiones anteriores mientras existan clientes que puedan estar descargándolas. Publica primero el instalador y su `.sig`, y el manifiesto `latest.json` al final. El manifiesto usa la revisión interna para comparar versiones y contiene la firma del instalador.

Los paquetes del actualizador llevan una firma criptográfica de QuickDeck. Esto es independiente de la firma Authenticode de Windows: el instalador todavía no tiene certificado Authenticode. Lee `legal/licencia.txt`.
