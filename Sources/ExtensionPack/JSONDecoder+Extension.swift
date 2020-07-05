//
//  JSONDecoder+Extension.swift
//  BookMyTrack
//
//  Created by Federico Vitale on 01/03/2020.
//  Copyright © 2020 Federico Vitale. All rights reserved.
//

import Foundation


public extension JSONDecoder {
    func easyDecode<T: Decodable>(_ data: Data) throws -> T {
        do {
            return try decode(T.self, from: data)
        } catch let DecodingError.dataCorrupted(context) {
            print(context)
            throw DecodingError.dataCorrupted(context)
        } catch let DecodingError.keyNotFound(key, context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
            
            throw DecodingError.keyNotFound(key, context)
        } catch let DecodingError.valueNotFound(value, context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
            
            throw DecodingError.valueNotFound(value, context)
        } catch let DecodingError.typeMismatch(type, context)  {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
            
            throw DecodingError.typeMismatch(type, context)
        } catch {
            print("error: ", error)
            throw error
        }
    }
}
