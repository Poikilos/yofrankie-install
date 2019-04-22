#!/bin/sh
if [ ! -f "release249a.md5" ]; then
  wget https://download.blender.org/release/Blender2.49a/release249a.md5
fi
#OpenSUSE build system has YoFrankie, but whether the package works (which may require a really old version of deps) is unknown: https://build.opensuse.org/package/show/games/yofrankie?rev=1
if [ ! -d "yofrankie_src" ]; then
  svn co https://svn.blender.org/svnroot/yofrankie/trunk
  mv trunk yofrankie_src
  #git clone https://github.com/BlenderVR/yofrankie.git
  #mv yofrankie yofrankie_src
  #unzip yofrankie_src.zip
fi
if [ ! -d "yofrankie_src" ]; then
  echo "ERROR: svn command is required (try installing svn or subversion package)"
  #echo "ERROR: requires unzip command (or yofrankie_src.zip to be unzipped manually first)."
  exit 1
fi
#if [ ! -f blender-2.46-linux-glibc236-py25-x86_64-static.tar.bz2 ]; then
#  #only 2.46 static since there is no known static build of blenderplayer 2.49a (2.49a can be run with "static functionality" using blender-softwaregl binary, but there is no equivalent blenderplayer)
#  wget http://download.blender.org/release/Blender2.46/blender-2.46-linux-glibc236-py25-x86_64-static.tar.bz2
#fi
if [ ! -f blender-2.49a-linux-glibc236-py26-x86_64.tar.bz2 ]; then
  wget http://download.blender.org/release/Blender2.49a/blender-2.49a-linux-glibc236-py26-x86_64.tar.bz2
fi
#linux 32-bit: https://download.blender.org/release/Blender2.49b/blender-2.49b-linux-glibc236-py26-i386.tar.bz2
#Windows 32-bit: http://download.blender.org/release/Blender2.49a/blender-2.49a-windows.zip
#Windows 64-bit: https://download.blender.org/release/Blender2.49a/blender-2.49a-win64-python26.zip
#OS X:
#https://download.blender.org/release/Blender2.49a/blender-2.49a-OSX-10.3-powerpc-py2.3.tar.bz2
#https://download.blender.org/release/Blender2.49a/blender-2.49a-OSX-10.4-py2.3-intel.zip
#https://download.blender.org/release/Blender2.49a/blender-2.49a-OSX-10.5-py2.5-intel.zip
if [ ! -d "blender-2.49a-linux-glibc236-py26-x86_64" ]; then
  tar -xf blender-2.49a-linux-glibc236-py26-x86_64.tar.bz2
  mv trunk blender-2.49a-linux-glibc236-py26-x86_64
fi
if [ "`command -v padsp`" ]; then
  padsp ./blender-2.49a-linux-glibc236-py26-x86_64/blenderplayer yofrankie_src/yo_frankie_stub.blend
else
  echo "Your system is missing padsp! Without that, you will have no sound unless you have the old alsa-oss package or older oss."
  ./blender-2.49a-linux-glibc236-py26-x86_64/blenderplayer yofrankie_src/yo_frankie_stub.blend
fi

#if [ ! -d "yofrankie_1_1b_bge" ]; then
  #unzip yofrankie_bge.zip
#fi
#cd yofrankie_1_1b_bge/yofrankie_1_1b_bge
#chmod +x yofrankie-linux-x86_64.bin
#./yofrankie-linux-x86_64.bin
