use std::io;

fn main() {
    let n = get_num();
    let mut d: Vec<i32> = Vec::new();
    for _i in 0..n {
        d.push(get_num());
    }

    d.sort_by(|a, b| b.cmp(a));
    let mut step: Vec<i32> = Vec::new();

    let mut current = d[0];
    step.push(current);

    for num in d {
        if current > num {
            step.push(num);
            current = num;
        }
    }

    println!("{}", step.len());
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
