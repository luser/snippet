use std::{thread, time};

fn main() {
    let delay = time::Duration::from_millis(10);
    for i in 0..10 {
        thread::sleep(delay);
        println!("Output {}", i);
        eprintln!("Error {}", i);
    }
}
