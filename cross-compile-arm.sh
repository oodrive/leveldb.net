
rm -f -r google_sources
mkdir google_sources
git clone https://github.com/google/leveldb.git google_sources
mkdir google_sources/build
cd google_sources/build

# Building x86_64
echo Building x86_64...
cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=true .. && cmake --build .
if [ $? -ne 0 ]; then
	echo
    echo Fail to build x86_64 library
	exit 1
fi
cp libleveldb.so ../../runtimes/linux-x64/native/leveldb.dll
rm -rf *

# Building arm_32
echo Building arm 32...
export AR=arm-linux-gnueabihf-ar
export CC=arm-linux-gnueabihf-gcc
export CXX=arm-linux-gnueabihf-g++
export LINK=arm-linux-gnueabihf-g++
cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=true .. && cmake --build .
if [ $? -ne 0 ]; then
	unset AR
	unset CC
	unset CXX
	unset LINK
	echo
    echo Fail to build arm_32 library
	exit 1
fi
cp libleveldb.so ../../runtimes/linux-arm/native/leveldb.dll
rm -rf *
unset AR
unset CC
unset CXX
unset LINK

# Building x86_32
#echo Building x86_32
#export CC=../gcc_32
#export CXX=../g++_32
#cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=true .. && cmake --build .
#if [ $? -ne 0 ]; then
#	unset CC
#	unset CXX
#	echo
#    echo Fail to build x86_32 library
#	exit 1
#fi
#cp libleveldb.so ../../runtimes/linux-x86/native/leveldb.dll
#rm -rf *
#unset CC
#unset CXX


# Building arm_64
echo Building arm 64...
export AR=aarch64-linux-gnu-ar
export CC=aarch64-linux-gnu-gcc
export CXX=aarch64-linux-gnu-g++
export LINK=aarch64-linux-gnu-g++
cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=true .. && cmake --build .
if [ $? -ne 0 ]; then
	unset AR
	unset CC
	unset CXX
	unset LINK
	echo
    echo Fail to build arm_32 library
	exit 1
fi
cp libleveldb.so ../../runtimes/linux-arm64/native/leveldb.dll
rm -rf *
unset AR
unset CC
unset CXX
unset LINK



# Building Android arm_32
echo Building Android arm 32...
export AR=~/android.arm/bin/arm-linux-androideabi-ar
export CC=~/android.arm/bin/arm-linux-androideabi-gcc
export CXX=~/android.arm/bin/arm-linux-androideabi-g++
export LINK=~/android.arm/bin/arm-linux-androideabi-g++
cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=true .. && cmake --build .
if [ $? -ne 0 ]; then
	unset AR
	unset CC
	unset CXX
	unset LINK
	echo
    echo Fail to build arm_32 library
	exit 1
fi
cp libleveldb.so ../../runtimes/android-arm/native/leveldb.dll
rm -rf *
unset AR
unset CC
unset CXX
unset LINK


# Building Android arm_64
echo Building Android arm 64...
export AR=~/android.arm64/bin/aarch64-linux-android-ar
export CC=~/android.arm64/bin/aarch64-linux-android-gcc
export CXX=~/android.arm64/bin/aarch64-linux-android-g++
export LINK=~/android.arm64/bin/aarch64-linux-android-g++
cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=true .. && cmake --build .
if [ $? -ne 0 ]; then
	unset AR
	unset CC
	unset CXX
	unset LINK
	echo
    echo Fail to build arm_32 library
	exit 1
fi
cp libleveldb.so ../../runtimes/android-arm64/native/leveldb.dll
rm -rf *
unset AR
unset CC
unset CXX
unset LINK


cd ../..
rm -f -r google_sources