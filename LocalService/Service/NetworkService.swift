//
//  NetworkService.swift
//  LocalService
//
//  Created by Abdelrahman Shehab on 15/05/2023.
//

import Foundation
protocol NetworkService {
    func download(_ resourceName: String) async throws -> [User]
    var type: String { get }
    
}
