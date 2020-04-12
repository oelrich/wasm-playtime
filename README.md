# WASM-Playtime

> Laughter arises from a certain fundamental absurdity.

This is a collection of little programs written in [WASM](https://webassembly.org/) to explore and demonstrate possibilities with that format.

---

* To build [WABT](https://github.com/WebAssembly/wabt) is needed. More specifically `wat2wasm`.
* It also helps to have `docker` to be able to run `docker run -p 8080:80 -v /path/to/wasm-playtime/dist:/usr/share/nginx/html nginx` and get the stuff in `./dist` served on [localhost](http://localhost:8080).
