import SwiftUI
import FirebaseDatabase

struct CrushesListView: View {
    @StateObject private var model = CrushesListViewModel()
    
    @State private var numberOfTextFields = 1
    let maxNumberOfTextFields = 10
    @State private var isSubmitTapped = false
    @State private var showErrorAlert = false
    
    @State private var user: String
    @State private var school: String
    @State private var number: String

    init(user: String, school: String, number: String) {
        _user = State(initialValue: user)
        _school = State(initialValue: school)
        _number = State(initialValue: number)
    }

    var body: some View {
        NavigationView {
            VStack {
                Text("List of Crushes").font(.title).padding()
                
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(0..<min(numberOfTextFields, maxNumberOfTextFields), id: \.self) { index in
                        TextField("Enter Full Name", text: $model.crushesNames[index])
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                    }
                }.padding(.vertical)
                
                Button(action: {
                    if numberOfTextFields < maxNumberOfTextFields {
                        numberOfTextFields += 1
                        model.addName()
                    }
                }) {Text("Add Name").padding().background(Color.blue).foregroundColor(.white).cornerRadius(8)}
                
                Spacer()
                
                NavigationLink(destination: SubmitPageView().navigationBarBackButtonHidden(true), isActive: $isSubmitTapped) {
                    EmptyView()
                }
                
                Button(action: {
                    model.crushesNames.removeAll { $0.isEmpty }
                    isSubmitTapped = true
                    model.writeCrushesInfo()
                    }) {Text("SUBMIT").padding().background(Color.green).foregroundColor(.white).cornerRadius(8)
                }
                .disabled(model.crushesNames.contains { $0.isEmpty })

            }.padding()
            .onAppear {
                model.username = user
                model.school = school
                model.number = number
            }
        }
    }
}

