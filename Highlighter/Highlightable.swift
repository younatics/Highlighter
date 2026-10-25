//
//  Highlightable.swift
//  Highlighter
//
//  Created by Ian Keen on 2017-05-16.
//  Copyright © 2017 SeungyounYi. All rights reserved.
//

import Foundation

@MainActor
public protocol Highlightable: AnyObject {
    var textValue: String? { get }
    var attributedTextValue: NSAttributedString? { get set }

    func highlight(text: String, normal normalAttributes: [NSAttributedString.Key : Any]?, highlight highlightAttributes: [NSAttributedString.Key : Any]?)
}

extension Highlightable {
    public func highlight(text: String, normal normalAttributes: [NSAttributedString.Key : Any]?, highlight highlightAttributes: [NSAttributedString.Key : Any]?) {
        guard let inputText = self.textValue else { return }

        let highlightRanges = inputText.ranges(of: text)

        guard !highlightRanges.isEmpty else {
            // Nothing matches (or the query is empty): show the text with the normal attributes
            // instead of leaving the previous query's highlight on screen.
            self.attributedTextValue = NSAttributedString(string: inputText, attributes: normalAttributes)
            return
        }

        self.attributedTextValue = NSAttributedString.highlight(
            ranges: highlightRanges,
            at: text,
            in: inputText,
            normal: normalAttributes,
            highlight: highlightAttributes
        )
    }
}
