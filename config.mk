# Makefile config for monocle
# cheeseum 2010

PROGNAME = monocle
VERSION  = 1.3

PREFIX     ?= /usr
INSTALLDIR ?= ${DESTDIR}${PREFIX}

CC = cc
PKG_CONFIG = /usr/bin/pkg-config
GTK_CFLAGS  = $(shell $(PKG_CONFIG) --cflags gtk+-2.0)
GTK_LDFLAGS = $(shell $(PKG_CONFIG) --libs gtk+-2.0)
DEBUGFLAGS = -ggdb -ggdb3
CFLAGS	= -O3 -march=native -lgthread-2.0 -pedantic -Wall -DVERSION=\"${VERSION}\"  -DPROGNAME=\"${PROGNAME}\" ${GTK_CFLAGS}
CFLAGS  += ${DEBUGFLAGS} #comment this out to remove debugging symbols
LDFLAGS = -pthread ${GTK_LDFLAGS}

# Change this to your mingw environment dir
W32 = /home/cheeseum/src/mingw32/mingw-cross-env-2.15/usr/bin/i686-pc-mingw32
W32CC = $(W32)-gcc
W32PKG_CONFIG = $(W32)-pkg-config
W32_GTK_CFLAGS = $(shell $(W32PKG_CONFIG) --cflags gtk+-win32-2.0)
W32_GTK_LDFLAGS = $(shell $(W32PKG_CONFIG) --libs gtk+-win32-2.0)
W32CFLAGS	= -ggdb -ggdb3 -pedantic -Wall -DVERSION=\"${VERSION}\"  -DPROGNAME=\"${PROGNAME}\" ${W32_GTK_CFLAGS}
W32LDFLAGS = $(W32_GTK_LDFLAGS)
