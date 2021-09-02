# Tracking

This package contains a unified API for analytics purposes.

## Installation
To install the analytics framework just add this line to the dependencies section in the Package.swift
```swift
.package(url: "https://github.com/kkla320/Tracking.git", from: "0.3.0")
```
After that you just need to add the package as a depency in the corresponding target.
```swift
.target(
    name: "myProject",
    dependencies: [
        "Tracking"
    ])
```
