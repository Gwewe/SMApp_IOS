//
//  ReportListViewModels.swift
//  SMApp
//
//  Created by Wedna Guirand on 02/02/2025.
//

import Foundation


class ReportListViewModels : ObservableObject{
    @Published var reports: [Report] = []
    @Published var isLoading = false
    @Published var errorMess: String?
    
    let service = ReportsService()
     
    @MainActor
    func loadreports() async {
        isLoading = true
        errorMess = nil
    
        do {
            reports = try await service.getAllReports()
        } catch let error as NSError {
            errorMess = error.localizedDescription
        } catch {
            errorMess = "An unknowm error occured, oh my!"
        }
        isLoading = false
    }
}
