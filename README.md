# Highlighter
[![Awesome](https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg)](https://github.com/vsouza/awesome-ios)
[![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-compatible-brightgreen.svg?style=flat)](https://github.com/younatics/Highlighter/blob/master/Package.swift)
[![CocoaPods](https://img.shields.io/cocoapods/v/Highlighter.svg?style=flat)](https://cocoapods.org/pods/Highlighter)
[![Platform](https://img.shields.io/badge/platform-iOS%2013%2B-blue.svg?style=flat)](https://github.com/younatics/Highlighter/blob/master/Package.swift)
[![Swift 6](https://img.shields.io/badge/Swift-6.0-orange.svg?style=flat)](https://www.swift.org/)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/younatics/Highlighter/blob/master/LICENSE)

## Updates
See [CHANGELOG](https://github.com/younatics/Highlighter/blob/master/CHANGELOG.md) for details

## Introduction
🖍 Highlight whatever you want! `Highlighter` will magically find UI objects such as `UILabel`, `UITextView`, `UITextField`, `UIButton` in your `UITableViewCell` or other `Class`.
#### See [YNSearch](https://github.com/younatics/YNSearch) for advanced usage

![demo](Images/Highlighter.gif)

## Requirements

`Highlighter` requires Swift 6.0 (swift-tools-version 6.0) and iOS 13.0 or later. It supports Swift Package Manager and CocoaPods.

## Installation

### Swift Package Manager

In Xcode, choose **File ▸ Add Package Dependencies…** and enter:

```
https://github.com/younatics/Highlighter.git
```

Or add it to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/younatics/Highlighter.git", from: "2.0.0")
]
```

### CocoaPods

Highlighter is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Highlighter', '2.0.0'
```

## Usage
You can highlight a `UILabel`, `UITextView`, `UITextField`, or `UIButton` using `highlight(text:normal:highlight:)`.
When you call `highlight(text:normal:highlight:type:)` on a container such as a custom `UIView` or `UITableViewCell`, Highlighter inspects the container's stored properties and highlights directly stored supported controls. It does not recursively search `UIView.subviews`.

To highlight all supported controls stored as properties, use:
```swift
view.highlight(text: "Foo", normal: normalAttributes, highlight: highlightedAttributes)
```

Or limit the stored properties to a single control type:
```swift
view.highlight(text: "Foo", normal: normalAttributes, highlight: highlightedAttributes, type: UIButton.self)
```

## Examples
```swift
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  guard let cell = self.ynSearchListViewDelegate?.ynSearchListView(tableView, cellForRowAt: indexPath) as? SearchViewCell else { return UITableViewCell() }

  if let changedText = ynSearchTextFieldText {
    cell.highlight(text: changedText, normal: nil, highlight: [.backgroundColor: UIColor.yellow])
  }
  return cell
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
