---
layout: page
title: Manual Email Error Recovery
parent: Self Host
permalink: /self-host/manual-email-error-recovery/
nav_order: 5
---

# Manual Email Error Recovery
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

When the service fails to process an email or its delivery was rejected by the destination SMTP, a backup will be kept in a temporary folder.

You can see all backups by running:
```sh
ls -lh /tmp/*.eml
```

For now the email failure recovering is manual. Run the following command to recover an email:
```sh
mailway recover /tmp/$UUID.eml
```

Where `$UUID` is the email identifier. It can also be found in the SMTP communication.
