extension String {
    public func sortString() -> String {
        var lowercased = ""
        var uppercased = ""
        var evens = ""
        var odds = ""
        var symbols = ""
        
        let arrayString = Array(self)
        
        arrayString.forEach { element in
            if element.isLowercase {
                lowercased.append(element)
            } else if element.isUppercase {
                uppercased.append(element)
            } else if element.isNumber {
                guard let number = Int(String(element)) else { return }
                if (number % 2) != 0 {
                    odds.append(element)
                } else {
                    evens.append(element)
                }
            } else {
                symbols.append(element)
            }
        }
        return lowercased + uppercased + (odds + evens) + symbols
    }
}

