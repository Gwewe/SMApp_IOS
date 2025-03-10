//
//  Reports.swift
//  SMApp
//
//  Created by Wedna Guirand on 31/01/2025.
//

import Foundation

// 1. The Report Protocol. Protocols are a way of describing what properties and methods something must have.
protocol ReportProtocol : Identifiable {
    var id : Int { get }
    var url: URL {get set}
//    var title : String {get set} to be added later as not present in java api
    var description : String {get set}
    var dateCreated : Date {get set}
    var category : ReportCategory {get set}
    
}

// 2. The Report Struct
struct Report : ReportProtocol, Codable {
    var id: Int
    var url: URL
//    var title : String to be added later
    var description : String
    var dateCreated : Date
    var category : ReportCategory
    
    // The enum CodingKey
    enum CodingKeys: String, CodingKey {
        case id, url /*, title*/, description, dateCreated, category
    }
    
    //3. Init for the report instance.
    init(id: Int, url: URL, /*title: String,*/ description: String, dateCreated: Date, category: ReportCategory) {
        self.id = id
        self.url = url
//        self.title = title
        self.description = description
        self.dateCreated = dateCreated
        self.category = category
    }
    
    //4. Init for JSON decoding
    init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        url = try values.decode(URL.self, forKey: .url)
//        title = try values.decodeIfPresent(String.self, forKey: .title) ?? " "
        description = try values.decode(String.self, forKey: .description)
        dateCreated = try values.decode(Date.self, forKey: .dateCreated)
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
//        try container.encode(title, forKey: .title)
        try container.encode(description, forKey: .description)
        try container.encode(dateCreated, forKey: .dateCreated)
        try container.encode(category, forKey: .category)
    }
    

    static  let sampleReport: Report = {
        let json = """
            {
                "url": "https://www.wri.org/insights/net-zero-ghg-emissions-questions-answered",
                "description": "What Does 'Net-Zero Emissions' Mean? Net-zero emissions, or “net zero,” will be achieved when all emissions released by human activities are counterbalanced by removing carbon from the atmosphere in a process known as carbon removal.",
                "title": "What Does Net-Zero Emissions Mean?",
                "category": "BEST_PRACTICES",
                "dateCreated": "2023-03-20T00:00:00Z",
                "id": "1b9d6bcd-bbfd-4b2d-9b5d-ab8dfbbd4bed",
                "imageURL": "https://files.wri.org/d8/s3fs-public/styles/1440x550/s3/34862576473_dfc3b93516_k.webp?VersionId=rApMmUeoVvw1L9ghzV0SJPuhVPsYBJcP&h=ddc58dd3&itok=ag7NS_Vq"
            }
        """.data(using: .utf8)!
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let report = try! decoder.decode(Report.self, from: json)
        
        return report
        
    }()
    // to add later, this is a test report
//    var reportOne = Report(url: URL(string: "https://www.wri.org/insights/net-zero-ghg-emissions-questions-answered")!, title: "What Does 'Net-Zero Emissions' Mean?", desCription: "Net-zero emissions will be achieved when all emissions released by human activities are counterbalanced by removing carbon from the atmosphere.", createdAt: Date(), category: .BEST_PRACTICES)
}
