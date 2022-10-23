//
//  HomeViewModel.swift
//  contact-screen
//
//  Created by Gatien DIDRY on 19/10/2022.
//

import Foundation

class HomeViewModel{
    
    var userService : UserService
    
    init(userService: UserService){
        self.userService = userService
    }
    
    func goToContact(){
        self.userService.isOnContact = true
    }
    
}
