use std::io;

fn main() {
    let inputs = read_line();
    let num = inputs[0];
    let yen = inputs[1];

    let mut done = false;

    let mut x_max = yen / 10000;
    if x_max > num {
        x_max = num
    }

    'top: for i in 0..(x_max+1) {
        let x = x_max - i;
        let y_max = num - x;

        for j in 0..(y_max+1) {
            let y = y_max - j;
            let z = num - x - y;

            let sum_yen = x*10000 + y*5000 + z*1000;
            if yen == sum_yen {
                println!("{} {} {}", x, y, z);
                done = true;
                break 'top;
            }
        }
    }

    if done == false { println!("-1 -1 -1"); }
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
