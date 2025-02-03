//
//  ReportsRowView.swift
//  SMApp
//
//  Created by Wedna Guirand on 03/02/2025.
//

import SwiftUI

struct ReportsRowView: View {
    let report: Report
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(report.title)
                .font(.title)
                .foregroundColor(.primary)
            
            Text(report.category.displayUIDescription)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        
        Spacer()
            .padding(.vertical, 4)
    }
}

#Preview {
    ReportsRowView(report: Report(
        id: UUID(),
        url: URL(string: "https://www.test.com")!,
        title: "Test preview",
        reportDesription: "This is test preview",
        createdAt: Date(),
        category: .BEST_PRACTICES
    ))
}
