#!/bin/sh

# MCP Atlassian Container Management Script

# Load environment variables from .env file
if [ -f .env ]; then
    export $(cat .env | grep -v '^#' | grep -v '^$' | xargs)
else
    echo "⚠️  Warning: .env file not found. Please create one based on .env.example"
    echo "   Copy .env.example to .env and fill in your actual values"
    exit 1
fi

case "$1" in
    start)
        echo "🚀 Starting MCP Atlassian server in background..."
        docker run -d --name mcp-atlassian -p 9000:9000 \
            -e CONFLUENCE_URL="$CONFLUENCE_URL" \
            -e CONFLUENCE_USERNAME="$CONFLUENCE_USERNAME" \
            -e CONFLUENCE_API_TOKEN="$CONFLUENCE_API_TOKEN" \
            -e JIRA_URL="$JIRA_URL" \
            -e JIRA_USERNAME="$JIRA_USERNAME" \
            -e JIRA_API_TOKEN="$JIRA_API_TOKEN" \
            ghcr.io/sooperset/mcp-atlassian:latest --transport sse --port 9000 -vv
        echo "✅ MCP Atlassian server started! Access at http://localhost:9000"
        ;;
    
    stop)
        echo "🛑 Stopping MCP Atlassian server..."
        docker stop mcp-atlassian && docker rm mcp-atlassian
        echo "✅ MCP Atlassian server stopped!"
        ;;
    
    logs)
        echo "📋 Showing MCP Atlassian logs (Ctrl+C to exit)..."
        docker logs -f mcp-atlassian
        ;;
    
    status)
        echo "📊 Container status:"
        docker ps -a --filter name=mcp-atlassian
        ;;
    
    interactive)
        echo "🚀 Starting MCP Atlassian server in interactive mode..."
        docker run -i --rm -p 9000:9000 \
            -e CONFLUENCE_URL="$CONFLUENCE_URL" \
            -e CONFLUENCE_USERNAME="$CONFLUENCE_USERNAME" \
            -e CONFLUENCE_API_TOKEN="$CONFLUENCE_API_TOKEN" \
            -e JIRA_URL="$JIRA_URL" \
            -e JIRA_USERNAME="$JIRA_USERNAME" \
            -e JIRA_API_TOKEN="$JIRA_API_TOKEN" \
            ghcr.io/sooperset/mcp-atlassian:latest --transport sse --port 9000 -vv
        ;;
    
    *)
        echo "🐳 MCP Atlassian Container Manager"
        echo ""
        echo "Usage: $0 {start|stop|logs|status|interactive}"
        echo ""
        echo "Commands:"
        echo "  start       - Start MCP server in background"
        echo "  stop        - Stop MCP server"
        echo "  logs        - Show server logs"
        echo "  status      - Show container status"
        echo "  interactive - Start MCP server in interactive mode"
        echo ""
        exit 1
        ;;
esac
