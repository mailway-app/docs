---
layout: page
title: Release 1.1.0
parent: Changelog
grand_parent: Self Host
permalink: /self-host/changelog/release-1-1-0
---

# Release 1.1.0
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

An important issue has been fixed.
Instances were not able to refresh their JWT token and your instance might be using an expired token.

The token is used to authenticate requests from the [dashboard] to display the instance's logs or for internal communication with the [maildb].
Maildb authentication failure might cause emails to be rejected.

## Update your instance

Install the new `mailway` cli version:
```sh
$ apt-get update
$ apt-get install mailway
```

Update all the [components]:
```sh
$ mailway update
```

## Manually refresh the JWT token

You can run `mailway new-jwt` on previous versions to generate a new JWT token.

It's recommended to install the newest version to periodically refresh the JWT token in the background.

## Other notable changes

### Configuration auto reload

Restarting the [components] after a change to the configuration files is no longer required.

The configuration will automatically be applied to the running services.

[dashboard]: https://dash.mailway.app
[maildb]: https://github.com/mailway-app/maildb
[components]: /self-host/components
