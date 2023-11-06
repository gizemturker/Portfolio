import Foundation

struct UserModel: Codable {
    let results: [ResultModel]
    let info: InfoModel
}

struct ResultModel: Codable {
    let gender: String
    let name: NameModel?
    let location: LocationModel?
    let email: String
    let picture: PictureModel?
    let phone: String
}

struct NameModel: Codable {
    let title: String
    let first: String
    let last: String
}

struct LocationModel: Codable {
    let street: StreetModel?
    let city: String
    let state: String
    let country: String
    let postcode: Int
    let coordinates: CoordinatesModel?
    let timezone: TimezoneModel?
}

struct StreetModel: Codable {
    let number: Int
    let name: String
}

struct CoordinatesModel: Codable {
    let latitude: String
    let longitude: String
}

struct TimezoneModel: Codable {
    let offset: String
    let description: String
}

struct LoginModel: Codable {
    let uuid: String
    let username: String
    let password: String
    let salt: String
    let md5: String
    let sha1: String
    let sha256: String
}

struct DobModel: Codable {
    let date: String
    let age: Int
}

struct RegisteredModel: Codable {
    let date: String
    let age: Int
}

struct IdModel: Codable {
    let name: String
    let value: String
}

struct PictureModel: Codable {
    let large: String
    let medium: String
    let thumbnail: String
}

struct InfoModel: Codable {
    let seed: String
    let results: Int
    let page: Int
    let version: String
}

extension ResultModel {
    static let example = ResultModel(
        gender: "female",
        name: NameModel(
            title: "Mrs",
            first: "Gizem",
            last: "Turker"),
        location: LocationModel(
            street: StreetModel(number: 34,
                                name: "First Tower"),
            city: "Besiktas",
            state: "Istanbul",
            country: "TR",
            postcode: 34,
            coordinates: nil,
            timezone: nil),
        email: "gizem@gizem.com",
        picture: PictureModel(large: "largeUrl", medium: "mediumUrl", thumbnail: "thumbnailUrl"), phone: "33440883249")
}
