//
//  ProfileView.swift
//  SMApp
//
//  Created by Wedna Guirand on 25/01/2025.
//

import SwiftUI

struct ProfileView: View {
    @State private var name = ""
    
    var body: some View {
        Form {
            TextField("Enter your name", text: $name)
            if !name.isEmpty {
                Text("Welcome, \(name)!")
            }
        }
    }
}

#Preview {
    ProfileView()
}
