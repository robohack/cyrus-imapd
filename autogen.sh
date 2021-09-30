#!/bin/sh

set -x

#	Prerequisites:
#
# NetBSD:
#
#  build-only:
#	pkgin install autoconf automake libtool bison(system yacc?)
#
#  runtime (and build):
#	pkgin install cyrus-sasl cyrus-saslauthd jansson pcre perl libuuid icu
#
# from the system:  gcc flex ldap libwrap libz (open)ssl sqlite3

autoreconf -i -s -v -f
