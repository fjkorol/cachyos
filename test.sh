#!/bin/bash

# Nueva ruta predeterminada donde buscar los respaldos
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

echo "📥 Restaurando configuración de Konsole..."

# Extraer el respaldo en la raíz del usuario
tar -xzvf "$RESPALDO" -C "$HOME/"

if [ $? -eq 0 ]; then
    echo "¡Configuración importada con éxito! Cierra y abre Konsole para aplicar los cambios."
else
    echo "Hubo un error al extraer el respaldo."
fi