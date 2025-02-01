//
//  Category.swift
//  SMApp
//
//  Created by Wedna Guirand on 01/02/2025.
//

import Foundation

enum ReportCategory : String, CaseIterable, Identifiable, Codable {
        case REGULATIONS
        case CORPORATE_INITIATIVES
        case BEST_PRACTICES
    
    var id: ReportCategory {self}
    
    var displayUIDescription: String {
        switch self {
            case .REGULATIONS:
            return "UK Sustainability Regulations"
        case .CORPORATE_INITIATIVES:
            return "UK Corporate Sustainability Initiatives"
        case .BEST_PRACTICES:
            return "UK Case Studies and Best Practices"
        }
    }
    }
