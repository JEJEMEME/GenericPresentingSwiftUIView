import XCTest
import SwiftUI
@testable import GenericPresentingSwiftUIView

final class GenericPresentingSwiftUIViewTests: XCTestCase {
    func testExample() throws {
        // XCTest Documentation
        // https://developer.apple.com/documentation/xctest

        if #available(iOS 13.0, *) {
            var view = GenericPresentingSwiftUIView<AnyView>()
            view.show(content: AnyView(Text("dasd")))
        } else {
            // Fallback on earlier versions
        }
        
        
        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
    }
}
