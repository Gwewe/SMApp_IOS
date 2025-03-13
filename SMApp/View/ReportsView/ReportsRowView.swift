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
            Image(systemName: "doc.text")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .foregroundColor(Color("Background_Color"))
                .padding(.leading, 8)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(report.category.displayUIDescription)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(report.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                
                Text("\(report.dateCreated, style: .date)")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(red: 40/255, green: 70/255, blue: 45/255).opacity(0.1))
        )
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(red: 40/255, green: 70/255, blue: 45/255), lineWidth: 1)
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



