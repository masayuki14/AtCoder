use std::io;

fn main() {

    let input_str = get_input();
    let st: Vec<&str> = input_str.trim().split_whitespace().collect();
    let mut ab = read_line();
    let u  = get_input();

    let mut a: i32 = ab[0];
    let mut b: i32 = ab[1];
    if u.trim() == st[0] {
        a -= 1;
    } else {
        b -= 1;
    }

    println!("{} {}", a, b);
}

fn read_line() -> Vec<i32> {

    let input_str = get_input();
    let vec: Vec<&str> = input_str.trim().split_whitespace().collect();

    let mut int_vec: Vec<i32> = Vec::new();
    for v in vec {
        int_vec.push(to_i(v));
    }

    int_vec
}

fn get_num() -> i32 {
    to_i(&get_input())
}

fn to_i(s: &str) -> i32 {
    let input_num: i32 = match s.trim().parse() {
        Ok(num) => num ,
        Err(_)  => panic!("input wrong number."),
    };
    input_num
}

fn get_input() -> String {
    let mut input_str = String::new();
    io::stdin().read_line(&mut input_str)
        .expect("Failed to read line")
        ;
    input_str
}
