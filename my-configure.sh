#!/bin/sh

argv0dir=$(dirname $0)

# build for /usr/local with packages from /usr/pkg

#  -Wtraditional
#  -Wcast-qual	 ### impossible with the crap code in skiplist
#  -Wconversion  ### code is too crappy
#  -Wpointer-arith ### code is too crappy (void* used in arithmetic!)
#  -Waggregate-return ### code returns structs, should be ok for C90
#
#  (should also use (-Wno-discarded-qualifiers) as the code has
#  many abuses)
#
CWARNFLAGS='-Wall -Wextra -Wimplicit -Wreturn-type -Wswitch -Wcomment -Wshadow -Wstrict-prototypes -Wcast-align -Wchar-subscripts -Wmissing-declarations -Wmissing-prototypes -Wno-long-long -Wformat-extra-args -Wundef -Wbad-function-cast -Wwrite-strings -Wdeclaration-after-statement -Wno-stack-protector -Wno-sign-conversion'

# NOTE:  the above (obviously) includes -Wstrict-prototypes which messes up
# stupid autoconf's check for usability of -Werror because stupid autoconf
# doesn't include a prototype for main()!!!

# not including --disable-dynamic for the benefit of the perl module(s)
#
# ac_cv_lib_wrap_request_init=yes is because on NetBSD the linker requires
# allow_severity and deny_severity to be supplied by the test program, but of
# course they are not.  (See cmulocal/libwrap.m4)
#
# N.B.:  for pkgsrc the '-rpath' syntax is available in ${COMPILER_RPATH_FLAG}
#
ac_cv_lib_wrap_request_init=yes LDFLAGS="-L/usr/pkg/lib -Wl,-rpath,/usr/pkg/lib $LDSTATIC" CFLAGS="-I/usr/pkg/include -fstack-protector $CWARNFLAGS" $argv0dir/configure --enable-static --enable-autocreate --enable-idled --with-extraident=Planix-CyrusIMAP-2.3.x --sysconfdir=/etc --with-cyrus-user=cyrus --with-openssl=/usr --with-sasl=/usr/local --with-perl=/usr/pkg/bin/perl --enable-pcre --with-sqlite --with-ldap --with-libwrap --enable-backup --enable-murder --enable-nntp --without-zephyr --without-krb --without-krbdes --disable-gssapi --with-com-err=yes --enable-idled --with-staticsasl=/usr/pkg --prefix=/usr/local --mandir=/usr/local/share/man

# Note:  remove config.status to re-configure without "gmake distclean"

#
# configure: error: --enable-calalarmd requires --enable-http

#
# configure: WARNING: unrecognized options: --with-bdb, --with-bdb-incdir, --with-bdb-libdir, --with-cyrus-group, --with-cyrus-prefix, --enable-listext, --without-ucdsnmp

