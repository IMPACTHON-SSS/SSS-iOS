import Foundation
import SwiftUI
import Service
import Sora

public final class HomeViewModel: ObservableObject {
    @Published var isPresented: Bool = false
    @Published var image: UIImage?
    @Published var isShowingMenu: Bool = false
    @Published var isNavigateToDiary: Bool = false
    @Published var dishList: [DishEntity] = []
    @Published var date: Date = .init()

    @MainActor 
    func onAppear() {
        fetchDish()
    }

    @MainActor
    private func fetchDish() {
        Task {
            do {
                let response = try await FetchDishRequest(body: .init(year: date.year, month: date.month))
                    .request(decodeWith: [FetchDishResponseDTO].self, printResponse: true)
                self.dishList = response.map { $0.toDomain() }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
