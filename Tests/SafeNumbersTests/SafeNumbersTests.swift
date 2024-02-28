import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest

// Macro implementations build for the host, so the corresponding module is not available when cross-compiling. Cross-compiled tests may still make use of the macro itself in end-to-end tests.
#if canImport(SafeNumbersMacros)
import SafeNumbersMacros

let testMacros: [String: Macro.Type] = [
    "Positive": PositiveMacro.self,
    "Negative": NegativeMacro.self,
]
#endif

final class SafeNumbersTests: XCTestCase {
    func test_positiveMacro_whenPositiveIntegerLiteralArgument_evaluatesCorrectly() throws {
#if canImport(SafeNumbersMacros)
        assertMacroExpansion(
            """
            #Positive(1)
            """,
            expandedSource: """
            1
            """,
            macros: testMacros
        )
#else
        throw XCTSkip("macros are only supported when running tests for the host platform")
#endif
    }

    func test_positiveMacro_whenPositiveDoubleLiteralArgument_evaluatesCorrectly() throws {
#if canImport(SafeNumbersMacros)
        assertMacroExpansion(
            """
            #Positive(1.234)
            """,
            expandedSource: """
            1.234
            """,
            macros: testMacros
        )
#else
        throw XCTSkip("macros are only supported when running tests for the host platform")
#endif
    }

    func test_positiveMacro_whenNegativeIntegerLiteralArgument_throwsNotPositiveError() throws {
#if canImport(SafeNumbersMacros)
        assertMacroExpansion(
            """
            #Positive(-1)
            """,
            expandedSource: """
            #Positive(-1)
            """,
            diagnostics: [
                .init(
                    message: "Argument to macro must be positive numeric literal",
                    line: 1,
                    column: 1,
                    severity: .error
                )
            ],
            macros: testMacros
        )
#else
        throw XCTSkip("macros are only supported when running tests for the host platform")
#endif
    }

    func test_positiveMacro_whenNegativeDoubleLiteralArgument_throwsNotPositiveError() throws {
#if canImport(SafeNumbersMacros)
        assertMacroExpansion(
            """
            #Positive(-1.234)
            """,
            expandedSource: """
            #Positive(-1.234)
            """,
            diagnostics: [
                .init(
                    message: "Argument to macro must be positive numeric literal",
                    line: 1,
                    column: 1,
                    severity: .error
                )
            ],
            macros: testMacros
        )
#else
        throw XCTSkip("macros are only supported when running tests for the host platform")
#endif
    }

    func test_positiveMacro_whenZeroIntegerLiteralArgument_throwsNotPositiveError() throws {
#if canImport(SafeNumbersMacros)
        assertMacroExpansion(
            """
            #Positive(0)
            """,
            expandedSource: """
            #Positive(0)
            """,
            diagnostics: [
                .init(
                    message: "Argument to macro must be positive numeric literal",
                    line: 1,
                    column: 1,
                    severity: .error
                )
            ],
            macros: testMacros
        )
#else
        throw XCTSkip("macros are only supported when running tests for the host platform")
#endif
    }

    func test_positiveMacro_whenZeroDoubleLiteralArgument_throwsNotPositiveError() throws {
#if canImport(SafeNumbersMacros)
        assertMacroExpansion(
            """
            #Positive(0.0)
            """,
            expandedSource: """
            #Positive(0.0)
            """,
            diagnostics: [
                .init(
                    message: "Argument to macro must be positive numeric literal",
                    line: 1,
                    column: 1,
                    severity: .error
                )
            ],
            macros: testMacros
        )
#else
        throw XCTSkip("macros are only supported when running tests for the host platform")
#endif
    }

    func test_positiveMacro_whenNotNumericLiteralArgument_throwsNotNumericError() throws {
#if canImport(SafeNumbersMacros)
        assertMacroExpansion(
            """
            #Positive("something")
            """,
            expandedSource: """
            #Positive("something")
            """,
            diagnostics: [
                .init(
                    message: "Argument to macro must be a number literal",
                    line: 1,
                    column: 1,
                    severity: .error
                )
            ],
            macros: testMacros
        )
#else
        throw XCTSkip("macros are only supported when running tests for the host platform")
#endif
    }

    func test_negativeMacro_whenNegativeIntegerLiteralArgument_evaluatesCorrectly() throws {
#if canImport(SafeNumbersMacros)
        assertMacroExpansion(
            """
            #Negative(-1)
            """,
            expandedSource: """
            -1
            """,
            macros: testMacros
        )
#else
        throw XCTSkip("macros are only supported when running tests for the host platform")
#endif
    }

    func test_negativeMacro_whenNegativeDoubleLiteralArgument_evaluatesCorrectly() throws {
#if canImport(SafeNumbersMacros)
        assertMacroExpansion(
            """
            #Negative(-1.234)
            """,
            expandedSource: """
            -1.234
            """,
            macros: testMacros
        )
#else
        throw XCTSkip("macros are only supported when running tests for the host platform")
#endif
    }

    func test_negativeMacro_whenPositiveIntegerLiteralArgument_throwsNotNegativeError() throws {
#if canImport(SafeNumbersMacros)
        assertMacroExpansion(
            """
            #Negative(1)
            """,
            expandedSource: """
            #Negative(1)
            """,
            diagnostics: [
                .init(
                    message: "Argument to macro must be negative numeric literal",
                    line: 1,
                    column: 1,
                    severity: .error
                )
            ],
            macros: testMacros
        )
#else
        throw XCTSkip("macros are only supported when running tests for the host platform")
#endif
    }

    func test_negativeMacro_whenPositiveDoubleLiteralArgument_throwsNotNegativeError() throws {
#if canImport(SafeNumbersMacros)
        assertMacroExpansion(
            """
            #Negative(1.234)
            """,
            expandedSource: """
            #Negative(1.234)
            """,
            diagnostics: [
                .init(
                    message: "Argument to macro must be negative numeric literal",
                    line: 1,
                    column: 1,
                    severity: .error
                )
            ],
            macros: testMacros
        )
#else
        throw XCTSkip("macros are only supported when running tests for the host platform")
#endif
    }

    func test_negativeMacro_whenZeroIntegerLiteralArgument_throwsNotNegativeError() throws {
#if canImport(SafeNumbersMacros)
        assertMacroExpansion(
            """
            #Negative(0)
            """,
            expandedSource: """
            #Negative(0)
            """,
            diagnostics: [
                .init(
                    message: "Argument to macro must be negative numeric literal",
                    line: 1,
                    column: 1,
                    severity: .error
                )
            ],
            macros: testMacros
        )
#else
        throw XCTSkip("macros are only supported when running tests for the host platform")
#endif
    }

    func test_negativeMacro_whenZeroDoubleLiteralArgument_throwsNotNegativeError() throws {
#if canImport(SafeNumbersMacros)
        assertMacroExpansion(
            """
            #Negative(0.0)
            """,
            expandedSource: """
            #Negative(0.0)
            """,
            diagnostics: [
                .init(
                    message: "Argument to macro must be negative numeric literal",
                    line: 1,
                    column: 1,
                    severity: .error
                )
            ],
            macros: testMacros
        )
#else
        throw XCTSkip("macros are only supported when running tests for the host platform")
#endif
    }

    func test_negativeMacro_whenNotNumericLiteralArgument_throwsNotNumericError() throws {
#if canImport(SafeNumbersMacros)
        assertMacroExpansion(
            """
            #Negative("something")
            """,
            expandedSource: """
            #Negative("something")
            """,
            diagnostics: [
                .init(
                    message: "Argument to macro must be a number literal",
                    line: 1,
                    column: 1,
                    severity: .error
                )
            ],
            macros: testMacros
        )
#else
        throw XCTSkip("macros are only supported when running tests for the host platform")
#endif
    }
}
