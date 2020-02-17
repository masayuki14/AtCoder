use std::io;

fn main() {
    let v = read_line();
    if v[0] == v[1] && v[0] != v[2] { return println!("Yes"); }
    if v[1] == v[2] && v[0] != v[2] { return println!("Yes"); }
    if v[0] == v[2] && v[0] != v[1] { return println!("Yes"); }
    println!("No");
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
