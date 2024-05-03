import Foundation

import Alamofire

public enum MissionTarget {
    case fetchAllMission
    case fetchMissionDetail(missionId: String)
    case createMission(request: CreateMissionRequestDTO)
}

extension MissionTarget: TargetType {
    public var headerType: HTTPHeaderType {
        switch self {
        case .fetchAllMission,
             .fetchMissionDetail,
             .createMission:
            return .accessToken
        }
    }

    public var method: HTTPMethod {
        switch self {
        case .fetchAllMission,
             .fetchMissionDetail:
            return .get

        case .createMission:
            return .post
        }
    }

    public var path: String {
        switch self {
        case .fetchAllMission,
             .createMission:
            return baseURL + "/mission"

        case let .fetchMissionDetail(missionId):
            return baseURL + "/mission/\(missionId)"
        }
    }

    public var parameters: RequestParams {
        switch self {
        case .fetchAllMission,
             .fetchMissionDetail:
            return .requestPlain
            
        case let .createMission(request):
            return .requestWithBody(request)
        }
    }
}
