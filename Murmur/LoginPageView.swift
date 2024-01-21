import SwiftUI
import FirebaseDatabase

struct LoginPageView: View {
    @StateObject private var model = GeneralInfoViewModel()
    @State private var shouldNavigate = false
    
    var body: some View {
        VStack {
            Image("page")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 300)
                .padding(.bottom, 20)
            
            Text("Log In")
                .font(Font.custom("ComicSansMS", size: 32))
                .foregroundColor(.purple)
                .padding()
                .offset(CGSize(width: 0, height: -40))
            
            TextField("Username", text: $model.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .font(.system(size: 23, weight: .semibold))
                .offset(CGSize(width: 0, height: -35))
            
            TextField("Password", text: $model.school)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .font(.system(size: 23, weight: .semibold))
                .offset(CGSize(width: 0, height: -33))
            
            NavigationLink(destination: SubmitPage(), isActive: $shouldNavigate) {
                Text("Log In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
                    .offset(CGSize(width: 0, height: -10))
                    .onTapGesture {
                        model.writeGeneralInfo()
                        shouldNavigate = true
                    }
            }
        }
        Spacer()
        .padding()
    }
}
