//
//  ReportsView.swift
//  SMApp
//
//  Created by Wedna Guirand on 27/01/2025.
//

import SwiftUI

struct Report {
    let id = UUID()
    let url: URL
    let desCription : String
    let createdAt : Date
    let category : Category
}

struct ReportsView: View {
    @State private var selectedReport1 = Report(url: URL(string: "https://www.wri.org/insights/net-zero-ghg-emissions-questions-answered")!, desCription: "This is a test", createdAt: Date(), category: Category.BEST_PRACTICES)
    
    
    var body: some View {
        Link(destination: selectedReport1.url) {
            Text(selectedReport1.desCription)
        }
    }
}

#Preview {
    ReportsView()
}
