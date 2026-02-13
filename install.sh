
echo "Building for platform: $BUILDPLATFORM"

if [ $BUILDPLATFORM == "linux/amd64" ]; then

  # we can copy the WSTP development files from the official image to our custom image, 
  # so that they are available for development without needing to install the full Wolfram Engine in the custom image. 
  # This is useful for users who want to use the WSTP development files without needing to install the full Wolfram Engine 
  # in their custom image. For the amd64 architecture, things are more straightforward, as the WSTP development files are
  # available in the official image. For the arm64 architecture, we need to copy the WSTP development files from the official 
  # image to our custom image, as they are not available in the official image for arm64.
  sudo mkdir -p /usr/local/include/amd64
  sudo mkdir -p /usr/local/lib/amd64
  sudo cp /usr/local/Wolfram/WolframEngine/${WE_VERSION}/SystemFiles/Links/WSTP/DeveloperKit/Linux-x86-64/CompilerAdditions/wstp.h /usr/local/include/amd64/
  sudo cp /usr/local/Wolfram/WolframEngine/${WE_VERSION}/SystemFiles/Links/WSTP/DeveloperKit/Linux-x86-64/CompilerAdditions/libWSTP64i4.so /usr/local/lib/amd64/
  sudo cp /usr/local/include/amd64/wstp.h /usr/local/include/
  sudo cp /usr/local/lib/amd64/libWSTP64i4.so /usr/local/lib/  
else
  apt-get update && apt-get upgrade -y && apt-get install -y build-essential ca-certificates
  # yes | apt-get install -y ./wolfram-engine_14.3.0+202510021899_arm64.deb
  cp /opt/Wolfram/WolframEngine/14.3/SystemFiles/Links/WSTP/DeveloperKit/Linux-ARM64/CompilerAdditions/wstp.h /usr/local/include/
  cp /opt/Wolfram/WolframEngine/14.3/SystemFiles/Links/WSTP/DeveloperKit/Linux-ARM64/CompilerAdditions/libWSTP64i4.so /usr/local/lib/amd64/
fi

rm -rf /usr/local/include/amd64 # Remove the directory if it exists, since we're copying files directly to /usr/local/include/

