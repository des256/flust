use wasm_bindgen::prelude::*;

#[wasm_bindgen]
pub fn do_stuff(things: Vec<u8>) -> String {
    format!("There are {} things.",things.len())
}