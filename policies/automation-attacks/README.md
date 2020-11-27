# Automation attacks

## bot-defense.json

List of allowed and disallowed bot signatures based in category

+ [App protect documentation](https://docs.nginx.com/nginx-app-protect/configuration/#bot-signatures)

The default actions for classes are: detect for trusted-bot, alarm for untrusted-bot, and block for malicious-bot. 

In this example, we enabled bot defense and specified that we want to raise a violation for trusted-bot and untrusted-bot, and block for malicious-bot while overiding the action for the python signatures.

```json
    {
    "settings": {
        "isEnabled": true
    },
    "mitigations": {
        "classes": [
            {
                "name": "trusted-bot",
                "action": "alarm"
            },
            {
                "name": "untrusted-bot",
                "action": "alarm"
            },
            {
                "name": "malicious-bot",
                "action": "block"
            },
            "signatures": [
                {
                        "action": "ignore",
                        "name": "python-requests"
                }
            ]
        ]
    }
}

```

Signature actions

    - ignore - bot signature is ignored (disabled)
    - detected - only report without raising the violation - VIOL_BOT_CLIENT. The request is considered legal unless another violation is triggered.
    - alarm - report, raise the violation, but pass the request. The request is marked as illegal.
    - block - report, raise the violation, and block the request
