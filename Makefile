#Uncomment for crosscompilation on debian environment with tools instaled:
#CROSS_PREFIX = arm-linux-gnueabihf-

CC = $(CROSS_PREFIX)gcc
CFLAGS = -O2 -Wall
HIDAPI = hidraw
LDFLAGS = -lhidapi-$(HIDAPI)
STRIP = $(CROSS_PREFIX)strip

OBJECTS = usbrelay.o

all: usbrelay

usbrelay: $(OBJECTS)
	$(CC) $(CFLAGS) $(OBJECTS) -o usbrelay $(LDFLAGS)
	$(STRIP) usbrelay

install: usbrelay
	install -d $(DESTDIR)/usr/bin
	install -m 0755 usbrelay $(DESTDIR)/usr/bin

.PHONY: all clean install

clean:
	rm -f *~ *.o usbrelay
