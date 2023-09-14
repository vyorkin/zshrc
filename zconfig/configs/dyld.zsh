if [[ "$OSTYPE" == "darwin"* ]]; then
  # Capstone
  # See: http://www.capstone-engine.org/documentation.html
  export DYLD_LIBRARY_PATH="/usr/local/opt/capstone/lib":$DYLD_LIBRARY_PATH

  # For jlrs crate
  # See: https://github.com/Taaitaaiger/jlrs#macos, https://github.com/Taaitaaiger/jlrs#linux
  #
  # export DYLD_LIBRARY_PATH=/Applications/Julia-1.9.app/Contents/Resources/julia/include/julia:/Applications/Julia-1.9.app/Contents/Resources/julia/lib/julia
  # export DYLD_LIBRARY_PATH=$(which julia)/../../include/julia:$DYLD_LIBRARY_PATH
  # export JULIA_DIR="$(dirname $(dirname $(which julia)))"
  # export DYLD_LIBRARY_PATH="${JULIA_DIR}/lib:${JULIA_DIR}/lib/julia:${DYLD_LIBRARY_PATH}"

  # For argmin crate
  export DYLD_LIBRARY_PATH="/usr/local/gfortran/lib:$DYLD_LIBRARY_PATH"
fi
