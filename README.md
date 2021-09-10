# Tracking

[![Swift](https://github.com/kkla320/Tracking/actions/workflows/swift.yml/badge.svg?branch=develop&event=push)](https://github.com/kkla320/Tracking/actions/workflows/swift.yml)

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

## How to use
First you have to import the framework
```swift
import Tracking
```

At the start of your app, you have to initialize the Analytics system
```swift
let myAnalyticsHandler = // ...
let myAnalyticsFilter = // ...

Analytics.bootstrap([myAnalyticsHandler], filters: [myAnalyticsFilter])
```

The you can just call the shared instance of `Analytics`
```swift
let myEvent = // ...
Analytics.shared.log(event: myEvent)
```
