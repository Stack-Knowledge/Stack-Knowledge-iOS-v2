import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.executable(
    name: "StackKnowledge",
    platform: .iOS,
    deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone]),
    dependencies: [
        .project(target: "Service", path: "../Service")
    ]
)

