//
//  ApiManager.swift
//  EmployeeDisplayApp
//
//  Created by Abouzar Moradian on 9/18/24.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case missingData
    case requestFailed(error: Error)
    case decodingFailed(error: Error)
    
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "Invalid URL."
        case .missingData:
            return "No data received from server."
        case .requestFailed(let error):
            return "Request failed with error: \(error.localizedDescription)"
        case .decodingFailed(let error):
            return "Decoding failed with error: \(error.localizedDescription)"
        
        }
    }
}

class ApiManager {
    
    static let shared = ApiManager()
    
    private init(){}
    
    
    func getData<T: Codable>(modelType: T.Type, endpoint: String, completion: @escaping (Result<T, APIError>) -> Void){
       
        guard let apiUrl = URL(string: endpoint) else {
            completion(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: apiUrl)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, _, error in
            
            if let error = error {
                completion(.failure(.requestFailed(error: error)))
                return
            }
            
            if let jsonData = data {
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                do{
                    let objectData = try decoder.decode(T.self, from: jsonData)
                    completion(.success(objectData))
                    return
                    
                }catch {
                    completion(.failure(.decodingFailed(error: error)))
                    return
                }
            }else{
                completion(.failure(.missingData))
                return
            }
            
        }.resume()
        
        
    }
}
