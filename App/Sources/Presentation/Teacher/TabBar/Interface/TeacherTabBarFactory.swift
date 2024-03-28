import SwiftUI

public protocol TeacherTabBarFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
