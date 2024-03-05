import SwiftUI

public struct SKImage: View {
    public enum Image {
        case SignUpBackground
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
        case .SignUpBackground:
            return StackKnowledgeAsset.SignUp.signUpBackground.swiftUIImage
        }
    }
}
