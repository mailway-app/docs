---
layout: page
title: Local version
parent: Self Host
permalink: /self-host/local-version/
nav_order: -1
nav_exclude: true
---

# Local Version
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Supported platform

Currently only Ubuntu 20.04 with systemd is officially supported.

## Installation with systemd

### Add the Debian repository

Add the repository:
```bash
$ curl -s https://apt.mailway.app/ubuntu/KEY.gpg | sudo apt-key add -
$ sudo curl -s -o /etc/apt/sources.list.d/mailway.list https://apt.mailway.app/ubuntu/mailway.list
$ sudo apt update
```

### Install Mailway

```bash
$ sudo apt install mailway
```

This will install Mailway and all its [components].

### Setup

```bash
$ mailway setup --local
```

## Installation with Docker

```sh
docker run \
    -p 25:25 \
    -v /etc/mailway:/etc/mailway \
    -v /var/log/mailway:/var/log/journal \
    -e MW_HOSTNAME=example.com \
    -e MW_EMAIL=youremail@example.com \
    mailway/mailway-local
```

Environment variables:
- `MW_HOSTNAME`: email server hostname (example: mx.example.com).
- `MW_EMAIL`: email used for TLS certificates.

## Configuration

### Email routing for a domain

Routing configuration for a domain is stored at `/etc/mailway/domain.d/$DOMAIN.yaml`, where `$DOMAIN` is the name of your domain.

Rules are devided into two parts:
- `match`: condition on which the rule is run or not
- `action`: task that is run on the email

Rules are executed in order and a rule can specifiy multiple matches and/or actions.

#### Match

Possible conditions:
- `all`: matches everything
- `literal`: exact match against a field of the email.
    - `field`: `from` (email sender) or `to` (email recipient)
    - `value`: value to match against
- `regex`: pattern match against a field of the email.
    - `field`: `from` (email sender) or `to` (email recipient)
    - `value`: value to match against
- `timeAfter`: matches after the specific time passed; timestamp in ms.

#### Action

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
