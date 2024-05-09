#!/bin/sh
set -e

warnings_off="-Wno-format -Wno-parentheses -Wno-switch -Wno-unused-result"

if [ "x$CXX" = "x" ]; then
    CXX="c++"
fi
if [ "x$CXXFLAGS" = "x" ]; then
    CXXFLAGS="-O2 -Iinclude -I/usr/local/include -D_FILE_OFFSET_BITS=64 $warnings_off"
fi

# check if we need libbsd for compatibility
case "$(uname -s)" in
    NetBSD)
        LIBS="-lrt $LIBS"
        ;;
    *BSD)
        ;;
    *)
        LIBS="-lbsd $LIBS"
        ;;
esac

set -x

# clean
rm -f bin/*.o lib/mksh/*.o lib/vroot/*.o

# compile sources
for f in bin/*.cc lib/mksh/*.cc lib/vroot/*.cc ; do
    $CXX $CXXFLAGS -c $f -o ${f}.o
done

# link binary
$CXX $LDFLAGS -o dmake_bootstrap bin/*.o lib/mksh/*.o lib/vroot/*.o $LIBS

# copy rules file
cp -f bin/make.rules.file make.rules

# check if dmake can bootstrap itself
./dmake_bootstrap clean
./dmake_bootstrap LIBS="$LIBS"

set +x

echo "dmake successfully bootstrapped itself!"
