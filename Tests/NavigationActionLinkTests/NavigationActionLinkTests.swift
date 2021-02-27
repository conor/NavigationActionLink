import XCTest
import SwiftUI

@testable import NavigationActionLink

final class NavigationActionLinkTests: XCTestCase {
    let view = NavigationActionLink(
        destination: Text("Destination")
    ) { Text("Tap") }
    
    func testButton() throws {
    }
    
    func testNavigationLinkDestination() throws {
    }
    
    func testNavigationLinkLabel() throws {
    }
    
    static var allTests = [
        ("testButton", testButton),
        ("testNavigationLinkDestination", testNavigationLinkDestination),
        ("testNavigationLinkLabel", testNavigationLinkLabel),
    ]
}
