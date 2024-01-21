import SwiftUI
import FirebaseDatabase

struct Tab2: View {
    @StateObject private var model = GeneralInfoViewModel()
    @State private var shouldNavigate = false
    
    var body: some View {
        Text("Tab 2 Content")
    }
}
