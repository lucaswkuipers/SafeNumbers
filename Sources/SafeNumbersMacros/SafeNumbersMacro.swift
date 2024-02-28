import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxMacros

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
