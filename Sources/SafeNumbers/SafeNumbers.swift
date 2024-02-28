@freestanding(expression)
public macro Positive<Number: Numeric>(_ value: Number) -> Number = #externalMacro(module: "SafeNumbersMacros", type: "PositiveMacro")

@freestanding(expression)
public macro Negative<Number: Numeric>(_ value: Number) -> Number = #externalMacro(module: "SafeNumbersMacros", type: "NegativeMacro")
