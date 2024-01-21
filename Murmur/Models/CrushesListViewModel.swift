//
//  CrushesListViewModel.swift
//  Murmur
//
//  Created by Teo I on 1/12/24.
//

import SwiftUI
import FirebaseDatabase

class CrushesListViewModel: ObservableObject {
    @Published
    var crushesNames: [String] = Array(repeating: "", count: 10)
    var id = NSUUID().uuidString
    var username = ""
    var school = ""
    var number = ""

    private var ref = Database.database().reference()    
    
    
    func writeCrushesInfo() {
        let userInfo = ["username": username, "school": school, "number": number, "crushes": crushesNames] as [String : Any]
        ref.child("users").child(id).setValue(userInfo)
        print(username)
    }
}
