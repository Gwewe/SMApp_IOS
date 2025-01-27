//
//  ReportsView.swift
//  SMApp
//
//  Created by Wedna Guirand on 25/01/2025.
//

import SwiftUI

enum Category : String, CaseIterable, Identifiable {
        case REGULATIONS = "UK Sustainability Regulations"
        case CORPORATE_INITIATIVES = "UK Corporate Sustainability Initiatives"
        case BEST_PRACTICES = "UK Case Studies and Best Practices"
    
    var id: Category {self}
    }

struct CategoryView: View {
    @State private var selectedCategory = Category.REGULATIONS
    var body: some View {
        VStack {
            Form {
                Picker("Choose a category", selection: $selectedCategory) {
                    ForEach(Category.allCases) { category in
                        Text(category.rawValue)
                    }
                    .pickerStyle(.navigationLink)
                }
            }
        }
    }
}

#Preview {
    CategoryView()
}
