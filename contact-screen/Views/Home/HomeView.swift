//
//  ContentView.swift
//  contact-screen
//
//  Created by Gatien DIDRY on 19/10/2022.
//

import SwiftUI
import CoreData

struct HomeView: View {
    
    var viewModel : HomeViewModel
    
    init(_ vm : HomeViewModel){
        self.viewModel = vm;
    }
    
    var body: some View {
        NavigationView {
            Text("Click on 'me' button !")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Me") {
                            viewModel.goToContact()
                        }
                    }
                   
                }
        }
       
        
    }
    
}








