//
//  ReportDetailView.swift
//  SMApp
//
//  Created by Wedna Guirand on 02/02/2025.
//

import SwiftUI

struct ReportDetailView: View {
    let report: Report
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                Text("\(report.title)")
                    .font(.title)
                    .bold()
                
                Text("Description: \(report.reportDesription)")
                                    .font(.headline)
                                    .foregroundColor(.gray)
                
                Text("Date: \(report.createdAt, style: .date)")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                Text("Category: \(report.category)")
                    .font(.headline)
                    .foregroundColor(.gray)
                
            }
            .padding()
        }
        .navigationTitle("Report Details")
    }
}

#Preview {
    ReportDetailView(report: Report(
        id: UUID(),
        url: URL(string: "https://www.test.com")!,
        title: "Test preview",
        reportDesription: "This is test preview",
        createdAt: Date(),
        category: .BEST_PRACTICES
    ))
}
