
# GenericPresentingSwiftUIView: Libraries that make it easy to host SwiftUI View globally
# Overview

A library that makes it easy to host SwiftUI Views globally. By wrapping your favorite SwiftUI View in GenericPresentingSwiftUIView, you can easily use it in UIKit.

# Features
- SwiftUI View is readily available in UIKit.
- It allows you to use SwiftUI View the way you're used to without having to customize it.

# Requirements
- iOS 13.0 or later
- Swift 5.5 or later
- Xcode 14.0 or later

# Usage
```swift
import GenericPresentingSwiftUIView

class ViewController: UIViewController {
    override func viewDidLoad() {
        var view = GenericPresentingSwiftUIView<AnyView>()
        
        // view Show Action
        view.show(content: AnyView(
            Text("Hello World!")
        ))
        
        // view hide(dismiss) Action
        view.hide()
        
    }
}

```

- Note
*You need to hide the view separately.*
*You must remove it from the view by creating a subview in the root view.*

# Installation

The Swift Package Manager is a tool for automating the distribution of Swift code and is integrated into the swift compiler. It is in early development, but this SDK does support its use on supported platforms.

Once you have your Swift package set up, adding the SDK as a dependency is as easy as adding it to the dependencies value of your Package.swift.

```swift
dependencies: [
    .package(url: "https://github.com/JEJEMEME/GenericPresentingSwiftUIView.git")
]
```
or `File` -> `Add Packages...` -> Search `https://github.com/JEJEMEME/GenericPresentingSwiftUIView.git` -> Install
                                        

# Contribution
Contributions are welcome! If you'd like to improve GenericPresentingSwiftUIView, please feel free to fork the repository, make changes, and submit a pull request.

# License
                                            GenericPresentingSwiftUIView is available under the MIT license. See the LICENSE file for more info.

# Acknowledgements
Created by JEJEMEME, a passionate Swift developer and open-source contributor.

