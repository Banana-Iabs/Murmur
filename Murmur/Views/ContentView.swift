import SwiftUI
import FirebaseDatabase

struct ContentView: View {
    @State private var newUser = false
    @State private var oldUser = false
    @State private var showInfo = false
    
    var body: some View {
        NavigationView {
            VStack {
                
                Image("logo").offset(CGSize(width: 0, height: -23))
                
                NavigationLink(destination: GeneralInfoView(), isActive: $newUser) {
                    EmptyView()
                }
                
                NavigationLink(destination: LoginPageView(), isActive: $oldUser) {
                    EmptyView()
                }
                
                Button(action: {newUser.toggle()}) {
                    Text("Sign Up")
                        .font(.system(size: 23, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.blue.opacity(0.65))
                                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 2)
                        ).padding(.horizontal, 50)
                }.buttonStyle(PlainButtonStyle())
                
                Spacer().frame(height: 20)
                
                Button(action: {oldUser.toggle()}) {
                    Text("Log In")
                        .font(.system(size: 23, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.blue.opacity(0.65))
                                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 2)
                        ).padding(.horizontal, 50)
                }.buttonStyle(PlainButtonStyle())
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
