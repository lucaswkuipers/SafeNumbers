/// A compile-time constraint that ensures a given value is positive.
///
/// When creating a `Positive` macro, you pass a generic `Number` that conforms to Numeric.
/// The compiler will then prevent any attempt to create a `Positive` instance with a non-positive value, returning an error.
///
/// ## Topics
/// ### Creating Positive Numbers
/// - ``Positive``
///
/// ## Example
///
/// ```swift
/// import SafeNumbers
///
/// let positiveInteger = #Positive(42)
/// print(positiveInteger) // prints 42
/// assert(positiveInteger == 42)
///
/// let positiveDouble = #Positive(123.456)
/// print(positiveDouble) // prints 123.456
/// assert(positiveDouble == 123.456)
/// ```
///
/// - Warning: Trying to pass negative or zero values will cause a compile-time error.
@freestanding(expression)
public macro Positive<Number: Numeric>(_ value: Number) -> Number = #externalMacro(module: "SafeNumbersMacros", type: "PositiveMacro")

/// A compile-time constraint that ensures a given value is negative.
///
/// When creating a `Negative` macro, you pass a generic `Number` that conforms to Numeric.
/// The compiler will then prevent any attempt to create a `Negative` instance with a non-negative value, returning an error.
///
/// ## Topics
/// ### Creating Negative Numbers
/// - ``Negative``
///
/// ## Example
///
/// ```swift
/// import SafeNumbers
///
/// let negativeInteger = #Negative(-42)
/// print(negativeInteger) // prints -42
/// assert(negativeInteger == -42)
///
/// let negativeDouble = #Negative(-123.456)
/// print(negativeDouble) // prints -123.456
/// assert(negativeDouble == -123.456)
/// ```
///
/// - Warning: Trying to pass positive or zero values will cause a compile-time error.
@freestanding(expression)
public macro Negative<Number: Numeric>(_ value: Number) -> Number = #externalMacro(module: "SafeNumbersMacros", type: "NegativeMacro")
