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

### 4. Conectar con Claude Desktop
Agrega esto a tu configuración de Claude Desktop (`mcp.json`):

```json
{
  "servers": {
    "mcp-atlassian-http": {
      "url": "http://127.0.0.1:9000/sse",
      "type": "http"
    }
  }
}
```

## Comandos Útiles

```bash
./mcp-manager.sh start    # Iniciar servidor
./mcp-manager.sh stop     # Detener servidor  
./mcp-manager.sh status   # Ver estado
./mcp-manager.sh logs     # Ver logs
```

## ¿Qué puedes hacer?

Una vez conectado, puedes pedirle a Claude:
- "Busca mis últimos tickets en Jira"
- "Crea un ticket de bug en el proyecto X"
- "Busca documentación sobre Y en Confluence"
- "Actualiza el estado del ticket Z"

El servidor estará disponible en http://localhost:9000
