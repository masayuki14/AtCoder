use std::io;

fn main() {
    let n = get_num();
    let mut points: Vec<Vec<i32>> = Vec::new();
    for _i in 0..n {
        let point = read_line();
        points.push(point);
    }

    let mut t = 0;
    let mut x = 0;
    let mut y = 0;
    let mut possibility = true;

    for i in 0..points.len() {
        if possible(points[i][0] - t, x, y, points[i][1], points[i][2]) {
            t = points[i][0];
            x = points[i][1];
            y = points[i][2];
        } else {
            possibility = false;
            break;
        }
    }

    if possibility {
        println!("Yes");
    } else {
        println!("No");
    }
}

fn possible(time: i32, from_x:i32, from_y:i32, to_x:i32, to_y:i32) -> bool {
    let need_time = (from_x - to_x).abs() + (from_y - to_y).abs();
    if need_time <= time && need_time % 2 == time % 2 {
        true
    } else {
        false
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
