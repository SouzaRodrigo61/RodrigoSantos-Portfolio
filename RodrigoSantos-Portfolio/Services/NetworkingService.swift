//
//  NetworkingService.swift
//  RodrigoSantos-Portfolio
//
//  Created by Rodrigo Santos on 28/05/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import Foundation

final class NetworkingService {

    func getUsers(completion: @escaping ([User]) -> Void) {
        let url = URL(string: "https://kl-universal-links-server.herokuapp.com/api/users")!
        URLSession.shared.dataTask(with: url) {
            if let error = $2 {
                print(error)
            } else if let data = $0 {
                do {
                    let users = try JSONDecoder().decode([User].self, from: data)
                    DispatchQueue.main.async {
                        completion(users)
                    }
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}

