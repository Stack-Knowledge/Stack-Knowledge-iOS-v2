import SwiftUI

public protocol TeacherMakingFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
