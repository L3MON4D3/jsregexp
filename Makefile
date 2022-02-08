TARGET = jsregexp.so
SOURCES = jsregexp.c cutils.c libregexp.c libunicode.c str_builder.c format.c
OBJECTS = $(SOURCES:%.c=%.o)
INCLUDE = -I/usr/include/lua5.1
LIBOPTS = -shared -llua5.1
FLAGS = -fpic
CC = gcc

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CC) $(FLAGS) $(LIBOPTS) $^ -L./ -o $@

%.o: %.c
	$(CC) $(FLAGS) -c $^ $(INCLUDE) -o $@

check:
	lua5.1 test.lua
	luajit test.lua

clean:
	rm -f *.o *.so
