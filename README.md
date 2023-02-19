# GLoading-Indicator

A globally available loading indicator within the SwiftUI.
It's ready to use without any settings.

# Installation
### SPM

The [Swift Package Manager](https://www.swift.org/package-manager/, "SPM") is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. It is in early development, but this SDK does support its use on supported platforms.

Once you have your Swift package set up, adding the SDK as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/ITlearning/GLoading-Indicator")
]
```
or `File` -> `Add Packages...` -> Search `https://github.com/ITlearning/GLoading-Indicator` -> Install



# Example

```swift

import SwiftUI
import GLoading_Indicator

struct ContentView: View {
    var body: some View {
        
        VStack {
            Text("Hello, world!")
                .padding()
            
            Button(action: {
                GLoading_Indicator.show() { 
                    // Cancel Button Click Action
                    // Example) Networking Stop, View Drawing Stop...
                    print("[@] Close Action On")
                }
            }, label: {
                Text("Open")
            })
        }
        
    }
}
```


# Document

### Open (Not Custom Text)
```swift
GLoading_Indicator.show() { // (Close Button)Dismiss Action }
```

Detects the language of the current device and changes the default language.

### Open (Custom Text)
```swift 
GLoading_Indicator.show(text: "안녕하세요 :)")
```
### Close
```Swift
GLoading_Indicator.hide()
```
