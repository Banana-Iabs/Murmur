import SwiftUI
import FirebaseDatabase

struct Tab3View: View {
    @StateObject private var model = GeneralInfoViewModel()
    @State private var shouldNavigate = false
    
    var body: some View {
        Text("Tab 3 Content")
    }
}
