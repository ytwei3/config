export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# JAVA
export JAVA_HOME="/opt/homebrew/opt/openjdk@17"
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"

# GO
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$PATH"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# C++ configuration
# export PATH="/opt/homebrew/include:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export LLVM_ROOT="/opt/homebrew/opt/llvm"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib/c++ -Wl,-rpath,/opt/homebrew/opt/llvm/lib/c++"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

cc="/opt/homebrew/opt/llvm/bin/clang"
cxx="/opt/homebrew/opt/llvm/bin/clang++"

