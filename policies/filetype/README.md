# Filetype

List of allowed and disallowed filetypes based in extension (not mime type)

+ [App protect documentation](https://docs.nginx.com/nginx-app-protect/configuration/#file-types)

## filetypes.json

List of files allowed e.g., 

```json
    [
        {
            "name": "*",
            "type": "wildcard",
            "allowed": true,
            "checkPostDataLength": false,
            "postDataLength": 4096,
            "checkRequestLength": false,
            "requestLength": 8192,
            "checkUrlLength": true,
            "urlLength": 2048,
            "checkQueryStringLength": true,
            "queryStringLength": 2048,
            "responseCheck": false
        },
        {
            "name": "txt",
            "allowed": false
        },
        {
            "name": "log",
            "allowed": true
        }
    ]
```

## Disallowed File Types

The following file types are disallowed by default but can be enabled by changing to ["allowed": true]

    bak, bat, bck, bkp, cfg, conf, config, ini, log, old, sav, save, temp, tmp
    bin, cgi, cmd, com, dll, exe, msi, sys, shtm, shtml, stm
    cer, crt, der, key, p12, p7b, p7c, pem, pfx
    dat, eml, hta, htr, htw, ida, idc, idq, nws, pol, printer, reg, wmz
