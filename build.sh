set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
MY_TOOL2_DIR=$DIR

function fatal
{
   echo
   echo ERROR: $1
   echo
   exit 1
}


function pass 
{
   echo '[ok]'
}

function fail
{
   echo '[fail]'
   if [ $1 ]; then echo $*; fi
}

##########################
(cd xdrive >& /dev/null) || fatal 'please symlink xdrive'


##########################
[ "$MY_TOOL2_DIR" == "$TOOL2_DIR" ]  || fatal "please set TOOL2_DIR to this: $DIR"


##########################
rm -rf installed
mkdir installed
mkdir -p out
TARGETDIR=$TOOL2_DIR/installed

##########################
echo -n 'libgsasl: .......'
(cd libgsasl-1.8.0 \
  && ./configure --prefix=$TARGETDIR --enable-static --enable-shared=no \
  && make clean && make -j8 && make install) >& out/libgsasl.out && pass || fail


##########################
echo -n 'libuuid: ........'
(cd libuuid-1.0.3 \
  && ./configure --prefix=$TARGETDIR --enable-static --enable-shared=no \
  && make clean && make -j8 && make install) >& out/libuuid.out && pass || fail


##########################
echo -n 'kerboros: .......'
(cd krb5-1.14.2/src \
  && ./configure --prefix=$TARGETDIR --enable-static --enable-shared=no \
  && make clean && make -j8 && make install) >& out/krb.out && pass || fail

##########################
# DON'T NEED THIS SHIT
#echo -n 'boost: ..........'
#(cd boost_1_61_0 \
#  && ./bootstrap.sh --with-python=no --prefix=$TARGETDIR \
#  && ./b2 install) >& out/boost.out && pass || fail


##########################
echo -n 'libxml2: ........'
(cd libxml2-2.9.4 \
  && ./configure --prefix=$TARGETDIR --without-python --enable-shared=no \
  && make clean && make -j8 && make install) >& out/libxml2.out && pass || fail


##########################
echo -n 'libhdfs3: .......'
#(cd libhdfs3 \
#  && rm -rf build && mkdir build && cd build \
#  && ../bootstrap --prefix=$TARGETDIR --dependency=$TARGETDIR \
#  && make clean && make -j8 && make install) >& out/libhdfs3.out && pass || fail
# Use good old Makefiles
( (cd libhdfs3/src && make clean && make -j8) \
	&& cp libhdfs3/src/libhdfs3.a installed/lib/ \
	&& cp libhdfs3/src/client/hdfs.h installed/include/ ) >& out/libhdfs3.out && pass || fail

##########################
echo -n 'xdrive: .........'
( (cd xdrive && make clean && make -j8) \
	&& cp xdrive/client/xdrclnt.h installed/include/ \
	&& cp xdrive/server/xdrive installed/bin/ \
	&& cp xdrive/client/libxdrive.a installed/lib ) >& out/xdrive.out && pass || fail

##########################
echo -n 'rm *.so: ........'
(cd $TARGETDIR/lib && rm -f *.so *.so.*) && pass || fail

