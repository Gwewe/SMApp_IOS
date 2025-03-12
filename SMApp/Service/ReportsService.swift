//
//  ReportsService.swift
//  SMApp
//
//  Created by Wedna Guirand on 08/02/2025.
//

import Foundation


enum NetworkError: Error {
    case badRequest
    case urlError(URLError)
    case invalidReportData
    case requestFailed(statusCode : Int)
    case decodingError
    case unknow
    var idError : String {self.localizedDescription}
}

class ReportsService {
    //    @Published var reports: [Report] = []
    //    @Published var isLoading = false
    //    @Published var error: NetworkError? = nil
    
    private let sustainMateAPI = "http://localhost:8080/api/reports"
    
    func getAllReports() async throws -> [Report] {
        guard let url = URL(string: "\(sustainMateAPI)") else {
            throw NSError(domain: "Invalid URL", code: 0)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw NSError(domain: "Invalid response", code: 0, userInfo: nil)
        }
        
        if let jsonString = String(data: data, encoding: .utf8) {
                print("Raw JSON Data (getAllReports):\n\(jsonString)")
            } else {
                print("Could not convert data to string (getAllReports)")
            }
        
        let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            return try decoder.decode([Report].self, from: data)
    }
        
    func findReportById(id: Int) async throws -> Report {
            guard let url = URL(string: "\(sustainMateAPI)/\(String(id))") else {
                throw NSError(domain: "Invalid URL", code: 0)
            }
            
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse,(200...299).contains(httpResponse.statusCode) else {
                throw NSError(domain: "Invalid response", code: 0, userInfo: nil)
            }
        
        
        if let jsonString = String(data: data, encoding: .utf8) {
               print("Raw JSON Data (findReportById):\n\(jsonString)")
           } else {
               print("Could not convert data to string (findReportById)")
           }
            
        let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            return try decoder.decode(Report.self, from: data)
        }
        
    func getAllReportByCategory (category: ReportCategory) async throws -> [Report] {
        guard let url = URL(string: "\(sustainMateAPI)/category\(category)") else {
            throw NSError(domain: "Invalid URL", code: 0)
        
    }
        let (data, response) = try await URLSession.shared.data(from: url)
                
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw NSError(domain: "Invalid response", code: 0, userInfo: nil)
        }
        
        if let jsonString = String(data: data, encoding: .utf8) {
                print("Raw JSON Data (getAllReportByCategory):\n\(jsonString)")
            } else {
                print("Could not convert data to string (getAllReportByCategory)")
            }
        
        let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
        
        return try JSONDecoder().decode([Report].self, from: data)
            
    }
        
    func searchDescriptionByKeywordReport (keyword: String, useLinearSearch: Bool = false) async throws -> [Report] {
        guard var components = URLComponents(string: "\(sustainMateAPI)/search") else {
            throw NSError(domain: "Invalid URL", code: 0)
            }
            components.queryItems = [
                URLQueryItem(name: "keyword", value: keyword),
                URLQueryItem(name: "useLinearSearch", value: String(useLinearSearch))
            ]
            
            guard let url = components.url else {
                throw NSError(domain: "Invalid URL", code: 0)
            }
            
            let (data, response) = try await URLSession.shared.data(from: url)
                
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                throw NSError(domain: "Invalid response", code: 0, userInfo: nil)
                    
                }
        
        if let jsonString = String(data: data, encoding: .utf8) {
                print("Raw JSON Data (searchDescriptionByKeywordReport):\n\(jsonString)")
            } else {
                print("Could not convert data to string (searchDescriptionByKeywordReport)")
            }
        let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
        
        return try JSONDecoder().decode([Report].self, from: data)
                
        }
        
    func createReport (report: Report) async throws -> Report {
            guard let url = URL(string: "\(sustainMateAPI)/") else {
                throw NSError(domain: "Invalid URL", code: 0)
            }
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            do {
                request.httpBody = try JSONEncoder().encode(report)
            } catch {
                throw error
            }
        
        let (data, response) = try await URLSession.shared.data(for: request)
                
        guard let httpRespnse = response as? HTTPURLResponse, httpRespnse.statusCode == 201 else {
            throw NSError(domain: "Invalid response, sorry!", code: 0, userInfo: nil)
                }
        let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
        
        return try JSONDecoder().decode(Report.self, from: data)
        }
    
    func updateReport (id: Int, report: Report) async throws -> Report {
        guard let url = URL(string: "\(sustainMateAPI)/\(String(id))") else {
            throw NSError(domain: "Invalid URL", code: 0)
        }
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            request.httpBody = try JSONEncoder().encode(report)
        } catch {
            throw error
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NSError(domain: "Invalid response", code: 0)
        }
        
        switch httpResponse.statusCode {
        case 200:
            return try JSONDecoder().decode(Report.self, from: data)
        case 404:
            throw NSError(domain: "Report Not Found, Oups!", code: 404)
        case 500:
            throw NSError(domain: "Server Error, my bad!", code: 500)
        default:
            throw NSError(domain: "Unexpected error", code: httpResponse.statusCode)
        }
    }
    
    func deleteReport (id: Int) async throws {
        guard let url = URL(string: "\(sustainMateAPI)/\(String(id))") else {
            throw NSError(domain: "Invalid URL", code: 0)
        }
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        let (_, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NSError(domain: "Invalid Response", code: 0)
        }
        
        switch httpResponse.statusCode {
        case 204:
            return
        case 404:
            throw NSError(domain: "Report Not Found so not deleted!", code: 404)
        case 500:
            throw NSError(domain: "Server Error, my bad!", code: 500)
        default:
            throw NSError(domain: "Unknown Error", code: httpResponse.statusCode)
        }
    }
        
        
        
        
        //    func fetch() async throws -> [Report] {
        //        let url = URL(string: sustainMateAPI)!
        //        do {
        //            let data = """
        //        [
        //            {
        //                "url": "https://www.wri.org/insights/net-zero-ghg-emissions-questions-answered",
        //                "description": "What Does Net-Zero Emissions Mean? Net-zero emissions, or net zero, will be achieved when all emissions released by human activities are counterbalanced by removing carbon from the atmosphere in a process known as carbon removal.",
        //                "title": "What Does Net-Zero Emissions Mean?",
        //                "category": "BEST_PRACTICES",
        //                "createdAt": "2023-03-20T00:00:00Z",
        //                "id": "1b9d6bcd-bbfd-4b2d-9b5d-ab8dfbbd4bed",
        //                "imageURL": "https://files.wri.org/d8/s3fs-public/styles/1440x550/s3/34862576473_dfc3b93516_k.webp?VersionId=rApMmUeoVvw1L9ghzV0SJPuhVPsYBJcP&h=ddc58dd3&itok=ag7NS_Vq"
        //            }
        //        ]
        //        """.data(using: .utf8)!
        //            let decoder = JSONDecoder()
        //            decoder.dateDecodingStrategy = .iso8601
        //            let reports = try decoder.decode([Report].self, from: data)
        //            //try await self.fetchReports()
        //            return reports
        //        } catch {
        //            //            print("Fetch failed: \(error)")
        //            print(error.localizedDescription)
        //            throw error
        //        }
        
}
    
