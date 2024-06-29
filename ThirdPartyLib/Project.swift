import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramework(
    name: "ThirdPartyLib",
    packages: [],
    deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone]),
    dependencies: [
        .SPM.Alamofire,
        .SPM.NeedleFoundation,
    ],
    scripts: [.SwiftLintString]
)
