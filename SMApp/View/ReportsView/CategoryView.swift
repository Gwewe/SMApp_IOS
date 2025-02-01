//
//  ReportsView.swift
//  SMApp
//
//  Created by Wedna Guirand on 25/01/2025.
//

//import SwiftUI
//
//enum Category : String, CaseIterable, Identifiable {
//        case REGULATIONS
//        case CORPORATE_INITIATIVES
//        case BEST_PRACTICES
//    
//    var id: Category {self}
//    var description: String {
//        switch self {
//            case .REGULATIONS:
//            return "UK Sustainability Regulations"
//        case .CORPORATE_INITIATIVES:
//            return "UK Corporate Sustainability Initiatives"
//        case .BEST_PRACTICES:
//            return "UK Case Studies and Best Practices"
//        }
//    }
//    }
//
//struct CategoryView: View {
//    @State private var selectedCategory = Category.REGULATIONS
//    var body: some View {
//        VStack {
//            Form {
//                Picker("Choose a category", selection: $selectedCategory) {
//                    ForEach(Category.allCases) { category in
//                        Text(category.description)
//                    }
//                    .pickerStyle(.inline)
//                }
//                /*ReportsView*/()
//            }
//        }
//    }
//}
//
//#Preview {
//    CategoryView()
//}
