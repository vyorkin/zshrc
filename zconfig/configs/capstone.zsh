# see http://www.capstone-engine.org/documentation.html
if [[ "$OSTYPE" == "darwin"* ]]; then
  export DYLD_LIBRARY_PATH=/usr/local/opt/capstone/lib/:$DYLD_LIBRARY_PATH
fi
