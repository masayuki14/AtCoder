extern crate regex;
use regex::Regex;
use std::io;

fn main() {

    let s = get_input();
    let re = Regex::new("(dreamer|eraser|dream|erase)+").unwrap();

    if re.is_match(&s) {
        println!("YES");
    } else {
        println!("NO");
    }
}


fn get_input() -> String {
    let mut input_str = String::new();
    io::stdin().read_line(&mut input_str)
        .expect("Failed to read line")
        ;
    input_str
}
