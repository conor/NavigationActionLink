import XCTest
import SwiftUI
import ViewInspector
@testable import NavigationActionLink

extension NavigationActionLink: Inspectable { }

final class NavigationActionLinkTests: XCTestCase {
    let view = NavigationActionLink(
        destination: Text("Destination")
    ) { Text("Tap") }
    
    func testButton() throws {
        XCTAssertNoThrow(try view.inspect().button().find(text: "Tap"))
    }
    
    func testNavigationLinkDestination() throws {
        let navLink = try view.inspect().button().find(navigationLink: "Destination")
        XCTAssertNoThrow(navLink)
        XCTAssertTrue(navLink.isHidden())
        XCTAssertEqual(try navLink.fixedFrame().width, 0)
        XCTAssertEqual(try navLink.fixedFrame().height, 0)
    }
    
    func testNavigationLinkLabel() throws {
        let label = try view.inspect().button().find(navigationLink: "Destination").labelView().text().string()
        XCTAssertEqual(label, "Tap")
    }
    
    static var allTests = [
        ("testButton", testButton),
        ("testNavigationLinkDestination", testNavigationLinkDestination),
        ("testNavigationLinkLabel", testNavigationLinkLabel),
    ]
}
