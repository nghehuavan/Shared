## IOS framework build : required python and cmake
cd ~
if [ -d "onnxruntime" ]
then
  echo "skiped clone onnxruntime"
else
  git clone --recursive https://github.com/microsoft/onnxruntime.git --branch v1.19.2
fi

cd onnxruntime
git reset --hard
git clean -d -f
git clean -d -f -X

python3 tools/ci_build/github/apple/build_and_assemble_apple_pods.py --build-settings-file tools/ci_build/github/apple/default_full_ios_framework_build_settings.json
## Repack new version
## After build output will in folder onnxruntime/build/apple_framework
## Find 2 folder iphoneos and iphonesimulator which contains onnxruntime.framework
## Extract old version to new folder and rename to new version
## Copy and replace 2 folder iphoneos and iphonesimulator
## Zip folder again 


## IOS download from cocoapods.org -> "onnxruntime-mobile-c" => podspecs => find link match with version -> download -> unzip -> zip
## Android https://mvnrepository.com/artifact/com.microsoft.onnxruntime/onnxruntime-android  -> aar -> unzip -> zip
## Window https://github.com/microsoft/onnxruntime/releases -> onnxruntime-win-x64-1.19.2.zip -> unzip -> zip
## Mac https://github.com/microsoft/onnxruntime/releases -> onnxruntime-osx-universal2-1.19.2.tgz -> unzip -> zip