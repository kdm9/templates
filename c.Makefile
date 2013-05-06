# Simple C project
CC=gcc
CFLAGS=-g -O3 -I.
OBJ=$(patsubst %.c,./obj/%.o,$(SRCS))
PROG=<+PROG+>
all: obj
	$(CC) $(CFLAGS) $(OBJ) -o ./bin/$(PROG)

%.o : %.c
	$(CC) $(CFLAGS)
