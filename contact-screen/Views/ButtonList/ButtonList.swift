//
//  ButtonList.swift
//  contact-screen
//
//  Created by Gatien DIDRY on 23/10/2022.
//

import SwiftUI

struct ButtonList: View {
    
    @ObservedObject var viewModel : ButtonListViewModel
    
    @Environment(\.colorScheme) var colorScheme
    
    init(_ vm : ButtonListViewModel){
        self.viewModel = vm
    }
    
    var body: some View {
        Button(self.viewModel.title){}
            .foregroundColor(.blue)
            .listRowBackground(Color(colorScheme == .dark ? UIColor.secondarySystemBackground : UIColor.white))
    }
}

