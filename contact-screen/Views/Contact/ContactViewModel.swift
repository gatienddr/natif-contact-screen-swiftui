//
//  ContactViewModel.swift
//  contact-screen
//
//  Created by Gatien DIDRY on 19/10/2022.
//

import Foundation
import SwiftUI
class ContactViewModel : ObservableObject{
    
    var userService : UserService
    
    @Published var textInput : String
    
    @Published var offset: CGFloat = 0
    
    @Published var startOffset: CGFloat = 0
    
   let cornerRadiusValue : CGFloat = 10
    
     
    init(userService: UserService){
        self.userService = userService
        self.textInput = ""
    }
    
    
    func goBack(){
        self.userService.isOnContact=false
    }
    
    func getPicSize() -> CGFloat{
        
        
        let size = 110
        
        return size - Int(offset*0.3)<70 ? 70 : size - Int(offset*0.3)>110 ? 110 : (CGFloat)(size - Int(offset*0.3))
    }
    
    func getTitleSize() -> CGFloat{
        
        
        let size = 36
        
        return size - Int(0.1*offset)<25 ?  25 : size - Int(offset*0.3)>36 ?  36 :  (CGFloat)(36-Int(0.1*offset))
        
        
    }

    
    
    
    
}
