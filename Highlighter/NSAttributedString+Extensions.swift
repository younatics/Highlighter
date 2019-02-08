//
//  NSAttributedString+Extensions.swift
//  Highlighter
//
//  Created by YiSeungyoun on 2017. 5. 5..
//  Copyright © 2017년 SeungyounYi. All rights reserved.
//

import Foundation

extension NSAttributedString {
    static func highlight(ranges: [Range<String.Index>], at searchText: String, in originText: String, normal normalAttributes: [NSAttributedString.Key : Any]?, highlight highlightAttributes: [NSAttributedString.Key : Any]?) -> NSAttributedString {
        let startString = String(originText[..<ranges[0].lowerBound])
        let highlightString = NSMutableAttributedString(string: startString, attributes: normalAttributes)

        if ranges.count == 1 {
            highlightString.append(self.containAttribute(originText: originText, bound: ranges[0], attributes: highlightAttributes))
            highlightString.append(self.endAttribute(originText: originText, bound: ranges[0].upperBound, normalAttributes: normalAttributes))

        } else {
            for i in 1..<ranges.count {
                highlightString.append(self.containAttribute(originText: originText, bound: ranges[i], attributes: highlightAttributes))
                highlightString.append(self.continueAttribute(originText: originText, upperBound: ranges[i-1].upperBound, lowerBound: ranges[i].lowerBound, normalAttributes: normalAttributes))
            }

            highlightString.append(self.containAttribute(originText: originText, bound: ranges[ranges.count - 1], attributes: highlightAttributes))
            highlightString.append(self.endAttribute(originText: originText, bound: ranges[ranges.count - 1].upperBound, normalAttributes: normalAttributes))

        }
        return highlightString
    }

    private static func continueAttribute(originText: String, upperBound: String.Index, lowerBound: String.Index, normalAttributes: [NSAttributedString.Key : Any]?) -> NSMutableAttributedString {
        let range = Range(uncheckedBounds: (upperBound, lowerBound))
        let continueString = String(originText[range])
        let continueAttributeString = NSMutableAttributedString(string: continueString, attributes: normalAttributes)
        return continueAttributeString
    }

    private static func containAttribute(originText: String, bound: Range<String.Index>, attributes: [NSAttributedString.Key : Any]?) -> NSMutableAttributedString {
        let containedString = String(originText[bound])
        let containedAttributeString = NSMutableAttributedString(string: containedString, attributes: attributes)
        return containedAttributeString
    }

    private static func endAttribute(originText: String, bound: String.Index, normalAttributes: [NSAttributedString.Key : Any]?) -> NSMutableAttributedString {
        let endString = String(originText[bound...])
        let endAttributeString = NSMutableAttributedString(string: endString, attributes: normalAttributes)
        return endAttributeString
    }
}
