
rm -f -r google_sources
mkdir google_sources
git clone https://github.com/google/leveldb.git google_sources
cd google_sources

# Building x86_64
echo Building x86_64...
make
if [ $? -ne 0 ]; then
	echo
    echo Fail to build x86_64 library
	exit 1
fi
cp out-shared/libleveldb.so.1.20 ../runtimes/linux-x64/native/leveldb.dll
make clean

# Building arm_32
echo Building arm 32...
export AR=arm-linux-gnueabihf-ar
export CC=arm-linux-gnueabihf-gcc
export CXX=arm-linux-gnueabihf-g++
export LINK=arm-linux-gnueabihf-g++
make
if [ $? -ne 0 ]; then
	unset AR
	unset CC
	unset CXX
	unset LINK
	echo
    echo Fail to build arm_32 library
	exit 1
fi
cp out-shared/libleveldb.so.1.20 ../runtimes/linux-arm/native/leveldb.dll
make clean
unset AR
unset CC
unset CXX
unset LINK

# Building x86_32
echo Building x86_32
export CC=../gcc_32
export CXX=../g++_32
make
if [ $? -ne 0 ]; then
	unset CC
	unset CXX
	echo
    echo Fail to build x86_32 library
	exit 1
fi
cp out-shared/libleveldb.so.1.20 ../runtimes/linux-x86/native/leveldb.dll
make clean
unset CC
unset CXX


# Building arm_64
echo Building arm 64...
export AR=aarch64-linux-gnu-ar
export CC=aarch64-linux-gnu-gcc
export CXX=aarch64-linux-gnu-g++
export LINK=aarch64-linux-gnu-g++
make
if [ $? -ne 0 ]; then
	unset AR
	unset CC
	unset CXX
	unset LINK
	echo
    echo Fail to build arm_32 library
	exit 1
fi
cp out-shared/libleveldb.so.1.20 ../runtimes/linux-arm64/native/leveldb.dll
make clean
unset AR
unset CC
unset CXX
unset LINK

cd ..
rm -f -r google_sources