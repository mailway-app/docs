---
layout: page
title: How to debug
parent: Self Host
permalink: /self-host/how-to-debug/
nav_order: 7
---

# How to debug
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Checking the state of an email

On the domain's *logs* page in the [dashboard], the first column indicates the status of the email;
- *orange*: the email has been received, but not yet processed.
- *green*: the email has been processed and delivered at its final destination. See the `Matched rule's action` column for more information.
- *gray*: email blocked due to spam filtering.
- *red*: the email failed to delivered. See [how to manually recover the email].
- *white*: email is in unknown state.

More information can be found by hovering the status icon.

## Looking at logs

You can access the service logs using the command: `mailway logs`.

To see a particular [component]'s logs you can use `journalctl`. For instance: `journalctl -e -u mailout`.

## Reaching out to Mailway

If you have a question or an issue with a particular [component], you can raise an issue on our public issue tracker available on our [GitHub organization].
Contributions to the code are also welcome.

For other requests, please feel free to reach out to the [support].

[dashboard]: https://dash.mailway.app
[how to manually recover the email]: /self-host/manual-email-error-recovery/
[component]: /self-host/components/
[GitHub organization]: https://github.com/mailway-app
[support]: mailto:support@mailway.app
