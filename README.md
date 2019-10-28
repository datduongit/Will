<p align="center">
  <img src="https://github.com/datduongit/Will/blob/master/Logo/will.png" height="80" >
</p>

<p align="center">
  Will iOS client in RxSwift and MVVM-C clean architecture.
</p>

<p align="center">  
  Will and Combine coming soon!
</p>

## Content
- [Screenshots](#screenshots)
- [App Features](#app-features)
- [Technologies](#technologies)
- [Tools](#tools)
- [Building and Running](#building-and-running)
- [Documentation](#documentation)
- [Debugging](#debugging)
- [Fastlane](#fastlane)
- [Design](#design)
- [SwiftHub In](#swifthub-in)
- [References](#references)
- [See Also](#see-also)
- [License](#license)

## Screenshots

<img alt="01" src="https://github.com/datduongit/Will/blob/master/screenshots/1.png?raw=true" width="280">&nbsp;
<img alt="02" src="https://github.com/datduongit/Will/blob/master/screenshots/2.png?raw=true" width="280">&nbsp;
<img alt="03" src="https://github.com/datduongit/Will/blob/master/screenshots/3.png?raw=true" width="280">&nbsp;

## App Features
- [x] Basic and OAuth2 authentication (Todo implement)
- [x] Quickly browse the history of a file from any git repository ([git-history](https://github.com/pomber/git-history))
- [x] Tool for visualizing GitHub profiles ([profile-summary-for-github](https://github.com/tipsy/profile-summary-for-github))

## Technologies
- [x] Clean architecture ([RxSwift](https://github.com/ReactiveX/RxSwift) and MVVM)
- [x] Flow coordinators ([Realm demo](https://github.com/realm/EventKit/blob/master/iOS/EventBlank2-iOS/Services/Navigator.swift))
- [x] REST API v3 (for unauthenticated or basic authentication) ([Moya](https://github.com/Moya/Moya), [ObjectMapper](https://github.com/tristanhimmelman/ObjectMapper))
- [x] Logging ([CocoaLumberjack](https://github.com/CocoaLumberjack/CocoaLumberjack))
- [ ] Dependency injection ([Swinject](https://github.com/Swinject/Swinject))(Todo implement)

## Tools
- [x] [Fastlane](https://github.com/fastlane/fastlane) - The easiest way to automate building and releasing your iOS and Android apps
- [x] [Sourcetree](https://www.sourcetreeapp.com) - A free Git client for Windows and Mac

## Building and Running

You'll need a few things before we get started. 
Make sure you have Xcode installed from the App Store.
The following commands will set up Will
```sh
cd Will
pod install
```
Alrighty! We're ready to go!

## Documentation
You must get a API Key (v3 Auth) from https://developers.themoviedb.org/ and update the `INSERT_API_KEY_HERE` in the NetworkPlatform/API/WillApi.swift

## Debugging
Tobe define...

## Fastlane
Tobe implement...

## Design
Tobe define...

## SwiftHub In
* [open-source-ios-apps](https://github.com/dkhamsing/open-source-ios-apps#github) - Collaborative List of Open-Source iOS Apps
* [Moya](https://github.com/Moya/Moya/blob/master/docs/CommunityProjects.md#Applications) - Community Projects
* [awesome-rxswift](https://github.com/LeoMobileDeveloper/awesome-rxswift#open-source-apps) - Curated list of RxSwift library and learning material
* [Kingfisher](https://github.com/onevcat/Kingfisher) A lightweight, pure-Swift library for downloading and caching images from the web.
* [XCDYouTubeKit](https://github.com/0xced/XCDYouTubeKit) YouTube video player for iOS, tvOS and macOS

## References
* [CleanArchitectureRxSwift](https://github.com/sergdort/CleanArchitectureRxSwift) - Clean architecture with RxSwift
* [View Model in RxSwift](https://medium.com/@SergDort/viewmodel-in-rxswift-world-13d39faa2cf5) - Good article

## See Also
* [SwiftHub](https://github.com/khoren93/SwiftHub/tree/master/SwiftHub) - GitHub iOS client in RxSwift and MVVM-C clean architecture

## License
MIT License. See [LICENSE](https://github.com/).
