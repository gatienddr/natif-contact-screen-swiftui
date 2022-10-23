//
//  contact_screenApp.swift
//  contact-screen
//
//  Created by Gatien DIDRY on 19/10/2022.
//

import SwiftUI

@main
struct contact_screenApp: App {
    
    @ObservedObject private var userService = UserService()


    var body: some Scene {
        WindowGroup {
            if(userService.isOnContact){
                ContactView(ContactViewModel(userService: userService))
            }
            else{
                HomeView(HomeViewModel(userService: userService))
            }
           
        }
    }
}
