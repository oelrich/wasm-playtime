function update_app(offset, length) {
  var bytes = new Uint8Array(memory.buffer, offset, length);
  var string = new TextDecoder("utf8").decode(bytes);
  console.log(string);
}
var memory = new WebAssembly.Memory({ initial: 1 });
var import_object = { console: { log: update_app }, js: { mem: memory } };

(async () => {
  /*
  This slightly cumbersome instantiation of the WASM object
  is required to cope with a problem in Nginx regarding MIME.
  */
  const response = await fetch("modules/main.wasm");
  const buffer = await response.arrayBuffer();
  // Initiating the WASM module starts the designated function.
  const obj = await WebAssembly.instantiate(buffer, import_object);
  // Finally we can run an exported function.
  obj.instance.exports.party_popper();
})();