# MCP Atlassian Server

Servidor MCP para integrar Jira y Confluence con herramientas de IA como GitHub Copilot.

## ⚡ Inicio Rápido

### 1. Abrir en Dev Container
En VS Code: `Ctrl+Shift+P` → "Dev Containers: Reopen in Container"
*(La configuración se ejecuta automáticamente)*

### 2. Configurar Credenciales
Edita el archivo `.env` con tus credenciales de Atlassian:

```bash
# Obtén tu API token en: https://id.atlassian.com/manage-profile/security/api-tokens

JIRA_URL=https://tu-dominio.atlassian.net
JIRA_USERNAME=tu-email@ejemplo.com
JIRA_API_TOKEN=tu-api-token

CONFLUENCE_URL=https://tu-dominio.atlassian.net/wiki
CONFLUENCE_USERNAME=tu-email@ejemplo.com  
CONFLUENCE_API_TOKEN=tu-api-token
```

### 3. Iniciar Servidor
```bash
./mcp-manager.sh start
```

### 4. Usar con GitHub Copilot
El servidor MCP está preconfigurado automáticamente. Una vez iniciado, usa **GitHub Copilot Chat** en modo Agent.

## Uso con VS Code

### Tareas Disponibles
Usa `Ctrl+Shift+P` → "Tasks: Run Task" para ejecutar:
- **Start MCP Atlassian (Background)** - Iniciar servidor en segundo plano
- **Start MCP Atlassian (Interactive)** - Iniciar servidor en modo interactivo
- **Stop MCP Atlassian** - Detener servidor
- **Show MCP Atlassian Logs** - Mostrar logs del servidor
- **MCP Atlassian Status** - Ver estado del contenedor

### Comandos Manuales

```bash
./mcp-manager.sh start    # Iniciar servidor
./mcp-manager.sh stop     # Detener servidor  
./mcp-manager.sh status   # Ver estado
./mcp-manager.sh logs     # Ver logs
```

## 🔧 Solución de Problemas

### Configuración Automática
El Dev Container incluye un sistema de configuración automática que:

1. **Instala dos2unix** automáticamente
2. **Corrige terminaciones de línea** en todos los scripts (`.sh`)
3. **Establece permisos** de ejecución correctos
4. **Ejecuta setup** del proyecto

### Error "bad interpreter" o scripts no ejecutables
Si aún encuentras errores, puedes ejecutar manualmente:

```bash
./bootstrap.sh       # Configuración completa automática
```

## ¿Qué puedes hacer?

Una vez que el servidor esté ejecutándose, puedes usar **GitHub Copilot Chat** con comandos como:
- "Busca mis últimos tickets en Jira"
- "Crea un ticket de bug en el proyecto X"  
- "Busca documentación sobre Y en Confluence"
- "Actualiza el estado del ticket Z"
- "Muestra los issues asignados a mí"
- "Crea una página en Confluence con la documentación del proyecto"

El servidor estará disponible en http://localhost:9000

## 📋 Archivos de Configuración

- `.devcontainer/devcontainer.json` - Configuración automática MCP para Dev Container
- `.vscode/mcp.json` - Configuración estándar del workspace MCP
- `.vscode/tasks.json` - Tareas de VS Code para gestionar el servidor
- `bootstrap.sh` - Script de configuración inicial automática
- `setup.sh` - Configuración específica del proyecto

## 📚 Referencias

- [VS Code MCP Documentation](https://code.visualstudio.com/docs/copilot/chat/mcp-servers)
- [Model Context Protocol](https://modelcontextprotocol.io/)
