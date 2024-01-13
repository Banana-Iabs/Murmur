import SwiftUI
import FirebaseDatabase

class GeneralInfoViewModel: ObservableObject {
    @Published
    var username = ""
    var school = ""
    var number = ""
    
    
    private var ref = Database.database().reference()
    
    
    
    func writeGeneralInfo() {
        ref.child("users").childByAutoId().setValue(["username": username])
        ref.child("users").childByAutoId().setValue(["school": school])
        ref.child("users").childByAutoId().setValue(["number": number])
    }
}
