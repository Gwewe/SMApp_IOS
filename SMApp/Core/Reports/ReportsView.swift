//
//  ReportsView.swift
//  SMApp
//
//  Created by Wedna Guirand on 27/01/2025.
//

import SwiftUI

struct Report {
    let id = UUID()
    let url: String
    let desCription : String
    let createdAt : Date
    let category : Category
}

struct ReportsView: View {
    @State private var selectedReport = Report()
    
    var body: some View {
        (/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ReportsView()
}
