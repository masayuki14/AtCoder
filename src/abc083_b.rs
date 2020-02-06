use std::io;

fn main() {
    let nums = read_line();
    let n = nums[0];
    let a = nums[1];
    let b = nums[2];

    let mut sum = 0;

    for i in 1..(n+1) {
        let digit_sum = digit_sum(i);
        if digit_sum >= a && digit_sum <= b {
            sum += i;
        }
    }

    println!("{}", sum);
}

fn digit_sum(x: i32) -> i32 {
    if x < 10 {
        x
    } else {
        digit_num(x) + digit_sum(x/10)
    }
}

fn digit_num(x: i32) -> i32 {
    // x % 10 modで余り取ればいいじゃん
    x - (x / 10) * 10
}

fn read_line() -> Vec<i32> {

    let mut input_str = String::new();
    io::stdin().read_line(&mut input_str)
        .expect("Failed to read line")
        ;

    let vec: Vec<&str> = input_str.split(" ").collect();

    let mut int_vec: Vec<i32> = Vec::new();
    for v in vec {
        let input_num: i32 = match v.trim().parse() {
            Ok(num) => num ,
            Err(_)  => panic!("input wrong number."),
        };

        int_vec.push(input_num);
    }

    let int_vec = int_vec;
    int_vec
}
