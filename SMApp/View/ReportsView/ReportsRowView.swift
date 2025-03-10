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
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                Text(report.description)
                    .font(.title)
                    .foregroundColor(.primary)
            }
            
            Spacer()
                .padding(.vertical, 4)
        }
    }
}

#Preview {
    ReportsRowView(report: Report(
        id: Int(),
        url: URL(string: "https://www.test.com")!,
        description: "This is test preview",
        dateCreated: Date(),
        category: .BEST_PRACTICES
    ))
}


