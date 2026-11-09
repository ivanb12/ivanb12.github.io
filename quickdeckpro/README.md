# QuickDeck Pro — web HTML

Destino: https://ivanb12.github.io/quickdeckpro/

## Subir a GitHub Pages

1. Crea el repositorio público `ivanb12/quickdeckpro` si aún no existe.
2. Sube **el contenido de esta carpeta**, de modo que `index.html` quede en la raíz del repositorio, junto a `brand/`, `images/`, `downloads/` y `legal/`.
3. En Settings → Pages elige Deploy from a branch, rama `main`, carpeta `/ (root)`.
4. Espera a que GitHub publique la página en la URL indicada. No necesitas npm, React ni un paso de compilación.

El archivo `index.html` incluye todos los estilos y el código JavaScript del contador, menú y copia del hash. Los archivos gráficos y las descargas son recursos locales con rutas relativas, compatibles con `/quickdeckpro/`. No subas las fuentes privadas de la aplicación ni la carpeta padre de este proyecto.

## Contador

Cuenta clics en los enlaces al instalador y al portable. Los saltos a la sección Descargar, las visitas, los hashes y la licencia no incrementan el contador. No cuenta usuarios únicos ni confirma que se termine de descargar el archivo.

El código está dentro del propio HTML, bajo el comentario `Contador global de CLICS`. El total compartido se guarda en una base de datos del servicio de Sites en `https://quickdeck-pro.pithymandrill1.chatgpt.site/api/download-clicks`. Este servicio debe seguir publicado para que todos los visitantes vean el mismo número. El HTML y las descargas siguen funcionando si el contador no está disponible; no se inventa una cifra.

No requiere GitHub Releases, un token de GitHub ni claves en el navegador. No usa localStorage. El contador empieza con los clics recibidos por este servicio; no estima los clics anteriores a su puesta en marcha. Cada clic válido puede incrementar el total, también los repetidos por una misma persona. Es una estadística simple, no una medición antifraude.

## Versión

La edición pública se llama v0.1.1. Sus binarios tienen compilación interna 0.1.6 para mantener el orden de actualización de las versiones de prueba 0.1.0–0.1.5. El nombre público y la ventana de la aplicación muestran v0.1.1. No se ha inventado un historial de instalaciones o de descargas previas.

Para instalar una actualización, cierra QuickDeck desde la bandeja y ejecuta el nuevo instalador. No necesitas desinstalar una versión anterior. Lee `legal/licencia.txt`; el instalador aún no está firmado digitalmente.
