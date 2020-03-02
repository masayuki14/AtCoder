use std::io;
fn main() {

    let mut input = String::new();
    io::stdin().read_line(&mut input)
        .expect("Failed to read line")
        ;

    let v: Vec<char> = input.chars().collect();
    let mut res = 0;
    if v[0] == '1' { res = res + 1 }
    if v[1] == '1' { res = res + 1 }
    if v[2] == '1' { res = res + 1 }

    println!("{}", res);

}
