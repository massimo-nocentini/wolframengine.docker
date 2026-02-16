
echo "Building for platform: $BUILDPLATFORM"

if [ $BUILDPLATFORM == "linux/amd64" ]; then
  cp -r /usr/local/Wolfram/WolframEngine/${WE_VERSION}/SystemFiles/Links/WSTP/DeveloperKit/Linux-x86-64/CompilerAdditions/wstp.h /usr/local/include/
  cp -r /usr/local/Wolfram/WolframEngine/${WE_VERSION}/SystemFiles/Libraries/Linux-x86-64/* /usr/local/lib/
else
  rm -rf /usr/local/Wolfram # this is no necessary because it is for the `amd64` architecture only at the time of writing.
  cd $HOME
  apt-get update && apt-get upgrade -y && apt-get install -y build-essential ca-certificates sudo wget libegl-dev
  useradd -m -s /bin/bash -p wolframengine wolframengine
  #usermod -aG sudo wolframengine
  #usermod -aG video wolframengine
  wget --no-verbose https://archive.raspberrypi.org/debian/pool/main/w/wolfram-engine/wolfram-engine_14.3.0+202510021899_arm64.deb
  yes | apt-get install -y ./wolfram-engine_14.3.0+202510021899_arm64.deb
  rm ./wolfram-engine_14.3.0+202510021899_arm64.deb
  cp -r /opt/Wolfram/WolframEngine/14.3/SystemFiles/Links/WSTP/DeveloperKit/Linux-ARM64/CompilerAdditions/wstp.h /usr/local/include/
  cp -r /opt/Wolfram/WolframEngine/14.3/SystemFiles/Libraries/Linux-ARM64/* /usr/local/lib/
fi

ldconfig