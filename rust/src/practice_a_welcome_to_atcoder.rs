use std::io;

fn main() {

    let mut a = String::new();
    io::stdin().read_line(&mut a)
        .expect("Failed to read line")
        ;
    let a: i32 = match a.trim().parse() {
        Ok(num) => num,
        Err(_)  => panic!(""),
    };

    let mut bc = String::new();
    io::stdin().read_line(&mut bc)
        .expect("Failed to read line")
        ;

    let bc_v: Vec<&str> = bc.split(" ").collect();
    let b: i32 = match bc_v[0].trim().parse() {
        Ok(num) => num,
        Err(_)  => panic!(""),
    };
    let c: i32 = match bc_v[1].trim().parse() {
        Ok(num) => num,
        Err(_)  => panic!(""),
    };

    let mut s = String::new();
    io::stdin().read_line(&mut s)
        .expect("Failed to read line")
        ;

    println!("{} {}", a + b + c, s.trim());
}
