//
//  CharectorModel.swift
//  BBQuotes
//
//  Created by sourav das on 07/07/24.
//

import Foundation

struct CharectorModel : Decodable{
    let name  : String
    let birthday : String
    let occupations : [String]
    let images :  [URL]
    let aliases : [String]
    let status :  String
    let portrayedBy : String
    var death : DeathModel?
    
    enum CodingKeys: CodingKey {
        case name
        case birthday
        case occupations
        case images
        case aliases
        case status
        case portrayedBy
        
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.birthday = try container.decode(String.self, forKey: .birthday)
        self.occupations = try container.decode([String].self, forKey: .occupations)
        self.images = try container.decode([URL].self, forKey: .images)
        self.aliases = try container.decode([String].self, forKey: .aliases)
        self.status = try container.decode(String.self, forKey: .status)
        self.portrayedBy = try container.decode(String.self, forKey: .portrayedBy)
        
        let jsonDeccoder = JSONDecoder()
        jsonDeccoder.keyDecodingStrategy = .convertFromSnakeCase
        let data = try Data(contentsOf: Bundle.main.url(forResource: "sampledeath", withExtension: "json")!)
        self.death = try jsonDeccoder.decode(DeathModel.self, from: data)
        
    }
    
}
