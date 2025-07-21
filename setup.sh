#!/bin/bash

# Setup script for MCP Atlassian dev container

echo "🔧 Configurando MCP Atlassian..."

# Check if .env exists
if [ ! -f ".env" ]; then
    echo "📋 Creando archivo .env desde .env.example..."
    cp .env.example .env
    echo "✅ Archivo .env creado. Por favor, edítalo con tus credenciales de Atlassian."
    echo ""
    echo "Para obtener tu API token, visita:"
    echo "https://id.atlassian.com/manage-profile/security/api-tokens"
    echo ""
else
    echo "✅ El archivo .env ya existe."
fi

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo "⚠️  Docker no está ejecutándose. Iniciando Docker..."
    sudo service docker start
fi

echo ""
echo "🚀 Para iniciar el servidor MCP, ejecuta:"
echo "   ./mcp-manager.sh start"
echo ""
echo "📋 O usa las tareas de VS Code:"
echo "   Ctrl+Shift+P → 'Tasks: Run Task' → 'Start MCP Atlassian (Background)'"
echo ""
echo "🤖 Una vez iniciado, podrás usar GitHub Copilot Chat con funciones de Jira y Confluence."
