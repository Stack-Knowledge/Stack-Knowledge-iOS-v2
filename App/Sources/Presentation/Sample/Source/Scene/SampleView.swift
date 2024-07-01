import SwiftUI

struct SampleView: View {
    @StateObject var container: MVIContainer<SampleIntent, SampleModelStateProtocol>

    var body: some View {
        VStack(spacing: 0) {
            Text("Sample View!!!")

            Button {
                container.intent.buttonDidTap()
            } label: {
                Text(container.model.text)
            }
        }
    }
}
