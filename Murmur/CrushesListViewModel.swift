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

    private var ref = Database.database().reference()
    
    func writeCrushesInfo() {
        let userInfo = crushesNames
        ref.child("users").child(id).setValue(userInfo)
    }
}
