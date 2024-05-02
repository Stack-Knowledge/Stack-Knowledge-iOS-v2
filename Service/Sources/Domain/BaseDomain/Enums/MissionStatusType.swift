import Foundation

public enum MissionStatusType: String, Codable {
    case closed = "CLOSED"
    case opened = "OPENED"
    case availableOpen = "AVAILABLE_OPEN"
}
