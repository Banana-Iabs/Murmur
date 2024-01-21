import SwiftUI
import FirebaseDatabase

struct Tab1: View {
    @StateObject private var model = GeneralInfoViewModel()
    @State private var shouldNavigate = false
    
    var body: some View {
        Text("Tab 1 Content")
    }
}
