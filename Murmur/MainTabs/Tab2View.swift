import SwiftUI
import FirebaseDatabase

struct Tab2View: View {
    @StateObject private var model = GeneralInfoViewModel()
    @State private var shouldNavigate = false
    
    var body: some View {
        Text("Tab 2 Content")
    }
}
