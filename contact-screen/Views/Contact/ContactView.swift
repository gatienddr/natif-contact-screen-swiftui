//
//  ContactView.swift
//  contact-screen
//
//  Created by Gatien DIDRY on 19/10/2022.
//

import SwiftUI

struct ContactView: View {
    
    @ObservedObject var viewModel : ContactViewModel
    
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    
    @Environment(\.colorScheme) var colorScheme
    
    init(_ vm : ContactViewModel){
        self.viewModel = vm
    }
    
    var body: some View {
        NavigationView {
            HStack{
                VStack{
                    VStack(alignment: .center){
                        /*
                         *MARK: Memoji
                         */
                        Image("memoji")
                            .resizable()
                            .frame(width: self.viewModel.getPicSize()  , height:  self.viewModel.getPicSize())
                            .background(Color.gray.gradient)
                            .cornerRadius(55)
                        
                        
                        /*
                         *MARK: Name
                         */
                        Text("Gatien Bordeaux")
                            .font(.system(size: self.viewModel.getTitleSize() ))
                            .padding([.top],10)
                        
                        /*
                         *MARK: Buttons inline
                         */
                        HStack {
                            
                            ButtonInline(ButtonInlineViewModel(title: "message" , systemImage: "message.fill"))
                            
                            ButtonInline(ButtonInlineViewModel(title: "call" , systemImage: "phone.fill"))
                            
                            ButtonInline(ButtonInlineViewModel(title: "video" , systemImage: "video.fill"))
                            
                            ButtonInline(ButtonInlineViewModel(title: "mail" , systemImage: "envelope.fill"))
                            
                        }
                    }
                    
                    ScrollView{
                        
                        Group{
                            
                            /*
                             *MARK: Mobile
                             */
                            AreaTitleButton(AreaTitleButtonViewModel(title: "mobile",
                                                                     textButton: "0600000000"))
                            
                            
                            /*
                             *MARK: FaceTime
                             */
                            AreaTitleButton(AreaTitleButtonViewModel(title: "FaceTime",
                                                                     AnyView(
                                                                        HStack{
                                                                            Button {
                                                                            } label: {
                                                                                Image(systemName:  "video.fill")
                                                                                    .padding(10)
                                                                                    .background(Color(UIColor.tertiarySystemGroupedBackground))
                                                                                    .cornerRadius(30)
                                                                                
                                                                            }
                                                                            Button {
                                                                            } label: {
                                                                                Image(systemName:  "phone.fill")
                                                                                    .padding(10)
                                                                                    .background(Color(UIColor.tertiarySystemGroupedBackground))
                                                                                    .cornerRadius(30)
                                                                                
                                                                            }
                                                                            
                                                                        }
                                                                            .padding([.trailing], 10)
                                                                        
                                                                     )
                                                                    ))
                            
                            /*
                             *MARK: Email
                             */
                            AreaTitleButton(AreaTitleButtonViewModel(title: "home",
                                                                     textButton: "username.password@notexist.com"))
                            
                            
                            /*
                             *MARK: Ringtone
                             */
                            AreaTitleButton(AreaTitleButtonViewModel(title: "Ringtone",
                                                                     textButton: "Sound: Night Owl",
                                                                     AnyView(
                                                                        Image(systemName:  "chevron.forward")
                                                                            .foregroundColor(Color( UIColor.lightGray))
                                                                            .padding([.trailing],10))))
                            
                            /*
                             *MARK: Adress
                             */
                            HStack{
                                VStack(alignment: .leading){
                                    Text("home")
                                        .font(.system(size: 13))
                                    Text("1 Rue Somewhere")
                                    Text("75000 Paris")
                                    Text("France")
                                }
                                .padding([.leading],15)
                                
                                
                                Spacer()
                                Image("map").resizable()
                                    .frame(width: 60, height: 60)
                                    .padding([.trailing],15)
                            }
                            .padding([.top, .bottom],10)
                            .background(Color(colorScheme == .dark ? UIColor.secondarySystemBackground : UIColor.white))
                            .cornerRadius(self.viewModel.cornerRadiusValue)
                            .padding([.leading, .trailing],10)
                            .padding([.top],10)
                            
                            
                            /*
                             *MARK: Notes
                             */
                            VStack(alignment: .leading){
                                Text("Notes")
                                TextField(
                                    "",
                                    text: self.$viewModel.textInput
                                )
                                .disableAutocorrection(true)
                                
                            }
                            .padding([.top, .bottom],10)
                            .padding([.leading],15)
                            .background(Color(colorScheme == .dark ? UIColor.secondarySystemBackground : UIColor.white))
                            .cornerRadius(self.viewModel.cornerRadiusValue)
                            .padding([.leading, .trailing],10)
                            .padding([.top],10)
                            
                            /*
                             *MARK: Group Buttons : Send Message, Share Contact, Add to Favourite
                             */
                            List{
                                ButtonList(ButtonListViewModel(title: "Send Message"))
                                ButtonList(ButtonListViewModel(title: "Share Contact"))
                                ButtonList(ButtonListViewModel(title: "Add to Favourites"))
                            }
                            
                            .listStyle(.plain)
                            .scrollDisabled(true)
                            .frame(minHeight: minRowHeight*3)
                            .cornerRadius(self.viewModel.cornerRadiusValue)
                            .padding([.leading, .trailing, .top],10)
                            
                            /*
                             *MARK: Button Create Medical ID
                             */
                            AreaTitleButton(AreaTitleButtonViewModel(
                                textButton: "Create Medical ID",
                                AnyView(
                                    Image(systemName:  "asterisk")
                                        .foregroundColor(Color.red)
                                        .padding([.trailing],10))))
                        }
                        .overlay(
                            
                            GeometryReader{ proxy -> Color in
                                let minY = proxy.frame(in: .global).minY
                                
                                DispatchQueue.main.async{
                                    
                                    if self.viewModel.startOffset == 0 {
                                        self.viewModel.startOffset = minY
                                    }
                                    self.viewModel.offset = self.viewModel.startOffset - minY
                                }
                                
                                return Color.clear
                            }
                                .frame(width : 0, height: 0)
                            ,alignment : .top
                        )
                    }
                    
                }
            }
            
            .background(Color(colorScheme == .dark ?  UIColor.systemBackground : UIColor.tertiarySystemGroupedBackground ))
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        self.viewModel.goBack()
                    } label: {
                        Label("Contacts", systemImage: "chevron.backward")
                            .labelStyle(
                                HorizontalLabelStyle())
                    }
                }
                
                ToolbarItem (placement: .navigationBarTrailing){
                    Button("Edit") {
                        print("go to edit page")
                    }
                }
                
            }
        }
        
    }
    
    
}

struct HorizontalLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 3) {
            configuration.icon.bold(true)
            configuration.title
            
        }
    }
}


