:: android can use aar file https://mvnrepository.com/artifact/com.microsoft.onnxruntime/onnxruntime-android

if not exist "C:\Windows\ninja.exe" copy "win\tools\ninja.exe" "C:\Windows\ninja.exe" 

cd /D "C:\native_c_sdk"
if not exist onnxruntime_build mkdir onnxruntime_build
cd /D onnxruntime_build

if not exist onnxruntime git clone --recursive https://github.com/microsoft/onnxruntime.git
cd onnxruntime

:: reset git for build
git reset --hard
git clean -d -f
git clean -d -f -X

set ANDROID_NDK_HOME="C:\Users\Admin\AppData\Local\Android\Sdk\ndk\26.2.11394342"
set ANDROID_SDK_HOME="C:\Users\Admin\AppData\Local\Android\Sdk"

build.bat --android --android_sdk_path %ANDROID_SDK_HOME% --android_ndk_path %ANDROID_NDK_HOME% --android_abi arm64-v8a --android_api 33 --use_nnapi --skip_tests --build_shared_lib --config MinSizeRel --parallel --cmake_generator Ninja

:: optional flags: [--config Release or MinSizeRel] [--android_api 27]