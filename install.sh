
echo "Building for platform: $BUILDPLATFORM"

if [ $BUILDPLATFORM == "linux/amd64" ]; then
  cp /usr/local/include/amd64/wstp.h /usr/local/include/
  cp /usr/local/lib/amd64/libWSTP64i4.so /usr/local/lib/  
else
  apt-get update && apt-get upgrade -y && apt-get install -y build-essential ca-certificates
  # yes | apt-get install -y ./wolfram-engine_14.3.0+202510021899_arm64.deb
  cp /opt/Wolfram/WolframEngine/14.3/SystemFiles/Links/WSTP/DeveloperKit/Linux-ARM64/CompilerAdditions/wstp.h /usr/local/include/
  cp /opt/Wolfram/WolframEngine/14.3/SystemFiles/Links/WSTP/DeveloperKit/Linux-ARM64/CompilerAdditions/libWSTP64i4.so /usr/local/lib/amd64/
fi

rm -rf /usr/local/include/amd64 # Remove the directory if it exists, since we're copying files directly to /usr/local/include/

