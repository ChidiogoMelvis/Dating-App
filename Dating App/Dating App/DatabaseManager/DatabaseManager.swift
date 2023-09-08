//
//  DatabaseManager.swift
//  Dating App
//
//  Created by Mac on 06/09/2023.
//

import Foundation
import FirebaseDatabase

class DatabaseManager {
    static let shared = DatabaseManager()
        
    let database = Database.database().reference()
    
   
    func test() {
        database.child("user").setValue(["name": "John Doe"])
    }


}

