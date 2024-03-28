import SwiftUI

public protocol TeacherRankFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
