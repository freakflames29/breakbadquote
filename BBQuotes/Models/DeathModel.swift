//
//  DeathModel.swift
//  BBQuotes
//
//  Created by sourav das on 07/07/24.
//

import Foundation

struct DeathModel : Decodable {
    let character : String
    let image: URL
    let details: String
    let lastWords : String
}
