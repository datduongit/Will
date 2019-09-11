//
//  Video.swift
//  Will
//
//  Created by Edric D. on 9/2/19.
//  Copyright © 2019 The Upside Down. All rights reserved.
//

import Foundation

public struct Video: Decodable {
    public let id: String
    public let name: String
    public let key: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, key
    }
}
