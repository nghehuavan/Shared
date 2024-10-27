cd ~
if [ -d "tensorflow" ]
then
  echo "skiped clone tensorflow"
else
  git clone --recursive  --branch v2.11.0 --single-branch https://github.com/tensorflow/tensorflow.git tensorflow

fi

cd tensorflow
git reset --hard
git clean -d -f
git clean -d -f -X

./configure

bazel build -c opt  //tensorflow/lite/c:libtensorflowlite_c.dylib