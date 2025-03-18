//
//  ReportsView.swift
//  SMApp
//
//  Created by Wedna Guirand on 27/01/2025.
//

import SwiftUI

struct ReportsListView: View {
    @StateObject private var RViewModel = ReportListViewModels()
    
    var body: some View {
        NavigationView {
            VStack {
                if RViewModel.isLoading {
                    LoadingView()
                } else if let error = RViewModel.errorMess {
                    Text("Error: \(error)")
                        .foregroundColor(.red)
                        .padding()
                } else if RViewModel.reports.isEmpty {
                    ContentUnavailableView(
                        "No reports found",
                        systemImage: "newspaper",
                        description: Text("Try to search for another report. No success this time :( !")
                    )
                } else {
                    List {
                        ForEach(RViewModel.reports) { report in
                            NavigationLink(destination: ReportDetailView(report: report)) {
                                ReportsRowView(report: report)
                            }
                            
                        }
                    }
                }
            }
//            .refreshable {
//                Task {
//                    try? await Task.sleep(nanoseconds: 1000000)
//                    await RViewModel.loadreports()
//                }
//            }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            //.border(Color.red)
                .background(Color("Background_Green"))
                .scrollContentBackground(.hidden)
                .task {
                    await RViewModel.loadreports()
                }
                .navigationTitle("Reports")
        }
    }
}

#Preview {
    ReportsListView()
        .preferredColorScheme(.dark)
}


// if you want to have admin user (var isAdmin: Bool)
// create a user object inject it into views using EnironmentObject
// read it from Enviromnment
// show add report button is user is Admin
// look into onDelete modifier for List - work out how to disbale delete if user not admin
