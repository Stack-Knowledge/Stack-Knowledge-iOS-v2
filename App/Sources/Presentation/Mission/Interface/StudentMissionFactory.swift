import SwiftUI

public protocol StudentMissionFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
