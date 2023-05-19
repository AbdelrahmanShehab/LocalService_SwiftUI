//
//  webservice.swift
//  LocalService
//
//  Created by Abdelrahman Shehab on 15/05/2023.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidServerResponse
}

class Webservice: NetworkService {
    var type: String = "Webservice"
    
    func download(_ resourceName: String) async throws -> [User] {
        guard let url = URL(string: resourceName) else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResonse = response as? HTTPURLResponse , httpResonse.statusCode == 200 else {
            throw NetworkError.invalidServerResponse
        }
        
        return try JSONDecoder().decode([User].self, from: data)
    }
}
