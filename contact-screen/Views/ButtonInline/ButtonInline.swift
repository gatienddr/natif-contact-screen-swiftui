import SwiftUI

struct ButtonInline: View {
    
    @ObservedObject var viewModel : ButtonInlineViewModel
    
    @Environment(\.colorScheme) var colorScheme
    
    init(_ vm : ButtonInlineViewModel){
        self.viewModel = vm
    }
    
    
    var body: some View {
        VStack{
            Button {
            } label: {
                Label(self.viewModel.title, systemImage: self.viewModel.systemImage)
                    .labelStyle(
                        VerticalLabelStyle())
            }
            
        }
        .frame(width: 88, height: 55, alignment: .center)
        .background(Color(colorScheme == .dark ? UIColor.secondarySystemBackground : UIColor.white))
        .cornerRadius(5)
    }
}


struct VerticalLabelStyle: LabelStyle {
        func makeBody(configuration: Configuration) -> some View {
            HStack{
                VStack(spacing: 3) {
                    configuration.icon
                    
                    configuration.title
                        .font(.system(size: 12))
                        .padding([.top],2)
                    
                }
            }
        }
    }
