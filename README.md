# Simple MCP CORS Proxy

Some MCP endpoints do not have CORS headers, which causes issues when calling them from a web browser. This is a simple nginx-based proxy that adds CORS headers to the responses. It can be easily deployed using Docker.

Override the `MCP_BACKEND_URL` environment variable to point to the desired MCP backend (default is <https://mcp.mcd.cn>). Optionally set `UPSTREAM_AUTHORIZATION` if you want to inject a specific Authorization header to the upstream (otherwise it will forward the client's Authorization header).
