# dmake Makefile

PREFIX =	/usr/local
MANDIR =	man/man1

CXXFLAGS +=	-Iinclude -I/usr/local/include -D_FILE_OFFSET_BITS=64 \
		-Wno-format -Wno-parentheses -Wno-switch

PROG =	dmake
OBJS =	bin/ar.o bin/depvar.o bin/doname.o bin/dosys.o bin/files.o \
	bin/globals.o bin/implicit.o bin/macro.o bin/main.o bin/misc.o \
	bin/nse_printdep.o bin/parallel.o bin/pmake.o bin/read.o bin/read2.o \
	bin/rep.o bin/state.o \
	lib/mksh/dosys.o lib/mksh/globals.o lib/mksh/i18n.o lib/mksh/macro.o \
	lib/mksh/misc.o lib/mksh/mksh.o lib/mksh/read.o \
	lib/vroot/access.o lib/vroot/args.o lib/vroot/execve.o \
	lib/vroot/lock.o lib/vroot/lstat.o lib/vroot/open.o \
	lib/vroot/readlink.o lib/vroot/report.o lib/vroot/stat.o \
	lib/vroot/vroot.o

all: ${OBJS}
	${CXX} ${CXXFLAGS} ${LDFLAGS} -o ${PROG} ${OBJS}

${OBJS}:
	${CXX} ${CXXFLAGS} -o $@ -c $<

install:
	install -d -m 755 ${DESTDIR}${PREFIX}/bin
	install -d -m 755 ${DESTDIR}${PREFIX}/${MANDIR}
	install -d -m 755 ${DESTDIR}${PREFIX}/share/lib/make
	install -c -C -s -o root -g bin -m 755 ${PROG} ${DESTDIR}${PREFIX}/bin
	install -c -C -s -o root -g bin -m 755 ${PROG} \
		${DESTDIR}${PREFIX}/bin/sunmake
	install -c -o root -g bin -m 444 dmake.1 ${DESTDIR}${PREFIX}/${MANDIR}
	install -c -o root -g bin -m 444 bin/make.rules.file \
		${DESTDIR}${PREFIX}/share/lib/make/make.rules
	install -c -o root -g bin -m 444 bin/svr4.make.rules.file \
		${DESTDIR}${PREFIX}/share/lib/make/svr4.make.rules

test:
	@echo "No tests"

clean:
	rm -f ${PROG} ${OBJS}
