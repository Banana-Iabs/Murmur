import SwiftUI
import FirebaseDatabase

struct SubmitPage: View {
    var body: some View {
        ZStack {
            Color.green
                .edgesIgnoringSafeArea(.all)
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarBackButtonHidden(true)
            
            VStack {
                Spacer()
                
                Text("Thank you for using Murmur!")
                    .font(.system(size: 50, weight: .semibold))
                    .foregroundColor(.white)
                    .padding()
                
                Spacer()
            }
        }
    }
}
