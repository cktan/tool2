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
[ "$MY_TOOL2_DIR" == "$TOOL2_DIR" ]  || fatal "please set TOOL2_DIR to this $DIR"


##########################
rm -rf installed
mkdir installed
mkdir -p out
TARGETDIR=$TOOL2_DIR/installed


##########################
echo -n 'boost: ..........'
(cd boost_1_61_0 \
  && ./bootstrap.sh --with-python=no --prefix=$TARGETDIR \
  && ./b2 install) >& out/boost.out && pass || fail


##########################
echo -n 'libxml2: ........'
(cd libxml2-2.9.4 \
  && ./configure --prefix=$TARGETDIR --without-python \
  && make clean && make -j8 && make install) >& out/libxml2.out && pass || fail

