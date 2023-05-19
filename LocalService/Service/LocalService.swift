//
//  LocalService.swift
//  LocalService
//
//  Created by Abdelrahman Shehab on 15/05/2023.
//

import Foundation

class Localservice: NetworkService {
    var type: String = "Localservice"
    
    func download(_ resourceName: String) async throws -> [User] {
        guard let path = Bundle.main.path(forResource: resourceName, ofType: "json") else {
            fatalError("Resource not found!")
        }
        
        let data = try Data(contentsOf: URL(filePath: path))
        return try JSONDecoder().decode([User].self, from: data)
    }
}
