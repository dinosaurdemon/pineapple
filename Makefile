LDFLAGS = $(SDL_LDFLAGS) $(NCURSES_LDFLAGS)
CFLAGS = -Wall $(SDL_CFLAGS) $(NCURSES_CFLAGS)
CC = gcc

SDL_LDFLAGS := $(shell pkg-config --libs sdl)
NCURSES_LDFLAGS := $(shell ncurses5-config --libs)

SDL_CFLAGS := $(shell pkg-config --cflags sdl)
NCURSES_CFLAGS := $(shell ncurses5-config --cflags)

all:	tracker

tracker:	main.o chip.o gui.o
	gcc -o $@ $^ ${LDFLAGS}

%.o:	%.c stuff.h Makefile

.PHONY:
	clean
clean:	
	@echo "clean ..."
	@rm -f *.o
