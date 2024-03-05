import SwiftUI

public struct SKTapBarIcon: View {
    var icon: Icon
    var renderingMode: Image.TemplateRenderingMode
    var width: CGFloat?
    var height: CGFloat?

    public init(
        _ icon: Icon,
        renderingMode: Image.TemplateRenderingMode = .original,
        width: CGFloat? = 24,
        height: CGFloat? = 24
    ) {
        self.icon = icon
        self.renderingMode = renderingMode
        self.width = width
        self.height = height
    }

    public enum Icon: CaseIterable {
        case mainPage
        case makeMissionPage
        case missionPage
        case rankingPage
        case scoringPage
        case storePage
    }

    public var body: some View {
        iconToImage()
            .resizable()
            .renderingMode(renderingMode)
            .frame(width: width, height: height)
    }

    // swiftlint: disable cyclomatic_complexity
    private func iconToImage() -> Image {
        switch icon {
        case .mainPage:
            return StackKnowledgeAsset.TapBar.mainPageIcon.swiftUIImage
        case .makeMissionPage:
            return StackKnowledgeAsset.TapBar.makeMissionPageIcon.swiftUIImage
        case .missionPage:
            return StackKnowledgeAsset.TapBar.missionPageIcon.swiftUIImage
        case .rankingPage:
            return StackKnowledgeAsset.TapBar.rankingPageIcon.swiftUIImage
        case .scoringPage:
            return StackKnowledgeAsset.TapBar.scoringPageIcon.swiftUIImage
        case .storePage:
            return StackKnowledgeAsset.TapBar.storePageIcon.swiftUIImage
        }
    }
    // swiftlint: enable cyclomatic_complexity
}
