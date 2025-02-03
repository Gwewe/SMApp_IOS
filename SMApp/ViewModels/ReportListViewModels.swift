//
//  ReportListViewModels.swift
//  SMApp
//
//  Created by Wedna Guirand on 02/02/2025.
//

import Foundation


class ReportListViewModels : ObservableObject{
    @Published var reports: [Report] = []
    @Published var isLoading = true
    @Published var errorMess: Error?
     
    @MainActor
    func loadreports() async throws {
        isLoading = true
        errorMess = nil
        
        let mockReport: [Report] = [
            Report(
                id: UUID(),
                url: URL(string: "https://www.test.com")!,
                title: "Test Report 1",
                reportDesription: "This is a test report",
                createdAt: Date(),
                category: .BEST_PRACTICES),
            
            Report(
                id: UUID(),
                url: URL(string: "www.test2.com")!,
                title: "Test Report 2",
                reportDesription: "This is a test report again",
                createdAt: Date(),
                category: .REGULATIONS)
            
        ]
        reports = mockReport
        isLoading = false
    }
}
