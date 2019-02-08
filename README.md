# Highlighter
[![Awesome](https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg)](https://github.com/sindresorhus/awesome)
[![Version](https://img.shields.io/cocoapods/v/Highlighter.svg?style=flat)](http://cocoapods.org/pods/Highlighter)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/younatics/Highlighter/blob/master/LICENSE)
[![Build Status](https://travis-ci.org/younatics/Highlighter.svg?branch=master)](https://travis-ci.org/younatics/Highlighter)
[![Platform](https://img.shields.io/cocoapods/p/Highlighter.svg?style=flat)](http://cocoapods.org/pods/Highlighter)
[![Swift 4.2](https://img.shields.io/badge/Swift-4.2-orange.svg?style=flat)](https://developer.apple.com/swift/)

## Updates
See [CHANGELOG](https://github.com/younatics/Highlighter/blob/master/CHANGELOG.md) for details

## Intoduction
🖍 Highlight whatever you want! `Highlighter` will magically find UI objects such as `UILabel`, `UITextView`, `UITexTfield`, `UIButton` in your `UITableViewCell` or other `Class`.
#### See [YNSearch](https://github.com/younatics/YNSearch) for advanced usage

![demo](Images/Highlighter.gif)

## Requirements

`Highlighter` is written in Swift 4.2. Compatible with iOS 9.0+

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
You can search any `UIView` using `view.highlight(text:normal:highlight:type:)` 
It will search subviews for the provided `text` and highlight them using the attributes provided.

To search _all_ supported subview use:
```swift
view.highlight(text: "Foo", normal: normalAttributes, highlight: highlightedAttributes)
```

or you can limit the search to a single type using:
```swift
view.highlight(text: "Foo", normal: normalAttributes, highlight: highlightedAttributes, type: UIButton.self)
```

## Examples
```swift
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
guard let cell = self.ynSearchListViewDelegate?.ynSearchListView(tableView, cellForRowAt: indexPath) as? SearchViewCell else { return UITableViewCell() }
            
  if let changedText = ynSearchTextFieldText {
    cell.highlight(text: changedText, normal: nil, highlight: [NSBackgroundColorAttributeName: UIColor.yellow])
    }
  return cell
  }
}
```

## References
#### Please tell me or make pull request if you use this library in your application :) 
#### [MotionBook](https://github.com/younatics/MotionBook)
#### [YNSearch](https://github.com/younatics/YNSearch)

## Author
[younatics](https://twitter.com/younatics)
<a href="http://twitter.com/younatics" target="_blank"><img alt="Twitter" src="https://img.shields.io/twitter/follow/younatics.svg?style=social&label=Follow"></a>

## License
Highlighter is available under the MIT license. See the LICENSE file for more info.
