//
//  UserService.swift
//  MVVM_WITH_SOLID_XCTEST
//
//  Created by Akash Revanna on 27/04/26.
//

import Foundation
protocol UserServiceProtocol {
    func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void)
}

class UserService: UserServiceProtocol {
    func fetchUsers(completion: @escaping (Result<[User], any Error>) -> Void) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                return
            }
            do{
                let user = try JSONDecoder().decode([User].self, from: data)
                completion(.success(user))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
    }
}
