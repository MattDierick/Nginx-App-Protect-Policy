# IP based exceptions

[Documentation](https://docs.nginx.com/nginx-app-protect/configuration/#deny-and-allow-lists)

Example

```json
[
    {
        "blockRequests": "never",
        "neverLogRequests": false,
        "ipAddress": "1.1.1.1",
        "ipMask": "255.255.255.255"
    },
    {
        "blockRequests": "always",
        "ipAddress": "2.2.2.2",
        "ipMask": "255.255.255.255"
    },
    {
        "blockRequests": "never",
        "neverLogRequests": false,
        "ipAddress": "3.3.3.0",
        "ipMask": "255.255.255.0"
    }
]
```