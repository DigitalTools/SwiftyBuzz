import PackageDescription

let package = Package(
    name: "SwiftyBuzz",
    targets: [
        Target(name: "SwiftyBuzz")
    ],
    dependencies: [
	.Package(url: "https://github.com/PureSwift/SwiftFoundation", majorVersion: 2)
    ],
    exclude: ["Xcode"]
)
