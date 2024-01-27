import Foundation

public struct FetchDishResponseDTO: Decodable {
    public let id: Int
    public let dairy: String
    public let url: String
    public let date: String
    
    init(
        id: Int,
        dairy: String,
        url: String,
        date: String
    ) {
        self.id = id
        self.dairy = dairy
        self.url = url
        self.date = date
    }
}
