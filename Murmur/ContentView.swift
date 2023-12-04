import SwiftUI
import FirebaseDatabase

struct ContentView: View {
    @State private var isLoggedIn = false
    @State private var showInfo = false
    
    var body: some View {
        NavigationView {
            VStack {
                Image("logo")
                    .offset(CGSize(width: 0, height: -23))
                
                NavigationLink(destination: GeneralInfoView(), isActive: $isLoggedIn) {
                    EmptyView()
                }
                
                Button(action: {
                    isLoggedIn.toggle()
                }) {
                    Text("Get Started!")
                        .font(.system(size: 23, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.blue.opacity(0.65))
                                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 2)
                        )
                        .padding(.horizontal, 50)
                }
                .buttonStyle(PlainButtonStyle())
            }
            .navigationBarItems(leading: Button(action: {
                showInfo.toggle()
            }) {
                Image(systemName: "info.circle")
                    .font(.title)
            })
            .navigationBarTitle("")
            .overlay(
                Group {
                    if showInfo {
                        VStack {
                            
                            Text("Info\np")
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(Color.blue)
                                        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 2)
                                )
                            
                            Spacer()
                        }
                    }
                }
            )
        }
    }
}


class GeneralInfoViewModel: ObservableObject {
    @Published
    var username = ""
    var school = ""
    
    private var ref = Database.database().reference()
    
    func writeGeneralInfo() {
        ref.child("users").childByAutoId().setValue(["username": username])
        //ref.child("users").childByAutoId().setValue(["school": school])
    }
}
    

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

struct CrushesListView: View {
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
                        TextField("Enter Full Name", text: $names[index])
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
                    print(names)
                }
                Spacer()
                
                NavigationLink(destination: SubmitPage().navigationBarBackButtonHidden(true), isActive: $isSubmitTapped) {
                    EmptyView()
                }
                
                
                Button(action: {
                    isSubmitTapped = true
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




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
