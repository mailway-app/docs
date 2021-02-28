---
layout: default
title: Webhooks
description: Webhooks allows you to programmatically process emails
nav_order: 3
permalink: /webhooks/
---

## Webhooks

> Webhooks allows you to programmatically process emails

Go back to the Mailway [dashboard] and go to your domain's rules.

Create a new rule and select **webhook** as action:
![Add webhook rule](/assets/images/webhooks/add-webhooks-rule.jpg)

All emails sent to `events@example.com` will call the provided webhook URL, with a POST request.

The webhook is called with the HTTP headers:
- `Mw-Domain`: name of the domain that received the email
- `Mw-Id`: ID of the email
- `Mw-Signature`: HMAC SHA-256 signature using the secret token (not implemented yet)

The webhook is called with the JSON body:
- `headers`: email headers
- `bodyURL`: URL to the email body

Example request:
```
> POST /events HTTP/1.1

> Accept-Encoding: gzip
> Content-Length: 957
> Content-Type: application/json
> Host: api.example.com
> Mw-Domain: example.com
> Mw-Id: 84784da6-61f0-4c47-b4bb-9f0d5a2964a3
> Mw-Signature: signature

{
  "headers": {
    "Content-Type": [
      "text/plain; charset=\"utf-8\""
    ],
    "Date": [
      "Sun, 28 Feb 2021 05:30:04 -0800"
    ],
    "From": [
      "\"Mailway\" <test@mailway.app>"
    ],
    "Received": [
      "from localhost (localhost [127.0.0.1]) by ali.smtp-in.mailway.app (webhook) with SMTP for <events@example.com>; Sun, 28 Feb 2021 13:29:55 +0000 (UTC)",
      "from mailway.app (mailway.app. [1.2.3.4]) by ali.smtp-in.mailway.app (fwdr) with SMTP for <events@example.com>; Sun, 28 Feb 2021 13:29:55 +0000 (UTC)"
    ],
    "Subject": [
      "Mailway test webhooks"
    ],
    "To": [
      "events@example.com"
    ]
  },
  "bodyURL": "https://ali.smtp-in.mailway.app/db/email/84784da6-61f0-4c47-b4bb-9f0d5a2964a3?token=fbadb9220d2b3af5799a43532039128872710e25067fe7b4639c84fee6b9b9ea"
}
```

### Retriving the email content

The `bodyURL` field is an URL that allows to retrieve the email content with a GET request.

The email content is available for one hour after the email has been received.

Example request:
```
> GET /db/email/84784da6-61f0-4c47-b4bb-9f0d5a2964a3?token=fbadb9220d2b3af5799a43532039128872710e25067fe7b4639c84fee6b9b9ea HTTP/1.1

Hi, this is a test email.
```

[dashboard]: https://dash.mailway.app
