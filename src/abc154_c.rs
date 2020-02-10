use std::io;
use std::collections::HashSet;

fn main() {

    let n: i32 = get_num();
    let mut a: Vec<i32> = read_line();
    let len = a.len();
    let uniq: HashSet<i32> = a.into_iter().collect();

    if len == uniq.len() {
        println!("YES");
    } else {
        println!("NO");
    }
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
