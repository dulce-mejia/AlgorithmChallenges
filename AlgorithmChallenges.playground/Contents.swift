
//MARK:- Title: Alphanumeric String Sort
/***Description:
Taking a string as input sort the string characters with the following rules:
Numbers go after Letters
Uppercase letters go after Lowercase
Odd numbers go before Even numbers
Any character that is not a letter or number should go after the letters and numbers*/

let result = "eCb4®D9c7.8".sortString()
print(result)

extension String {
    func sortString() -> String {
        let stringArray = Array(self)
        var lowercased = ""
        var uppercased = ""
        var numbers = ""
        var symbols = ""
        stringArray.forEach { element in
            if element.isLowercase {
                lowercased.append(element)
            } else if element.isUppercase {
                uppercased.append(element)
            } else if element.isNumber {
                guard let number = Int(String(element)) else { return }
                if number % 2 != 0 {
                    numbers.insert(element, at: numbers.startIndex)
                } else {
                    numbers.append(element)
                }
            } else {
                symbols.append(element)
            }
        }
        return lowercased + uppercased + numbers + symbols
    }
}


