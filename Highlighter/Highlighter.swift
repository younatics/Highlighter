//
//  Highlighter.swift
//  Highlighter
//
//  Created by YiSeungyoun on 2017. 5. 5..
//  Copyright © 2017년 SeungyounYi. All rights reserved.
//

import Foundation

public enum HighlighterType {
    case all
    case uiLabel
    case uiButton
    case uiTextField
    case uiTextView
}

open class Highlighter {
    open class func highlight(object: Any, at text: String, attributes: [String : Any]?, type: HighlighterType) {
        let mirror = Mirror(reflecting: object)
        for value in mirror.children {
            switch type {
            case .all:
                self.highlightUILabel(value: value.value, text: text, attributes: attributes)
                self.highlightUIButton(value: value.value, text: text, attributes: attributes)
                self.highlightUITextField(value: value.value, text: text, attributes: attributes)
                self.highlightUITextView(value: value.value, text: text, attributes: attributes)
                
            case .uiLabel:
                self.highlightUILabel(value: value.value, text: text, attributes: attributes)
                
            case .uiButton:
                self.highlightUIButton(value: value.value, text: text, attributes: attributes)
                
            case .uiTextField:
                self.highlightUITextField(value: value.value, text: text, attributes: attributes)
                
            case .uiTextView:
                self.highlightUITextView(value: value.value, text: text, attributes: attributes)
            }
        }
    }
    
    open class func highlight(object: Any, at text: String, attributes: [String : Any]?) {
        let mirror = Mirror(reflecting: object)
        for value in mirror.children {
            if let label = value.value as? UILabel, let uiLabelText = label.text {
                let highlightRanges = uiLabelText.lowercased().ranges(of: text)
                if highlightRanges.count > 0 {
                    label.attributedText = self.highlight(ranges: highlightRanges, at: text, in: uiLabelText, with: attributes)
                }
            }
        }
    }
    
    private class func highlightUITextView(value: Any, text:String, attributes: [String : Any]?) {
        if let textView = value as? UITextView, let textViewText = textView.text {
            let highlightRanges = textViewText.lowercased().ranges(of: text)
            if highlightRanges.count > 0 {
                textView.attributedText = self.highlight(ranges: highlightRanges, at: text, in: textViewText, with: attributes)
            }
        }
    }
    
    private class func highlightUITextField(value: Any, text:String, attributes: [String : Any]?) {
        if let textfield = value as? UITextField, let textfieldText = textfield.text {
            let highlightRanges = textfieldText.lowercased().ranges(of: text)
            if highlightRanges.count > 0 {
                textfield.attributedText = self.highlight(ranges: highlightRanges, at: text, in: textfieldText, with: attributes)
            }
        }
    }
    
    private class func highlightUIButton(value: Any, text:String, attributes: [String : Any]?) {
        if let button = value as? UIButton, let buttonText = button.titleLabel?.text {
            let highlightRanges = buttonText.lowercased().ranges(of: text)
            if highlightRanges.count > 0 {
                button.titleLabel?.attributedText = self.highlight(ranges: highlightRanges, at: text, in: buttonText, with: attributes)
            }
        }
    }
    
    private class func highlightUILabel(value: Any, text:String, attributes: [String : Any]?) {
        if let label = value as? UILabel, let uiLabelText = label.text {
            let highlightRanges = uiLabelText.lowercased().ranges(of: text)
            if highlightRanges.count > 0 {
                label.attributedText = self.highlight(ranges: highlightRanges, at: text, in: uiLabelText, with: attributes)
            }
        }
    }
    
    private class func highlight(ranges: [Range<String.Index>], at searchText: String, in originText: String, with attributes: [String : Any]?) -> NSAttributedString {
        let startString = originText.substring(to: ranges[0].lowerBound)
        let highlightString = NSMutableAttributedString(string: startString)
        
        if ranges.count == 1 {
            highlightString.append(self.containAttribute(originText: originText, bound: ranges[0], attributes: attributes))
            highlightString.append(self.endAttribute(originText: originText, bound: ranges[0].upperBound))
            
        } else {
            for i in 1..<ranges.count {
                highlightString.append(self.containAttribute(originText: originText, bound: ranges[i], attributes: attributes))
                highlightString.append(self.continueAttribute(originText: originText, upperBound: ranges[i-1].upperBound, lowerBound: ranges[i].lowerBound))
            }
            
            highlightString.append(self.containAttribute(originText: originText, bound: ranges[ranges.count - 1], attributes: attributes))
            highlightString.append(self.endAttribute(originText: originText, bound: ranges[ranges.count - 1].upperBound))
            
        }
        return highlightString
    }
    
    private class func continueAttribute(originText: String, upperBound: String.Index, lowerBound: String.Index) -> NSMutableAttributedString {
        let range = Range(uncheckedBounds: (upperBound, lowerBound))
        let continueString = originText.substring(with: range)
        let continueAttributeString = NSMutableAttributedString(string: continueString)
        return continueAttributeString
    }
    
    private class func containAttribute(originText: String, bound: Range<String.Index>, attributes: [String : Any]?) -> NSMutableAttributedString {
        let containedString = originText.substring(with: bound)
        let containedAttributeString = NSMutableAttributedString(string: containedString, attributes: attributes)
        return containedAttributeString
    }
    
    private class func endAttribute(originText: String, bound: String.Index) -> NSMutableAttributedString {
        let endString = originText.substring(from: bound)
        let endAttributeString = NSMutableAttributedString(string: endString)
        return endAttributeString
    }
}

private extension String {
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
