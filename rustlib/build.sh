# delete existing package code
rm pkg/*

# compile Rust code
cargo build --release --target wasm32-unknown-unknown

# create WASM bindings
wasm-bindgen --out-dir pkg --no-typescript --target web target/wasm32-unknown-unknown/release/rustlib.wasm

# copy JS and WASM code to output directory
cp pkg/rustlib_bg.wasm ../web
cp pkg/rustlib.js ../web
