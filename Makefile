#
# DHRSLIDE.SYSTEM Makefile
# assembles source code, optionally builds a disk image and mounts it
#
# original by Quinn Dunki on 2014-08-15
# One Girl, One Laptop Productions
# http://www.quinndunki.com/blondihacks
#
# adapted by 4am on 2018-01-08
#

# third-party tools required to build
# https://sourceforge.net/projects/acme-crossass/
ACME=acme
# https://sourceforge.net/projects/applecommander/
AC=bin/AppleCommander.jar

BUILDDISK=build/dhrslide.po

asm:
	mkdir -p build
	cd src && $(ACME) -r ../build/dhrslide.lst dhrslide.system.a
	cp res/work.po $(BUILDDISK)
	java -jar $(AC) -p $(BUILDDISK) "DHRSLIDE.SYSTEM" sys 0x2000 < "build/DHRSLIDE.SYSTEM#FF2000"

clean:
	rm -rf build/

mount:
	osascript bin/V2Make.scpt "`pwd`" $(BUILDDISK)

all: clean asm mount
