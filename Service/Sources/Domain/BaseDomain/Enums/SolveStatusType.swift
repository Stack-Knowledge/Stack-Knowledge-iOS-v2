import Foundation

public enum SolveStatusType: String, Codable {
    case notSolve = "NOT_SOLVE"
    case scoring = "SCORING"
    case correctAnswer = "CORRECT_ANSWER"
    case wrongAnswer = "WRONG_ANSWER"
}
