import SafeNumbers

// MARK: - Positive

let positiveInteger = #Positive(42)
print(positiveInteger)
assert(positiveInteger == 42)

let positiveDouble = #Positive(123.456)
print(positiveDouble)
assert(positiveDouble == 123.456)

//// Fails to compile:
//let negativeInteger = #Positive(-42)
//let negativeDouble = #Positive(-123.456)
//let zeroInteger = #Positive(0)
//let zeroDouble = #Positive(0.0)

// MARK: - Negative

let negativeInteger = #Negative(-42)
print(negativeInteger)
assert(negativeInteger == -42)

let negativeDouble = #Negative(-123.456)
print(negativeDouble)
assert(negativeDouble == -123.456)

//// Fails to compile:
//let positiveInteger = #Negative(42)
//let positiveDouble = #Negative(123.456)
//let zeroInteger = #Negative(0)
//let zeroDouble = #Negative(0.0)
