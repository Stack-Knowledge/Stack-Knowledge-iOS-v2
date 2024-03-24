import SwiftUI

public protocol ClientMissionFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
