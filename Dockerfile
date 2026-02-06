FROM nginx:alpine

# Copy nginx configuration template
COPY nginx.conf.template /etc/nginx/templates/default.conf.template

# Set default allowed origin (can be overridden by environment variable)
ENV MCP_BACKEND_URL="https://mcp.mcd.cn"

# Expose port 80
EXPOSE 80

# Use the official nginx image entrypoint, which performs envsubst on files in
# /etc/nginx/templates and then execs nginx (so nginx is PID 1 for proper
# signal handling/graceful shutdown).
