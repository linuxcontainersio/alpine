# Alpine Linux in Docker with Multilanguage Timezone support

[![Docker Automated build](https://img.shields.io/docker/automated/linuxcontainers/alpine.svg?style=for-the-badge&logo=docker)](https://hub.docker.com/r/linuxcontainers/alpine/)
[![Docker Pulls](https://img.shields.io/docker/pulls/linuxcontainers/alpine.svg?style=for-the-badge&logo=docker)](https://hub.docker.com/r/linuxcontainers/alpine/)
[![Docker Stars](https://img.shields.io/docker/stars/linuxcontainers/alpine.svg?style=for-the-badge&logo=docker)](https://hub.docker.com/r/linuxcontainers/alpine/)
![Docker Image Size (tag)](https://img.shields.io/docker/image-size/linuxcontainers/alpine/latest?logo=docker&style=for-the-badge)

[![Alpine Version](https://img.shields.io/badge/Alpine%20version-v3.11.6-green.svg?style=for-the-badge)](https://alpinelinux.org/)

This Docker image [(linuxcontainers/alpine)](https://hub.docker.com/r/linuxcontainers/alpine/) is based on the minimal [Alpine Linux](https://alpinelinux.org/) and was a clone of (https://gitlab.com/maurosoft1973-docker/alpine/) which i wanted to learn for myself and if needed alter accordingly .

##### Alpine Version 3.11.6 (Released Apr 23, 2020)

This docker image is the base Alpine Linux. For more info on versions & support see [Releases](https://wiki.alpinelinux.org/wiki/Alpine_Linux:Releases)

----

## What is Alpine Linux?
Alpine Linux is a Linux distribution built around musl libc and BusyBox. The image is only 5 MB in size and has access to a package repository that is much more complete than other BusyBox based images. This makes Alpine Linux a great image base for utilities and even production applications. Read more about Alpine Linux here and you can see how their mantra fits in right at home with Docker images.

## Features

* Minimal size only, minimal layers
* Memory usage is minimal on a simple install
* Multilanguage support.
* Timezone Support

## Architectures

* ```:amd64```, ```:x86_64``` - 64 bit Intel/AMD (x86_64/amd64)

## Environment Variables:

### Main parameters:
* `LC_ALL`: default locale (en_GB.UTF-8)
* `TIMEZONE`: default timezone (Europe/GMT)

#### List of locale Sets

When setting locale, also make sure to choose a locale otherwise it will be the default (en_GB.UTF-8).

```
+-----------------+
| Locale          |
+-----------------+
| ch_DE.UTF-8     |
| fr_FR.UTF-8     |
| de_CH.UTF-8     |
| de_DE.UTF-8     |
| en_GB.UTF-8     |
| en_US.UTF-8     |
| es_ES.UTF-8     |
| it_IT.UTF-8     |
| nb_NO.UTF-8     | 
| nl_NL.UTF-8     |
| pt_BR.UTF-8     |
| ru_RU.UTF-8     |
| sv_SE.UTF-8     |
+-----------------+
```

## Creating an instance (default timezone and locale)

```bash
docker run -it --name alpine linuxcontainers/alpine
```

## Creating an instance with locale it_IT

```bash
docker run -it --name alpine -e LC_ALL=it_IT.UTF-8 linuxcontainers/alpine
```
