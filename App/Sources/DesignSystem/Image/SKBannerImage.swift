import SwiftUI

public struct SKBannerImage: View {
    public enum Image {
        case Banner1
        case Banner2
        case Banner3
    }

    private var image: Image
    private var renderingMode: SwiftUI.Image.TemplateRenderingMode

    public init(
        _ image: Image,
        renderingMode: SwiftUI.Image.TemplateRenderingMode = .original
    ) {
        self.image = image
        self.renderingMode = renderingMode
    }

    public var body: some View {
        smsImageToImage()
            .resizable()
            .renderingMode(renderingMode)
    }

    private func smsImageToImage() -> SwiftUI.Image {
        switch image {
        case .Banner1:
            return StackKnowledgeAsset.Banner.bannerImage1.swiftUIImage
        case .Banner2:
            return StackKnowledgeAsset.Banner.bannerImage1.swiftUIImage
        case .Banner3:
            return StackKnowledgeAsset.Banner.bannerImage1.swiftUIImage
        }
    }
}
