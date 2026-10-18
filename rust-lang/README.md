# Rust Container From Scratch

The `rust-lang` image is built from `scratch` Docker image. It needs a statically linked Rust binary.

1. Install the musl Target

```
rustup target add x86_64-unknown-linux-musl
```

2. Build the Static Binary

```
cargo build --release --target x86_64-unknown-linux-musl
```

3. Build the image

```
docker build -t rust-lang .       
```

5. Run the image

```
docker run rust-lang    
 ```
