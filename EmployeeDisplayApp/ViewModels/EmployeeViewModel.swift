//
//  EmployeeViewModel.swift
//  EmployeeDisplayApp
//
//  Created by Abouzar Moradian on 9/18/24.
//

import Foundation

class EmployeeViewModel{
    
    var employees = [Employee]()
    
    func fetchEmployees(completion: @escaping (Result<[Employee], APIError>) -> ()){
        
        ApiManager.shared.getData(modelType: [Employee].self, endpoint: Constants.employeeApiUrl.rawValue) { [weak self] result in
            
            
            switch result {
            case .success(let employees):
                
                
                print("SUCCESS: list of employees fetched")
                completion(.success(employees))
                
            case .failure(let error):
                
                print("FAILED:  \(error.localizedDescription)")
                completion(.failure(error))

            }
        }
    }
}
