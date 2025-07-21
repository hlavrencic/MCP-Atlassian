#!/bin/bash

# Bootstrap script for dev container - handles line endings and setup
# This script is called by devcontainer.json postCreateCommand

set -e  # Exit on any error

echo "🔧 Iniciando configuración del Dev Container..."

# Install dos2unix if not available
if ! command -v dos2unix &> /dev/null; then
    echo "📦 Instalando dos2unix..."
    apt-get update -qq
    apt-get install -y dos2unix
fi

# Fix line endings for ALL shell scripts
echo "🔄 Corrigiendo terminaciones de línea en todos los scripts..."
find . -name "*.sh" -type f -exec dos2unix {} \; 2>/dev/null || true

# Make all shell scripts executable
echo "🔒 Estableciendo permisos de ejecución..."
find . -name "*.sh" -type f -exec chmod +x {} \;

# Specifically ensure mcp-manager.sh is executable
chmod +x mcp-manager.sh 2>/dev/null || true

echo "✅ Configuración inicial completada."
echo ""

# Now run the actual setup
if [ -f "./setup.sh" ]; then
    echo "🚀 Ejecutando setup del proyecto..."
    ./setup.sh
else
    echo "⚠️  setup.sh no encontrado, saltando configuración específica del proyecto."
fi

echo ""
echo "🎉 Dev Container listo para usar!"
