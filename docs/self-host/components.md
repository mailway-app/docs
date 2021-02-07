---
layout: page
title: Components
parent: Self Host
permalink: /self-host/components/
nav_order: 2
---

# Components
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

The Mailway email service is divided into multiple components:

## auth

When NGINX starts to receive an email, the [auth] service will be called to
authenticate the communication and select a SMTP server that will receive the email.

Sources on GitHub: [auth].

## forwarding

The [forwarding] component has the main business logic, which includes:
- applying the routing rules
- dropping or forwarding the email
- calling webhooks
- spam filtering
- ...

Sources on GitHub: [forwarding].

## maildb

For logging and debugging purposes, the email's metadata (to, from, time, etc)
will be recorded into a database, namely the [maildb] service.

The service exposes a public API (protected by JWT tokens) that allow the dashboard to query the logs.

Sources on GitHub: [maildb].

## mailout

Emails that need to be sent to another email server after being processed
will be sent to the [mailout] service.

[mailout] will attempt to send the email from the current server,
however the target email server might reject the email (due to IP reputation for example).
As a fallback the email will be sent to another smtp server. See [Alternative out SMTP].

Sources on GitHub: [mailout].

[auth]: https://github.com/mailway-app/auth
[maildb]: https://github.com/mailway-app/maildb
[mailout]: https://github.com/mailway-app/mailout
[forwarding]: https://github.com/mailway-app/forwarding
[Alternative out SMTP]: /self-host/alt-out-smtp/
