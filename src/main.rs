extern "C" {
    fn foo() -> bool;
}

fn main() {
    println!("{}", unsafe { foo() });
}
