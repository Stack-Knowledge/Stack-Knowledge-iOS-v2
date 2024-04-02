import SwiftUI

public protocol TeacherStoreFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
