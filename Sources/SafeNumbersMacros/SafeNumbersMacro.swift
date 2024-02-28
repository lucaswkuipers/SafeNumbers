import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxMacros

/// `PositiveMacro` is an `ExpressionMacro` that enforces a compile-time check for positive numbers.
///
/// This macro takes a numeric value as input and ensures that the value is positive. Providing a non-positive value will result in a compilation error.
///
/// - Note: This macro understands both `Int` and `Double` types.
public struct PositiveMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) throws -> ExprSyntax {
        guard let description = node.argumentList.first?.expression.description else {
            throw NoArgumentsError()
        }

        let number: any Number
        if let integerNumber = Int(description) {
            number = integerNumber
        } else if let doubleNumber = Double(description) {
            number = doubleNumber
        } else {
            throw NotNumericError()
        }

        guard number.isPositive else {
            throw NotPositiveError()
        }

        return "\(raw: number)"
    }
}

/// `NegativeMacro` is an `ExpressionMacro` that enforces a compile-time check for negative numbers.
///
/// Similar to `PositiveMacro`, this macro takes a numeric value and ensures that it's negative. Providing a non-negative value will cause a compilation error.
///
/// - Note: This macro understands both `Int` and `Double` types.
public struct NegativeMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) throws -> ExprSyntax {
        guard let description = node.argumentList.first?.expression.description else {
            throw NoArgumentsError()
        }

        let number: any Number
        if let integerNumber = Int(description) {
            number = integerNumber
        } else if let doubleNumber = Double(description) {
            number = doubleNumber
        } else {
            throw NotNumericError()
        }

        guard number.isNegative else {
            throw NotNegativeError()
        }

        return "\(raw: number)"
    }
}


@main
struct SafeNumbersPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        PositiveMacro.self,
        NegativeMacro.self
    ]
}
