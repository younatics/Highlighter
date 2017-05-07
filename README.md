# Highlighter
[![Version](https://img.shields.io/cocoapods/v/Highlighter.svg?style=flat)](http://cocoapods.org/pods/Highlighter)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/younatics/Highlighter/blob/master/LICENSE)
[![Build Status](https://travis-ci.org/younatics/Highlighter.svg?branch=master)](https://travis-ci.org/younatics/Highlighter)
[![Platform](https://img.shields.io/cocoapods/p/Highlighter.svg?style=flat)](http://cocoapods.org/pods/Highlighter)
[![Swift 3.0](https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat)](https://developer.apple.com/swift/)

#### ✨[Listed 2nd on trending open source and 3rd on trending developer in Github Swift category [05/06/2017]](https://github.com/younatics/Highlighter/blob/master/Images/2nd.png)

## Updates
See [CHANGELOG](https://github.com/younatics/Highlighter/blob/master/CHANGELOG.md) for details

## Intoduction
🖍 Highlight whatever you want! `Highlighter` will magically find UI objects such as `UILabel`, `UITextView`, `UITexTfield`, `UIButton` in your `UITableViewCell` or other `Class`.
#### See [YNSearch](https://github.com/younatics/YNSearch) for advanced usage

![demo](Images/Highlighter.gif)

## Requirements

`Highlighter` is written in Swift 3. Compatible with iOS 8.0+

## Installation

### Cocoapods

Highlighter is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Highlighter'
```
### Carthage
```
github "younatics/Highlighter"
```

## Usage
Set object(`Any`), text (`String`), attributes (`[String : Any]?`). This method will find every text in your `[UILabel]` and highlight them
```swift
Highlighter.highlight(object: Any, at: String, normal: attributes, highlight: attributes)
```

or you can also set type(`HighlighterType`)
```swift
Highlighter.highlight(object: Any, at: String, normal: attributes, highlight: attrib, type: HighlighterType)
```

## Examples
```swift
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
guard let cell = self.ynSearchListViewDelegate?.ynSearchListView(tableView, cellForRowAt: indexPath) as? SearchViewCell else { return UITableViewCell() }
            
  if let changedText = ynSearchTextFieldText {
    Highlighter.highlight(object: cell, at: changedText, normal: nil, highlight: [NSBackgroundColorAttributeName: UIColor.yellow])
    }
  return cell
  }
}
```

## References
#### Please tell me or make pull request if you use this library in your application :) 

## Author
[younatics 🇰🇷](http://younatics.github.io)

## License
Highlighter is available under the MIT license. See the LICENSE file for more info.
