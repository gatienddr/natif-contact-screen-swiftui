//
//  UserService.swift
//  contact-screen
//
//  Created by Gatien DIDRY on 19/10/2022.
//

import Foundation

class UserService : ObservableObject {
    @Published var isOnContact: Bool

    init() {
        self.isOnContact = false
    }
}
