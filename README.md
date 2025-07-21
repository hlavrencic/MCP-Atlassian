# MCP Atlassian Server

Servidor MCP para integrar Jira y Confluence con herramientas de IA como Claude Desktop.

## Inicio Rápido

### 1. Abrir en Dev Container
En VS Code: `Ctrl+Shift+P` → "Dev Containers: Reopen in Container"

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

### 4. Configuración MCP Automática
El dev container ya está configurado automáticamente para conectar GitHub Copilot al servidor MCP según las especificaciones oficiales de VS Code. La configuración se encuentra en:
- `/.devcontainer/devcontainer.json` - Configuración automática para Dev Container
- `/.vscode/mcp.json` - Configuración estándar del workspace

Una vez que inicies el servidor, podrás usar las funciones de Jira y Confluence directamente en Copilot Chat.

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

## ¿Qué puedes hacer?

Una vez que el servidor esté ejecutándose, puedes usar **GitHub Copilot Chat** con comandos como:
- "Busca mis últimos tickets en Jira"
- "Crea un ticket de bug en el proyecto X"
- "Busca documentación sobre Y en Confluence"
- "Actualiza el estado del ticket Z"
- "Muestra los issues asignados a mí"
- "Crea una página en Confluence con la documentación del proyecto"

El servidor estará disponible en http://localhost:9000
