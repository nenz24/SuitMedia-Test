//
//  ThirdScreenModel.swift
//  Danendra-Darmawansyah_SUITMEDIA-Test
//
//  Created by Kleo Handayani on 11/08/24.
//

import Foundation
import Combine
struct User: Identifiable, Codable {
    let id: Int
    let email: String
    let firstName: String
    let lastName: String
    let avatar: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}

struct UserListResponse: Codable {
    let page: Int
    let perPage: Int
    let total: Int
    let totalPages: Int
    let data: [User]
    let support: Support
    
    private enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data
        case support
    }
}

struct Support: Codable {
    let url: String
    let text: String
}

import Foundation
import Combine

class ThirdScreenModel: ObservableObject {
    @Published var users: [User] = []
    @Published var isLoading = false
    @Published var error: Error?
    
    private var currentPage = 1
    private let perPage = 6
    private var cancellables = Set<AnyCancellable>()
    
    func loadData() {
        guard !isLoading else { return }
        isLoading = true
        
        let url = URL(string: "https://reqres.in/api/users?page=\(currentPage)&per_page=\(perPage)")!
        print("Fetching data from URL: \(url)")
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            if let error = error {
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.error = error
                    print("Error fetching data: \(error)")
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.error = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])
                    print("No data received")
                }
                return
            }
            
            do {
                let response = try JSONDecoder().decode(UserListResponse.self, from: data)
                DispatchQueue.main.async {
                    self.users.append(contentsOf: response.data)
                    self.currentPage += 1
                    self.isLoading = false
                    print("Successfully fetched data: \(response.data)")
                }
            } catch {
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.error = error
                    print("Error decoding data: \(error)")
                }
            }
        }.resume()
    }
}
