import SwiftUI

public protocol TeacherMainFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
