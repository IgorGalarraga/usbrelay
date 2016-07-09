CC=gcc
CFLAGS = -O2 -Wall
HIDAPI = hidraw
LDFLAGS = -lhidapi-$(HIDAPI)

OBJECTS = usbrelay.o

all: usbrelay

usbrelay: $(OBJECTS)
	$(CC) $(CFLAGS) $(OBJECTS) -o usbrelay $(LDFLAGS)

install: usbrelay
	install -d $(DESTDIR)/usr/bin
	install -m 0755 usbrelay $(DESTDIR)/usr/bin

.PHONY: all clean install

clean:
	rm -f *~ *.o usbrelay
