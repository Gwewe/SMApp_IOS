//
//  Reports.swift
//  SMApp
//
//  Created by Wedna Guirand on 31/01/2025.
//

import Foundation

protocol ReportProtocol {
    var id : UUID { get }
    var url: URL {get set}
    var desCription : String {get set}
    var createdAt : Date {get set}
    var category : Category {get set}
    
}
