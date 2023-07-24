Illumos make for OpenBSD
========================
This repo contains a port of
[Illumos](https://www.illumos.org/)
make for
[OpenBSD](https://www.openbsd.org/).

It may build and run on other Unices as well.

Building
--------
Run `make && doas make install`.

This will install two executables: `dmake` and `sunmake`.
The `dmake` executable is Illumos `dmake`.
The `sunmake` executable is Illumos `/usr/xpg4/bin/make`.

Running
-------
See
[`make.1`](https://illumos.org/man/1/make)
for more information.

This manual page is installed as `dmake.1`.

LICENSE
-------
CDDL. See `OPENSOLARIS.LICENSE` for more information.
