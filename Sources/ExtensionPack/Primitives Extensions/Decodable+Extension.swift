//
//  Decodable+Extension.swift
//  BookMyTrack
//
//  Created by Federico Vitale on 01/03/2020.
//  Copyright © 2020 Federico Vitale. All rights reserved.
//

import Foundation

extension Decodable {
    init(data: Data) throws {
        self = try JSONDecoder().easyDecode(data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
}

extension Encodable {
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
}
