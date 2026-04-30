//
//  UserViewModel.swift
//  MVVM_WITH_SOLID_XCTEST
//
//  Created by Akash Revanna on 27/04/26.
//

import Foundation

class UserViewModel {
    
    private let service:UserServiceProtocol
    private var users:[User] = []
    
//    Binding closure
    var onDataUpdate:(()-> Void)?
    var onError:((String)-> Void)?
    
    init(service: UserServiceProtocol) {
        self.service = service
    }
    
    func fetchUsers() {
        service.fetchUsers { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let users):
                    self?.users = users
                    self?.onDataUpdate?()
                    
                case .failure(let error):
                    self?.onError?("\(error.localizedDescription)")
                }
            }
        }
    }
    
    func numberOfRows() -> Int {
        return users.count
    }
    
    func userAt(index: Int) -> User {
        return users[index]
    }
    
}
