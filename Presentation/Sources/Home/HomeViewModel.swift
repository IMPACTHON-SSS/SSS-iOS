import Foundation
import SwiftUI
import Service
import Sora

@MainActor
public final class HomeViewModel: ObservableObject {
    @Published var isPresented: Bool = false
    @Published var isShowingMenu: Bool = false
    @Published var isNavigateToDiary: Bool = false
    @Published var dishList: [DishEntity] = []
    @Published var date: Date = .init()

    func onAppear() {
        fetchDish()
    }
    private func fetchDish() {
        dishList = [
            .init(
                id: 5,
                dairy: "일기일기일기",
                url: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.istockphoto.com%2Fkr%2F%25EC%259D%25B4%25EB%25AF%25B8%25EC%25A7%2580%2F%25ED%2595%259C%25EA%25B5%25AD-%25EC%259D%258C%25EC%258B%259D&psig=AOvVaw2540dHLoweU_LZ5wD0lNYj&ust=1706496349017000&source=images&cd=vfe&opi=89978449&ved=0CBMQjRxqFwoTCJjX9LmI_4MDFQAAAAAdAAAAABAE",
                date: "24-01-28"
            ),
            .init(
                id: 5,
                dairy: "일기일기일기",
                url: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.istockphoto.com%2Fkr%2F%25EC%259D%25B4%25EB%25AF%25B8%25EC%25A7%2580%2F%25ED%2595%259C%25EA%25B5%25AD-%25EC%259D%258C%25EC%258B%259D&psig=AOvVaw2540dHLoweU_LZ5wD0lNYj&ust=1706496349017000&source=images&cd=vfe&opi=89978449&ved=0CBMQjRxqFwoTCJjX9LmI_4MDFQAAAAAdAAAAABAE",
                date: "24-01-27"
            ),
            .init(
                id: 5,
                dairy: "일기일기일기",
                url: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.istockphoto.com%2Fkr%2F%25EC%259D%25B4%25EB%25AF%25B8%25EC%25A7%2580%2F%25ED%2595%259C%25EA%25B5%25AD-%25EC%259D%258C%25EC%258B%259D&psig=AOvVaw2540dHLoweU_LZ5wD0lNYj&ust=1706496349017000&source=images&cd=vfe&opi=89978449&ved=0CBMQjRxqFwoTCJjX9LmI_4MDFQAAAAAdAAAAABAE",
                date: "24-01-26"
            )
        ]
    }
}
