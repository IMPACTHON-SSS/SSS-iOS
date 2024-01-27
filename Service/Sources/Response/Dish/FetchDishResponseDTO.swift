import Foundation

public struct FetchDishResponseDTO: Decodable {
    public let id: Int
    public let dairy: String
    public let url: String
    public let date: String
}

public extension FetchDishResponseDTO {
    func toDomain() -> DishEntity {
        .init(id: id, dairy: dairy, url: url, date: date)
    }
}
