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
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    VStack(alignment: .leading, spacing: 8){
                        
                        Text("Your Reports details")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        Spacer()
                        
                        Text(report.category.displayUIDescription)
                            .font(.subheadline)
                            .foregroundColor(.primary)
                            .padding(.horizontal, 75)
                            .padding(.vertical, 10)
                            .background(report.category.color.opacity(0.9))
                            .cornerRadius(8)
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Description")
                            .font(.headline)
                            .foregroundColor(.primary)
                        
                        Text(report.description)
                            .font(.body)
                            .foregroundColor(Color("TextColor"))
                            .multilineTextAlignment(.leading)
                    }
                    .padding()
                    .background(Color("BoxColor"))
                    .cornerRadius(10)
                    .shadow(radius: 2)
                    .padding(.horizontal)
                    
                    
                    HStack {
                        Image(systemName: "calendar")
                            .foregroundColor(Color("DateColor"))
                            
                        Text(report.dateCreated, style: .date)
                            .font(.subheadline)
                            .foregroundColor(Color("TextColor"))
                            
                        
                    }
                    .padding()
                    .background(Color("BoxColor"))
                    .cornerRadius(10)
                    .shadow(radius: 2)
                    .padding(.horizontal)
                    
                    Button(action: {
                        
                            UIApplication.shared.open(report.url)
                        }) {
                            HStack {
                                Text("Learn More")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                Image(systemName: "arrow.up.right.square.fill")
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .shadow(radius: 2)
                        }
                        .padding()
                        
                    }
                }
                .padding(.vertical, 20)
                        
            }
            
        .navigationBarTitle("SustainMate", displayMode: .inline)
        .navigationBarBackButtonHidden(false)
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
