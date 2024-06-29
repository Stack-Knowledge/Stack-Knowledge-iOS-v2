import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramework(
    name: "Service",
    platform: .iOS,
    infoPlist: .extendingDefault(
        with: [
            "BASE_URL": "$(BASE_URL)",
        ]
    ),
    deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone]),
    scripts: [.SwiftLintString, .NeedleShell]
)
