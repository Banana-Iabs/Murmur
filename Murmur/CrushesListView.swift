import SwiftUI
import FirebaseDatabase

struct CrushesListView: View {
    @StateObject private var model = CrushesListViewModel()
    
    @State private var numberOfTextFields = 1
    let maxNumberOfTextFields = 10
    @State private var isSubmitTapped = false
    @State var names: [String] = Array(repeating: "", count: 10)
    
    var body: some View {
        NavigationView {
            VStack {
                Text("List of Crushes")
                    .font(.title)
                    .padding()
                
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(0..<min(numberOfTextFields, maxNumberOfTextFields), id: \.self) { index in
                        TextField("Enter Full Name", text: $model.crushesNames[index])
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                    }
                }
                .padding(.vertical)
                
                Button(action: {
                    if numberOfTextFields < maxNumberOfTextFields {
                        numberOfTextFields += 1
                    }
                }) {
                    Text("Add Name")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                Button("Print Names") {
                    print($model.crushesNames)
                }
                Spacer()
                
                NavigationLink(destination: SubmitPage().navigationBarBackButtonHidden(true), isActive: $isSubmitTapped) {
                    EmptyView()
                }
                
                
                Button(action: {
                    isSubmitTapped = true
                    model.writeCrushesInfo()
                }) {
                    Text("SUBMIT")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
        }
    }
}
