use std::io;

fn main() {

    let _n = get_num();
    let mut a = read_line();
    a.sort_by(|a, b| b.cmp(a));
    let a = a;

    let mut alice: i32 = 0;
    let mut bob: i32 = 0;

    for (index, card) in a.iter().enumerate() {
        if index % 2 == 0 {
            // 1.41.0 はこれでいいけど alice += card;
            // atCoderの1.15.1はこれじゃないとあかん
            // card は &i32 型になっているから
            alice += *card;
        } else {
            bob += *card;
        }
    }

    println!("{}", alice - bob);
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
