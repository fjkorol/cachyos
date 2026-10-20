#!/bin/bash

# Ruta de destino fija
DIRECTORIO_DESTINO="/home/fer/workspace/github/cachyos/personal"
DESTINO="$DIRECTORIO_DESTINO/respaldo_konsole_$(date +%Y%m%d_%H%M%S).tar.gz"

# Asegurar que la carpeta de destino exista
mkdir -p "$DIRECTORIO_DESTINO"

echo "📦 Generando respaldo de Konsole..."

# Nos movemos a la raíz del usuario para comprimir rutas relativas limpias
cd "$HOME" || exit 1

# Comprimimos la carpeta de perfiles y el archivo de configuración general
tar -czvf "$DESTINO" .local/share/konsole .config/konsolerc 2>/dev/null

if [ $? -eq 0 ]; then
    echo "¡Respaldo creado con éxito en: $DESTINO"
else
    echo "Hubo un error al crear el respaldo. Revisa si tienes perfiles personalizados."
fi