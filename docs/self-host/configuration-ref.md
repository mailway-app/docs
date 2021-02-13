---
layout: page
title: Configuration Reference
parent: Self Host
permalink: /self-host/configuration-reference/
nav_order: 7
---

# Configuration Reference
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

The configuration is managed by a shared Golang library: [config]. The configuration files are written in YAML and available in the `/etc/mailway/conf.d/` folder.

For convenience, you can print the entire config at once using: `mailway config`.

The configuration is mostly generated automatically.

## Logging

- `log_level`: Sets the log level in all [components]. Possible values are: `DEBUG`, `INFO` and `WARN`. Default value: `INFO`.
- `log_frontline_error`: Frontline's NGINX error log location.
- `log_frontline_http_access`: Frontline's NGINX HTTP access log location.
- `log_frontline_http_error`: Frontline's NGINX HTTP error log location.

## Instance

- `server_id`: unique identifier of the server.
- `server_jwt`: JWT token that the server uses to secure the communication with the Mailway dashboard.
- `instance_hostname`: public name of the Mailway instance.
- `instance_email`: email used to generate certificates.

## Service ports

- `port_auth`: auth HTTP server port.
- `port_forwarding`: forwarding SMTP server port.
- `port_maildb`: maildb HTTP server port.
- `port_mailout`: mailout SMTP server port.

## Outgoing emails

### Alternative out SMTP

See how to configure the [Alternative out SMTP].

- `out_smtp_host`: alternative SMTP hostname.
- `out_smtp_username`: alternative SMTP username.
- `out_smtp_password`: alternative SMTP password.
- `out_smtp_port`: alternative SMTP server port (default: 587).

### DKIM signing

- `out_dkim_path`: path of the DKIM private key, in PEM format.

## Forwarding

- `forwarding_loop_detection_count`: number of loops allowed (default: 25).
- `forwarding_rate_limiting_count`: number of emails allowed per hour (default: 100).

## Spam filtering

- `spam_filter`: enable the spam filtering. Possible values: `true`, `false`.

This requires configuring a spam filter, not yet documented.

## Mail database

- `maildb_db_path`: Mail database location on disk (default: $CWD/maildb.db)

[config]: https://github.com/mailway-app/config
[components]: /self-host/components/
[Alternative out SMTP]: /self-host/alt-out-smtp/
