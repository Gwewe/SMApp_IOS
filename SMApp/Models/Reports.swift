//
//  Reports.swift
//  SMApp
//
//  Created by Wedna Guirand on 31/01/2025.
//

import Foundation

// 1. The Report Protocol. Protocols are a way of describing what properties and methods something must have.
protocol ReportProtocol : Identifiable {
    var id : UUID { get }
    var url: URL {get set}
    var title : String {get set}
    var reportDesription : String {get set}
    var createdAt : Date {get set}
    var category : ReportCategory {get set}
    
}

// 2. The Report Struct
struct Report : ReportProtocol, Codable {
    var id = UUID()
    var url: URL
    var title : String
    var reportDesription : String
    var createdAt : Date
    var category : ReportCategory
    
    // The enum CodingKey
    enum CodingKeys: String, CodingKey {
        case id, url, title, reportDesription, createdAt, category
    }
    
    //3. Init for the report instance.
    init(id: UUID, url: URL, title: String, reportDesription: String, createdAt: Date, category: ReportCategory) {
        self.id = UUID()
        self.url = url
        self.title = title
        self.reportDesription = reportDesription //optional
        self.createdAt = createdAt
        self.category = category
    }
    
    //4. Init for JSON decoding
    init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(UUID.self, forKey: .id)
        url = try values.decode(URL.self, forKey: .url)
        title = try values.decode(String.self, forKey: .title)
        reportDesription = try values.decode(String.self, forKey: .reportDesription)
        createdAt = try values.decode(Date.self, forKey: .createdAt)
        category = try values.decode(ReportCategory.self, forKey: .category)
    }
    
//    // 5. handling optional case for reportDescription
//    let reportDescription = try values.decode(String?.self, forKey: .reportDescription)
//    if let selectedreportDescription = reportDescription, let desC = reportDescription (String : reportDescription)
// could not figure it how to write optional handle case for reportDesription, ask lucy for help
//    }
    
    // 6. function for json encoding
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(url, forKey: .url)
        try container.encode(title, forKey: .title)
        try container.encode(reportDesription, forKey: .reportDesription)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(category, forKey: .category)
    }
    

    // to add later, this is a test report
//    var reportOne = Report(url: URL(string: "https://www.wri.org/insights/net-zero-ghg-emissions-questions-answered")!, title: "What Does 'Net-Zero Emissions' Mean?", desCription: "Net-zero emissions will be achieved when all emissions released by human activities are counterbalanced by removing carbon from the atmosphere.", createdAt: Date(), category: .BEST_PRACTICES)
}
