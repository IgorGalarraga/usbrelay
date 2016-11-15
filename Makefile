HIDAPI ?= hidraw
CC ?= gcc
STRIP ?= strip
CFLAGS ?= -O2 -Wall

CFLAGS += `pkg-config --cflags hidapi-$(HIDAPI)`
LDFLAGS += `pkg-config --libs hidapi-$(HIDAPI)`

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
