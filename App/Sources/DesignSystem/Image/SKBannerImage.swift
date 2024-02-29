import SwiftUI

public struct SKImage: View {
    public enum Image {
        case Banner
        case BaseProfile
        case SignUp
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
        case .Banner:
            return StackKnowledgeAsset.Banner.bannerImage1.swiftUIImage
        }
    }
}
