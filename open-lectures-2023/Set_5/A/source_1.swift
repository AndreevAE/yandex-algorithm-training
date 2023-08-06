// A. Быки и коровы

let vasyaNumber = readLine()!.compactMap { Int(String($0)) }
let petyaNumber = readLine()!.compactMap { Int(String($0)) }

func bullsAndCows(number1: [Int], number2: [Int]) -> (bulls: Int, cows: Int) {
    func digitsCount(in number: [Int]) -> [Int] {
        var digitsCount = Array(repeating: 0, count: 10)
        number.forEach {
            digitsCount[$0] += 1
        }
        return digitsCount
    }
    
    var number1DigitsCount = digitsCount(in: number1)
    var number2DigitsCount = digitsCount(in: number2)
    
    let bulls = zip(number1, number2).reduce(0) { result,  digits in
        let (digit1, digit2) = digits
        if digit1 == digit2 {
            number1DigitsCount[digit1] -= 1
            number2DigitsCount[digit2] -= 1
            return result + 1
        }
        return result
    }
    
    let cows = zip(number1DigitsCount, number2DigitsCount).reduce(0) { result, counts in
        let (digit1Count, digit2Count) = counts
        return result + min(digit1Count, digit2Count)
    }
    
    return (bulls, cows)
}

let answer = bullsAndCows(number1: vasyaNumber, number2: petyaNumber)
print(answer.bulls)
print(answer.cows)