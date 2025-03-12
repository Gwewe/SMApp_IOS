//
//  ReportDetailView.swift
//  SMApp
//
//  Created by Wedna Guirand on 02/02/2025.
//

import SwiftUI

struct ReportDetailView: View {
    let report: Report
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(report.description)
                    .font(.title2)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                
                HStack {
                    Label {
                        Text(report.category.displayUIDescription)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    } icon: {
                        Image(systemName: "tree")
                            .foregroundColor(.green)
                    }
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("URL: ")
                        .font(.headline)
                    Text(report.url.absoluteString)
                        .foregroundColor(.blue)
                        .underline()
                        .onTapGesture {
                            UIApplication.shared.open(report.url)
                        }
                }
                
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(Color(red: 45/255, green:80/255, blue: 55/255))
                    Text(report.dateCreated, style: .date)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                }
                .padding()
            }
            .navigationBarTitle("Report Details", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action: {
                dismiss()
            }) {
                HStack {
                    Image(systemName: "chevron.left")
                    Text("Back")
                }
            })
        }
    }
    
    struct ReportDetailView_Previews: PreviewProvider {
        static var previews: some View {
            ReportDetailView(report: Report(
                id: Int(),
                url: URL(string: "https://www.test.com")!,
                description: "This is test preview",
                dateCreated: Date(),
                category: .BEST_PRACTICES
            ))
        }
    }
}
