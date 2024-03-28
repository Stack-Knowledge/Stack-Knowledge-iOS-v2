import SwiftUI

public protocol TeacherScoringFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
