---
layout: page
title: Reliability
parent: Email Service
permalink: /email-service/reliability/
---

# Reliability
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

You can check the service's uptime on the [Mailway status page] and subscribe to future updates.

## Incoming email (mail servers)

When a domain is registered on Mailway, two mail servers are assigned to that domain (visible as the [MX records] on the dashboard).
Those mail servers are responsible for receiving and processing the domain's incoming emails.

Such a setup distributes the load between the two servers evenly and can tolerate one of them failing.

<div style="text-align: center">
  <img src="/assets/images/email-service/fallback.svg" alt="Fallback to second server"/>
</div>

If the first server fails the second will receive the incoming emails, while the first server is recovering.

## Email processing

While having two mail servers for each makes the service considerably more reliable, we still need to ensure that no emails are lost in the event of a failure during its processing.

When an email is received it's streamed to the disk and will be kept during the processing, until it completed successfully.
Note that we don't store the email any longer that necessary.

If the processing fails, the email will be recovered from the temporary copy on disk and the processing continues.

## Outgoing email

During processing the email is routed to its final destination (for example, your personal email). Emails are sent by an external service that takes care of delivering the email.

[MX records]: https://en.wikipedia.org/wiki/MX_record
[Mailway status page]: https://mailway.statuspage.io
