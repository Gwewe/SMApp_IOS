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
        HStack (alignment: .center, spacing: 12) {
            Image(systemName: report.category.systemName)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .foregroundColor(report.category.color)
                .padding(.leading, 8)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(report.category.displayUIDescription)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(report.description)
                    .font(.subheadline)
                    .foregroundColor(Color("TextColor"))
                    .lineLimit(2)
                
                Text("\(report.dateCreated, style: .date)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color("BoxColor"))
        )
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.secondaryLabel), lineWidth: 2)
            )
            .padding(.horizontal)
    }
}
            struct ReportsRowView_Previews: PreviewProvider {
                static var previews: some View {
                    ReportsRowView(report: Report(
                        id: Int(),
                        url: URL(string: "https://www.test.com")!,
                        description: "This is test preview",
                        dateCreated: Date(),
                        category: .BEST_PRACTICES
                    ))
                }
            }



