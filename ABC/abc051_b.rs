// AtCoder Beginner Contest 051
// B - Sum of Three Integers
// https://atcoder.jp/contests/abc051/tasks/abc051_b
fn main() {

    let nm = read_line();
    let k:i32 = nm[0];
    let s:i32 = nm[1];
    let mut count = 0;

    for x in 0..(k + 1) {
        if x > s { continue; }
        let mut yk = k - x;
        if yk < k  { yk = k; }
        for y in 0..(yk + 1) {
            if y > s || y + x > s { continue; }
            let z = s - x - y;
            if  z <= k { count = count + 1; }
        }
    }

    println!("{}", count);
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
    std::io::stdin().read_line(&mut input_str)
        .expect("Failed to read line")
        ;
    input_str
}
