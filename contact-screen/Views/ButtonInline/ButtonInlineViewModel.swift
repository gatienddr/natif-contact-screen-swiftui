import Foundation
import SwiftUI

class ButtonInlineViewModel: ObservableObject {
    
    var title: String
    var systemImage: String
    
    init(title: String, systemImage: String){
        self.title = title
        self.systemImage = systemImage
    }

}
