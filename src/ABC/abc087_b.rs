use std::io;

fn main() {

    let a500 = get_num();
    let b100 = get_num();
    let c50  = get_num();
    let x    = get_num();
    let mut pattern = 0;

    'top: for i in 0..(a500 + 1) {
        if i*500 > x { continue; }

        'middle: for j in 0..(b100 + 1) {
            if i*500 + j*100 > x { continue 'top; }

            for k in 0..(c50 + 1) {
                if 500*i + 100*j + 50*k > x { continue 'middle; }
                if 500*i + 100*j + 50*k == x {
                    pattern += 1;
                }
            }
        }
    }

    println!("{}", pattern);
}


fn get_num() -> i32 {

    let mut input_str = String::new();
    io::stdin().read_line(&mut input_str)
        .expect("Failed to read line")
        ;

    let input_num: i32 = match input_str.trim().parse() {
        Ok(num) => num ,
        Err(_)  => panic!("input wrong number."),
    };

    input_num
}
