# Configuración MCP - Documentación Técnica

## ✅ Configuración Corregida

La configuración MCP ha sido actualizada para cumplir con las especificaciones oficiales de VS Code según la documentación en: https://code.visualstudio.com/docs/copilot/chat/mcp-servers#_dev-container-support

### Cambios Realizados:

#### 1. Dev Container (`.devcontainer/devcontainer.json`)
```json
{
  "customizations": {
    "vscode": {
      "mcp": {
        "servers": {
          "mcp-atlassian-http": {
            "url": "http://127.0.0.1:9000/sse",
            "type": "http"
          }
        }
      }
    }
  }
}
```

#### 2. Workspace Configuration (`.vscode/mcp.json`)
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

## ❌ Configuración Anterior (Incorrecta)

La configuración anterior usaba:
```json
"settings": {
  "github.copilot.chat.mcpServers": {
    // ...
  }
}
```

**Problema**: Esta configuración no está documentada en las especificaciones oficiales de VS Code para Dev Containers.

## 🔍 Verificación

Para verificar que la configuración funciona:

1. **Abrir Dev Container**: `Ctrl+Shift+P` → "Dev Containers: Reopen in Container"
   - El sistema ejecutará automáticamente: `bootstrap.sh` → `setup.sh`
   - Corregirá terminaciones de línea antes de ejecutar scripts
2. **Verificar logs**: Si hay errores, revisar la salida del postCreateCommand
3. **Iniciar servidor MCP**: `./mcp-manager.sh start`
4. **Verificar conexión**: `Ctrl+Shift+P` → "MCP: List Servers"
5. **Usar en Chat**: Abrir Copilot Chat en modo Agent y verificar que las herramientas MCP estén disponibles

## 🔧 Flujo de Configuración Automática

### Dev Container postCreateCommand:
1. **Instala dos2unix**: `apt-get install -y dos2unix`
2. **Corrige bootstrap.sh**: `dos2unix bootstrap.sh && chmod +x bootstrap.sh`
3. **Ejecuta bootstrap**: `./bootstrap.sh`

### bootstrap.sh:
1. **Corrige todos los scripts**: `find . -name "*.sh" -exec dos2unix {} \;`
2. **Establece permisos**: `find . -name "*.sh" -exec chmod +x {} \;`
3. **Ejecuta setup**: `./setup.sh`

### setup.sh:
1. **Configura .env**: Copia desde `.env.example` si no existe
2. **Inicia Docker**: Verifica que Docker esté ejecutándose
3. **Muestra instrucciones**: Cómo usar el servidor MCP

## 🔧 Solución de Problemas Comunes

### Error "bad interpreter: No such file or directory"
Este error ocurre cuando los archivos tienen terminaciones de línea CRLF (Windows) en lugar de LF (Linux).

**Solución:**
```bash
./bootstrap.sh  # Configuración completa automática
```

### Scripts no ejecutables
El sistema automático maneja los permisos, pero si es necesario:
```bash
chmod +x *.sh mcp-manager.sh
```

### Docker no iniciado
Si Docker no está ejecutándose:
```bash
sudo service docker start
```

## 📚 Referencias

- [VS Code MCP Documentation](https://code.visualstudio.com/docs/copilot/chat/mcp-servers)
- [Dev Container MCP Support](https://code.visualstudio.com/docs/copilot/chat/mcp-servers#_dev-container-support)
- [Model Context Protocol](https://modelcontextprotocol.io/)
