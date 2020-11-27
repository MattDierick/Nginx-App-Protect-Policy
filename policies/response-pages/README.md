# Response pages

[Documentation](https://docs.nginx.com/nginx-app-protect/configuration/#blocking-page-customization)

## Example
    [
    {
        "responseContent": "<html><head><title>Reject Page</title></head><body>Your request was blocked.<br><br>Your support ID is: <%TS.request.ID()%><br><br><a href='javascript:history.back();'>[Go Back]</a></body></html>",
        "responseHeader": "HTTP/1.1 200 OK\r\nCache-Control: no-cache\r\nPragma: no-cache\r\nConnection: close",
        "responseActionType": "custom",
        "responsePageType": "default"
    },
    {
        "responsePageType": "ajax",
        "ajaxEnabled": true,
        "ajaxPopupMessage": "Your AJAX request was blocked. Your support ID is: <%TS.request.ID()%>"
    }
    ]
