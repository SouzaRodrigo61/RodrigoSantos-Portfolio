//
//  HomeViewController.swift
//  RodrigoSantos-Portfolio
//
//  Created by Rodrigo Santos on 28/05/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI

class HomeViewController: UIHostingController<HomeContentView> {
    let networkingService: NetworkingService
    
    override init(rootView: HomeContentView) {
        self.networkingService = NetworkingService()
        super.init(rootView: rootView)
    }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getUsers()
    }
    
    func getUsers() {
        networkingService.getUsers { [weak self] users in
            self?.rootView.sot.users = users
        }
    }
}
