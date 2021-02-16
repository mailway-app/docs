---
layout: page
title: Secure SMTP
parent: Self Host
permalink: /self-host/secure-smtp/
nav_order: 4
---

# Secure SMTP
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Generate the certificate

```sh
mailway setup-secure-smtp
```

## Configure the email service

In `/etc/mailway/frontline/nginx.conf` uncomment the bock that starts with `listen 0.0.0.0:465 ssl;`.

Then restart the service:
```sh
mailway restart
```

It's recommended to encrypt traffic to the port 25 as well by uncommenting the comments in the first block.

## Confirming that it works

```sh
openssl s_client -connect $DOMAIN:465
```

Replace `$DOMAIN` with the name of the domain you configured to receive emails.

If at the bottom you can read `220 $DOMAIN ESMTP ready` it means that you successfully etablished a secure connection to the mail server. At the top you can find informations about the certificate.
