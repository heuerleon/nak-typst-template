fn main() {
    let mut numbers = vec![1, 2, 3, 4, 5];
    
    for number in &mut numbers {
        *number *= 2;
    }
    
    let sum: i32 = numbers.iter().sum();
    println!("The sum of doubled numbers is: {}", sum);
    
    let squared_numbers: Vec<i32> = numbers.iter().map(|&x| x * x).collect();
    println!("Squared numbers: {:?}", squared_numbers);
    
    let filtered_numbers: Vec<i32> = numbers.iter().filter(|&&x| x > 5).cloned().collect();
    println!("Filtered numbers (greater than 5): {:?}", filtered_numbers);
    
    let average = sum as f64 / numbers.len() as f64;
    println!("The average is: {}", average);
    
    let mut counter = 0;
    while counter < 5 {
        println!("Counter is at: {}", counter);
        counter += 1;
    }
    
    let result = factorial(5);
    println!("Factorial of 5 is: {}", result);
}

fn factorial(n: u32) -> u32 {
    if n == 0 {
        1
    } else {
        n * factorial(n - 1)
    }
}