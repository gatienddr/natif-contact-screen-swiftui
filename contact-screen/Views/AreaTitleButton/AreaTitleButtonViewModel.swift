//
//  AreaTitleButtonViewModel.swift
//  contact-screen
//
//  Created by Gatien DIDRY on 22/10/2022.
//

import Foundation
import SwiftUI

class AreaTitleButtonViewModel : ObservableObject{
    
    
    var title: String?
    var titleSize: CGFloat
    var textButton: String?
    var viewLeftSide : AnyView?
    
    
    
    init(title: String? = nil, textButton: String? = nil , _ viewLeftSide: AnyView? = nil){
        self.title = title
        self.textButton = textButton
        self.viewLeftSide = viewLeftSide
        if let _ = textButton{
            self.titleSize = 13
        }
        else{
            self.titleSize = 15
        }
    }
}
