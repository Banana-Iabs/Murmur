import SwiftUI
import FirebaseDatabase

struct GeneralInfoView: View {
    @StateObject private var model = GeneralInfoViewModel()
    @State private var shouldNavigate = false
    
    var body: some View {
        VStack {
            Image("page")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 300)
                .padding(.bottom, 20)
            
            Text("General Information")
                .font(Font.custom("ComicSansMS", size: 32))
                .foregroundColor(.purple)
                .padding()
                .offset(CGSize(width: 0, height: -40))
            
            TextField("Enter your Full Legal Name", text: $model.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .font(.system(size: 23, weight: .semibold))
                .offset(CGSize(width: 0, height: -35))
            
            TextField("Enter your school", text: $model.school)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .font(.system(size: 23, weight: .semibold))
                .offset(CGSize(width: 0, height: -33))
            
            TextField("Enter your Phone Number", text: $model.number)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .font(.system(size: 23, weight: .semibold))
                .offset(CGSize(width: 0, height: -33))
            
            NavigationLink(destination: CrushesListView().navigationBarBackButtonHidden(true), isActive: $shouldNavigate) {
                Text("Next")
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
