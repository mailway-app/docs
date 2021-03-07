---
layout: page
title: Configure local routing rules
parent: Self Host
permalink: /self-host/configure-local-routing-rules/
nav_order: 9
---

# Configure local routing rules
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Email routing for a domain

Routing configuration for a domain is stored at `/etc/mailway/domain.d/$DOMAIN.yaml`, where `$DOMAIN` is the name of your domain.

Rules are devided into two parts:
- `match`: condition on which the rule is run or not
- `action`: task that is run on the email

Rules are executed in order and a rule can specifiy multiple matches and/or actions.

### Match

Possible conditions:
- `all`: matches everything
- `literal`: exact match against a field of the email.
    - `field`: `from` (email sender), `to` (email recipient) or `subject` (email subject)
    - `value`: value to match against
- `regex`: pattern match against a field of the email.
    - `field`: `from` (email sender), `to` (email recipient) or `subject` (email subject)
    - `value`: value to match against
- `timeAfter`: matches after the specific time passed; timestamp in ms.

### Action

Possible conditions:
- `drop`: ignore the email
- `forward`: send the email to another email address; value is an array of addresses.
- `webhook`: call a provided endpoint with informations about the email;
value is an array whose first element is an URL and second a secret key to sign the request.
Find information about [webhooks].

For example the configuration for the `mailway.app` domain:
```yml
rules:
  - match:
      - type: literal
        field: to
        value: sven@mailway.app
    action:
      - type: forward
        value:
            - sven@example.com

  - match:
      - type: all
    action:
      - type: drop
```


[components]: /self-host/components/
[webhooks]: /webhooks/
