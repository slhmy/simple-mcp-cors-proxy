# mcd-mcp-proxy

A simple nginx docker image with CORS settings to avoid encountering CORS issues when using https://mcp.mcd.cn's APIs.

## Features

- 🚀 Nginx-based reverse proxy for https://mcp.mcd.cn
- 🔒 CORS headers configured to allow cross-origin requests
- ⚙️ Configurable allowed origin via environment variable
- 🐳 Lightweight Alpine-based Docker image

## Quick Start

### Using Docker Compose (Recommended)

The easiest way to run the proxy is using Docker Compose:

```bash
docker compose up -d
```

To set a custom allowed origin, edit the `docker-compose.yml` file or override with:

```bash
ALLOWED_ORIGIN=https://yourdomain.com docker compose up -d
```

### Using Docker

#### Build the Docker Image

```bash
docker build -t mcd-mcp-proxy .
```

#### Run with Default Settings

By default, the proxy allows requests from all origins (`*`):

```bash
docker run -p 8080:80 mcd-mcp-proxy
```

#### Run with Custom Allowed Origin

To restrict CORS to a specific origin, set the `ALLOWED_ORIGIN` environment variable:

```bash
docker run -p 8080:80 -e ALLOWED_ORIGIN="https://yourdomain.com" mcd-mcp-proxy
```

### Access the Proxy

Once running, the proxy will be available at `http://localhost:8080` and will forward requests to `https://mcp.mcd.cn`.

## Configuration

### Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `ALLOWED_ORIGIN` | The origin(s) allowed to make cross-origin requests | `*` |

### Examples

**Allow multiple origins (comma-separated won't work with this approach):**

For multiple origins, you'll need to use `*` or implement more complex nginx logic. For now, this supports a single origin or `*` for all origins.

**Allow a specific domain:**
```bash
docker run -p 8080:80 -e ALLOWED_ORIGIN="https://example.com" mcd-mcp-proxy
```

**Allow all origins (default):**
```bash
docker run -p 8080:80 mcd-mcp-proxy
```

## CORS Headers

The proxy automatically adds the following CORS headers:

- `Access-Control-Allow-Origin`: Configurable via `ALLOWED_ORIGIN`
- `Access-Control-Allow-Methods`: GET, POST, PUT, DELETE, OPTIONS, PATCH
- `Access-Control-Allow-Headers`: DNT, User-Agent, X-Requested-With, If-Modified-Since, Cache-Control, Content-Type, Range, Authorization
- `Access-Control-Expose-Headers`: Content-Length, Content-Range

**Note**: Credentials (`Access-Control-Allow-Credentials`) are not enabled to maintain compatibility with wildcard origins. If you need to send credentials (cookies, authorization headers), set `ALLOWED_ORIGIN` to a specific domain.

## License

MIT