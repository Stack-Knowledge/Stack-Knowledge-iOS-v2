import SwiftUI

public extension Color {
    enum SKColorSystem {
        case main(Main)
        case gray(Gray)
    }
    
    static func sk(_ style: SKColorSystem) -> Color {
        switch style {
        case let .main(colorable as SKColorable),
            let .gray(colorable as SKColorable):
            return colorable.color
        }
    }
}
