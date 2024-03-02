import SwiftUI

public struct SKLogoutIcon: View {
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
        case logout
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
        case .logout:
            return StackKnowledgeAsset.Logout.logoutIcon.swiftUIImage
        }
    }
    // swiftlint: enable cyclomatic_complexity
}
