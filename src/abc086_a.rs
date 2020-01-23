use std::io;

fn main() {

    let mut input_str = String::new();
    io::stdin().read_line(&mut input_str)
        .expect("Failed to read line")
        ;

    // let input_numbers = split_input(&input_str);

    let vec: Vec<&str> = input_str.split(" ").collect();

    let mut int_vec: Vec<i32> = Vec::new();
    for v in vec {
        //int_vec.push(
        let input_num: i32 = match v.trim().parse() {
            Ok(num) => num ,
            Err(_)  => panic!("input wrong number."),
        };

        int_vec.push(input_num);
    }

    if int_vec[0] * int_vec[1] % 2 == 0 {
        println!("Even");
    } else {
        println!("Odd");
    }
}

