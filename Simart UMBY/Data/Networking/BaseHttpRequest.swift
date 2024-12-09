//
//  BaseHttpRequest.swift
//  Simart UMBY
//
//  Created by фкшуа on 10/12/24.
//

import Foundation

class BaseHttpRequest {
    static func get<T: Codable>(path: String) async throws -> T {
        let endpoint = "\(Constant.BASE_URL)\(path)"
        
        guard let url = URL(string: endpoint) else { throw NetworkingError.INVALID_URL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        NetworkLogger.log(response: response as? HTTPURLResponse, data: data, error: nil)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkingError.INVALID_RESPONSE
        }
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NetworkingError.INVALID_DATA
        }
    }
}
