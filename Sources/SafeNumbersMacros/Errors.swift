struct NoArgumentsError: Error, CustomStringConvertible {
    var description: String = "Missing macro argument (expected positive numeric literal)"
}

struct NotNumericError: Error, CustomStringConvertible {
    var description: String = "Argument to macro must be a number literal"
}

struct NotPositiveError: Error, CustomStringConvertible {
    var description: String = "Argument to macro must be positive numeric literal"
}

struct NotNegativeError: Error, CustomStringConvertible {
    var description: String = "Argument to macro must be negative numeric literal"
}
