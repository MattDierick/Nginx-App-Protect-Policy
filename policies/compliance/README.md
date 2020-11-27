# Compliance settings

## evasions.json

[Documentation](https://docs.nginx.com/nginx-app-protect/configuration/#evasion-techniques)

## http-protocols.json

Some protocol checks are done by NGINX, some by App protect, check documentation.

[Documentation](https://docs.nginx.com/nginx-app-protect/configuration/#http-compliance)

[SubViolations](https://docs.nginx.com/nginx-app-protect/configuration/#http-compliance-sub-violations)

Example

```json
[
    {
        "description": "Header name with no header value",
        "enabled": true
    },
    {
        "description": "Chunked request with Content-Length header",
        "enabled": true
    },
    {
        "description": "Check maximum number of parameters",
        "enabled": true,
        "maxParams": 5
    },
    {
        "description": "Check maximum number of headers",
        "enabled": true,
        "maxHeaders": 20
    },
    {
        "description": "Body in GET or HEAD requests",
        "enabled": true
    },
    {
        "description": "Bad multipart/form-data request parsing",
        "enabled": true
    },
    {
        "description": "Bad multipart parameters parsing",
        "enabled": true
    },
    {
        "description": "Unescaped space in URL",
        "enabled": true
    },
    {
        "description": "Host header contains IP address",
        "enabled": false
    }
]
```

## methods.json

[Documentation](https://docs.nginx.com/nginx-app-protect/configuration/#allowed-methods)