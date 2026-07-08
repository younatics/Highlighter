//
//  HighlighterTests.swift
//  HighlighterTests
//
//  Deterministic unit tests for Highlighter's matching and attribute logic, plus
//  an end-to-end check that a UILabel receives the highlight attributes. These
//  run headlessly on the simulator.
//

import XCTest
import UIKit
@testable import Highlighter

@MainActor
final class HighlighterTests: XCTestCase {

    func testRangesFindsAllOccurrences() {
        let ranges = "hello world hello".ranges(of: "hello")
        XCTAssertEqual(ranges.count, 2)
    }

    func testRangesIsCaseInsensitiveByDefault() {
        let ranges = "Hello HELLO hello".ranges(of: "hello")
        XCTAssertEqual(ranges.count, 3)
    }

    func testRangesEmptyWhenNoMatch() {
        XCTAssertTrue("abcdef".ranges(of: "zzz").isEmpty)
    }

    func testNSAttributedStringHighlightPreservesOriginalText() {
        let origin = "hello world hello"
        let ranges = origin.ranges(of: "hello")
        let result = NSAttributedString.highlight(
            ranges: ranges,
            at: "hello",
            in: origin,
            normal: [.foregroundColor: UIColor.black],
            highlight: [.foregroundColor: UIColor.red]
        )
        XCTAssertEqual(result.string, origin)
    }

    func testUILabelHighlightAppliesHighlightColorToMatches() {
        let label = UILabel()
        label.text = "hello world hello"
        label.highlight(
            text: "hello",
            normal: [.foregroundColor: UIColor.black],
            highlight: [.foregroundColor: UIColor.red]
        )

        let attributed = try? XCTUnwrap(label.attributedTextValue)
        XCTAssertEqual(attributed?.string, "hello world hello")

        // First run ("hello") should be highlighted red...
        let firstColor = attributed?.attribute(.foregroundColor, at: 0, effectiveRange: nil) as? UIColor
        XCTAssertEqual(firstColor, .red)
        // ...and the gap ("world") should stay the normal color.
        let gapColor = attributed?.attribute(.foregroundColor, at: 6, effectiveRange: nil) as? UIColor
        XCTAssertEqual(gapColor, .black)
    }

    func testUITextFieldConformsAndExposesText() {
        let field = UITextField()
        field.text = "searchable"
        XCTAssertEqual(field.textValue, "searchable")
    }
}
