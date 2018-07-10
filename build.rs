extern crate cc;

fn main() {
    cc::Build::new()
        .file("test.cpp")
        .compile("test");
}
