#!/bin/bash

# Debian
# apt install build-essential pkg-config zlib1g-dev libpcre3 libpcre3-dev libbz2-dev libssl-dev tar unzip

# cd nginx && ./auto/configure \
#     --builddir=build \
#     --prefix=/usr/local
#     # https://github.com/perusio/nginx-hello-world-module
#     # --add-dynamic-module=../../nginx-rs/nginx-hello-world-module/

bindgen \
    --ctypes-prefix "libc" \
    --impl-debug \
    --whitelist-type "(?i)ngx_.*" \
    --whitelist-function "(?i)ngx_.*" \
    --whitelist-var "(?i)ngx_.*" \
    --no-recursive-whitelist \
    --no-prepend-enum-name \
    --no-layout-tests \
    ./wrapper.h > ./src/bindings.rs \
    -- \
    -I "nginx/src/core" \
    -I "nginx/src/event" \
    -I "nginx/src/event/modules" \
    -I "nginx/src/os/unix" \
    -I "nginx/src/os/win32" \
    -I "nginx/src/http" \
    -I "nginx/src/http/v2" \
    -I "nginx/src/http/modules" \
    -I "nginx/src/core" \
    -I "nginx/build"