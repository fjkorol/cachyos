#!/bin/bash

# Ruta predeterminada donde buscas los respaldos
DIRECTORIO_DESTINO="/home/fer/workspace/github/cachyos/personal"

echo "Buscando respaldos en: $DIRECTORIO_DESTINO"
read -p "Introduce la ruta completa del archivo .tar.gz (o presiona ENTER para usar el último creado): " RESPALDO

# Si presionas ENTER, busca automáticamente el respaldo más reciente
if [ -z "$RESPALDO" ]; then
    RESPALDO=$(ls -t "$DIRECTORIO_DESTINO"/respaldo_konsole_*.tar.gz 2>/dev/null | head -n 1)
    if [ -z "$RESPALDO" ]; then
        echo "No se encontró ningún respaldo automático en $DIRECTORIO_DESTINO."
        exit 1
    fi
    echo "-> Usando el archivo detectado automáticamente: $RESPALDO"
fi

if [ ! -f "$RESPALDO" ]; then
    echo "El archivo especificado no existe. Verifica la ruta."
    exit 1
fi

echo "📥 Restaurando configuración y perfiles de Konsole..."

# Nos movemos a la raíz del usuario y extraemos directamente para mantener la estructura perfecta
cd "$HOME" || exit 1
tar -xzvf "$RESPALDO"

if [ $? -eq 0 ]; then
    echo "¡Configuración importada con éxito! Cierra todas las ventanas de Konsole y vuelve a abrirla para ver tus perfiles."
else
    echo "Hubo un error al extraer el respaldo."
fi