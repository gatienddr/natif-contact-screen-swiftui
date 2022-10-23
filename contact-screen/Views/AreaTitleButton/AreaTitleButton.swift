//
//  AreaTitleButton.swift
//  contact-screen
//
//  Created by Gatien DIDRY on 22/10/2022.
//

import SwiftUI

struct AreaTitleButton: View {
    
    @ObservedObject var viewModel : AreaTitleButtonViewModel
    
    @Environment(\.colorScheme) var colorScheme
    
    init(_ vm : AreaTitleButtonViewModel){
        self.viewModel = vm
    }

    var body: some View {
        HStack{
            VStack(alignment: .leading){
                
                if let title = self.viewModel.title{
                    Text(title)
                        .font(.system(size:  self.viewModel.titleSize))
                        .padding([.leading],15)
                }
                
                if let textButton =  self.viewModel.textButton{
                    Button(textButton) {
                    }
                    .padding([.leading],15)
                }
            }
            Spacer()
            
            if let viewLeftSide =  self.viewModel.viewLeftSide{
                viewLeftSide
            }
        }
        .padding([.top, .bottom],10)
        .background(Color(colorScheme == .dark ? UIColor.secondarySystemBackground : UIColor.white))
        .cornerRadius(10)
        .padding([.leading, .trailing],10)
        .padding([.top],10)
    }
}
