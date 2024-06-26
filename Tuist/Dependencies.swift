import ProjectDescription

let dependencies = Dependencies(
    carthage: nil,
    swiftPackageManager: SwiftPackageManagerDependencies(
        [
            .remote(
                url: "https://github.com/uber/needle.git",
                requirement: .upToNextMajor(from: "0.24.0")
            ),
            .remote(
                url: "https://github.com/Alamofire/Alamofire.git",
                requirement: .upToNextMajor(from: "5.8.1")
            ),
        ],
        baseSettings: .settings(
            configurations: [
                .debug(name: .debug),
                .release(name: .release),
            ]
        )
    ),
    platforms: [.iOS]
)
