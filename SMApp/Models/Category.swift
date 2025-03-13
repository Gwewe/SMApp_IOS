//
//  Category.swift
//  SMApp
//
//  Created by Wedna Guirand on 01/02/2025.
//

import Foundation
import SwiftUICore

enum ReportCategory : String, CaseIterable, Identifiable, Codable {
        case REGULATIONS
        case CORPORATE_INITIATIVES
        case BEST_PRACTICES
    
    var id: ReportCategory {self}
    
    var displayUIDescription: String {
        switch self {
            case .REGULATIONS:
            return "Uk Sustainability Regulations"
        case .CORPORATE_INITIATIVES:
            return "UK Corporate Sustainability Initiatives"
        case .BEST_PRACTICES:
            return "Uk Case Studies and Best Practices"
        }
    }
    
    var systemName: String {
        switch self {
            case .REGULATIONS: return "building.columns.fill"
            case .CORPORATE_INITIATIVES: return "building.2.fill"
        case .BEST_PRACTICES: return "person.badge.shield.checkmark.fill"
            
        }
    }
    
    var color: Color {
        switch self {
        case .REGULATIONS: return Color("RegulationColor")
        case .CORPORATE_INITIATIVES: return Color("CorporateColor")
        case .BEST_PRACTICES: return Color("PracticeColor")
            
        }
    }
}
