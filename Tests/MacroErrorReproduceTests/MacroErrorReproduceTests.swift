//import SwiftSyntaxMacros
//import SwiftSyntaxMacrosTestSupport
//import XCTest
//
//// Macro implementations build for the host, so the corresponding module is not available when cross-compiling. Cross-compiled tests may still make use of the macro itself in end-to-end tests.
//#if canImport(MacroErrorReproduceMacros)
//import MacroErrorReproduceMacros
//
//let testMacros: [String: Macro.Type] = [
//    "stringify": StringifyMacro.self,
//]
//#endif
//
//final class MacroErrorReproduceTests: XCTestCase {
//    func testMacro() throws {
//        #if canImport(MacroErrorReproduceMacros)
//        assertMacroExpansion(
//            """
//            #stringify(a + b)
//            """,
//            expandedSource: """
//            (a + b, "a + b")
//            """,
//            macros: testMacros
//        )
//        #else
//        throw XCTSkip("macros are only supported when running tests for the host platform")
//        #endif
//    }
//
//    func testMacroWithStringLiteral() throws {
//        #if canImport(MacroErrorReproduceMacros)
//        assertMacroExpansion(
//            #"""
//            #stringify("Hello, \(name)")
//            """#,
//            expandedSource: #"""
//            ("Hello, \(name)", #""Hello, \(name)""#)
//            """#,
//            macros: testMacros
//        )
//        #else
//        throw XCTSkip("macros are only supported when running tests for the host platform")
//        #endif
//    }
//}
