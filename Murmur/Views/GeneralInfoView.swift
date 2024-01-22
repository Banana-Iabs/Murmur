import SwiftUI
import FirebaseDatabase

struct GeneralInfoView: View {
    @State private var shouldNavigate = false
    
    @State private var username: String = ""
    @State private var school: String = ""
    @State private var number: String = ""
    @State var isHidden = false
    
    let suggestedSchools = ["School A", "School B", "School C", "School D", "School E"]

    var body: some View {
        let viewModel = CrushesListViewModel()

        return VStack {
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

            TextField("Enter your Full Legal Name", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .font(.system(size: 23, weight: .semibold))
                .offset(CGSize(width: 0, height: -35))

            TextField("Enter your School", text: $school)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .font(.system(size: 23, weight: .semibold))
                .offset(CGSize(width: 0, height: -33))

            if !self.school.isEmpty {
                List {
                    ForEach(suggestedSchools.filter { $0.contains(school) || school.isEmpty }, id: \.self) { suggestedSchool in
                        Text(suggestedSchool)
                            .onTapGesture {
                                self.school = suggestedSchool
                            }
                    }
                }
                .frame(height: 150)
                .padding()
                .offset(y: -50)
                .opacity(isHidden ? 0 : 1)
            }

            TextField("Enter your Phone Number", text: $number)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .font(.system(size: 23, weight: .semibold))
                .offset(CGSize(width: 0, height: -33))

            NavigationLink(destination: CrushesListView(
                user: username,
                school: school,
                number: number
            ).navigationBarBackButtonHidden(true)) {
                Text("Next")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
                    .offset(CGSize(width: 0, height: -10))
            }
        }
        .padding()
    }
}
