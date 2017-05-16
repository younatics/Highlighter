//
//  String+Extensions.swift
//  Highlighter
//
//  Created by YiSeungyoun on 2017. 5. 5..
//  Copyright © 2017년 SeungyounYi. All rights reserved.
//

import Foundation

extension String {
    func ranges(of string: String, options: CompareOptions = .literal) -> [Range<Index>] {
        let lowerCaseString = string.lowercased()
        var result: [Range<Index>] = []
        var start = startIndex
        while let range = range(of: lowerCaseString, options: options, range: start..<endIndex) {
            result.append(range)
            start = range.upperBound
        }
        return result
    }
}
