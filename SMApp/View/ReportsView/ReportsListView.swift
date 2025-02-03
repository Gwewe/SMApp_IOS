//
//  ReportsView.swift
//  SMApp
//
//  Created by Wedna Guirand on 27/01/2025.
//

import SwiftUI

struct ReportsListView: View {
    @StateObject private var RViewModel = ReportListViewModels()
    
//    @State private var selectedReport1 = Report(url: URL(string: "https://www.wri.org/insights/net-zero-ghg-emissions-questions-answered")!, desCription: "This is a test", createdAt: Date(), category: Category.BEST_PRACTICES)
//
    var body: some View {
        NavigationView {
            Group {
                if RViewModel.isLoading {
                    LoadingView()
                } else if RViewModel.reports.isEmpty {
                    ContentUnavailableView(
                        "No reports found",
                        systemImage: "newspaper",
                        description: Text("Try to search for another report. No success this time :( !")
                    )
                } else {
                    List {
                        ForEach($RViewModel.reports) { report in
                            NavigationLink(destination: ReportDetailView(report: report.wrappedValue)) {
                                ReportsRowView(report: report.wrappedValue)
                            }
                        }
                    }
                }
            }
            //.padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            //.border(Color.red)
                .background(Color(red: 35/255, green:55/255, blue: 40/255))
                .scrollContentBackground(.hidden)
                .task {
                    try? await RViewModel.loadreports()
                }
        }
    }
}

#Preview {
    ReportsListView()
        .preferredColorScheme(.dark)
}
