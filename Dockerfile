FROM alpine

RUN apk add --no-cache git && \
    apk add --no-cache cmake make gcc g++  && \
    cd /usr/local/share && \
    git clone https://github.com/WebAssembly/binaryen.git && \
    cd binaryen && \
    git checkout version_11 && \
    git checkout 04fa143e85bc870c80c50aa57cdbce833df0aa2d CMakeLists.txt && \
    cmake . && make && \
    apk del git && \
    apk del cmake make g++ #Leave gcc for dependent libs

ENV PATH $PATH:/usr/local/share/binaryen/bin

ENTRYPOINT asm2wasm
